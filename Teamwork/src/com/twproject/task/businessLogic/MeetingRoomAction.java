/**
 * 
 */
package com.twproject.task.businessLogic;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.jblooming.ApplicationException;
import org.jblooming.agenda.CompanyCalendar;
import org.jblooming.agenda.Period;
import org.jblooming.designer.DesignerField;
import org.jblooming.messaging.Listener;
import org.jblooming.messaging.MessagingSystem;
import org.jblooming.messaging.SomethingHappened;
import org.jblooming.ontology.businessLogic.DeleteHelper;
import org.jblooming.oql.OqlQuery;
import org.jblooming.oql.QueryHelper;
import org.jblooming.page.HibernatePage;
import org.jblooming.page.ListPage;
import org.jblooming.persistence.PersistenceHome;
import org.jblooming.persistence.exceptions.PersistenceException;
import org.jblooming.persistence.exceptions.StoreException;
import org.jblooming.security.Area;
import org.jblooming.security.SecurityException;
import org.jblooming.utilities.DateUtilities;
import org.jblooming.utilities.HashTable;
import org.jblooming.utilities.JSP;
import org.jblooming.utilities.StringUtilities;
import org.jblooming.waf.ActionUtilities;
import org.jblooming.waf.exceptions.ActionException;
import org.jblooming.waf.html.button.ButtonLink;
import org.jblooming.waf.html.display.DataTable;
import org.jblooming.waf.html.display.Paginator;
import org.jblooming.waf.settings.ApplicationState;
import org.jblooming.waf.settings.I18n;
import org.jblooming.waf.state.PersistentSearch;
import org.jblooming.waf.view.RestState;

import com.twproject.operator.TeamworkOperator;
import com.twproject.rank.EntityGroupRank;
import com.twproject.rank.Hit;
import com.twproject.rank.RankUtilities;
import com.twproject.resource.Person;
import com.twproject.resource.Resource;
import com.twproject.security.TeamworkPermissions;
import com.twproject.task.Assignment;
import com.twproject.task.MeetingRoom;
import com.twproject.task.MeetingRoomBricks;
import com.twproject.task.MeetingRoomHistory;
import com.twproject.task.MeetingRoomStatus;
import com.twproject.task.MyTeamworkPermissions;
import com.twproject.task.Task;

/**
 * TODO
 * @author WangXi
 * @create May 13, 2017
 */
public class MeetingRoomAction extends org.jblooming.waf.ActionSupport {

	public TeamworkOperator logged;
	public MeetingRoom meetingRoom;

	/**
	 * @param restState
	 */
	public MeetingRoomAction(RestState restState) {
		super(restState);
		logged = ((TeamworkOperator) restState.getLoggedOperator());
	}

	public void cmdAdd(boolean isAClone) throws PersistenceException, SecurityException {
		meetingRoom = new MeetingRoom();
		meetingRoom.setIdAsNew();
		restState.setMainObject(meetingRoom);

		ActionUtilities.setIdentifiable(restState.getEntry("MEETINGROOM_TASK"), meetingRoom, "task");

		Person person = logged.getPerson();

		if (meetingRoom.getTask() != null) {
			meetingRoom.testPermission(logged, MyTeamworkPermissions.meetingRoom_canCreate);
			restState.addClientEntry("ASSIGNEE_FILTER", "ASSIGNEE_FROM_TASK");
		}
		meetingRoom.setGravity("02_GRAVITY_MEDIUM");
		meetingRoom.setOwner(logged);

		if (!isAClone) {
			// restState.addClientEntry("ASSIGNED_BY", person.getId());
			restState.addClientEntry("MEETINGROOM_STATUS", MeetingRoomStatus.getStatusOpen());
			// restState.addClientEntry("MEETINGROOM_DATE_SIGNALLED", new
			// Date());
		}

		meetingRoom.bricks.buildPassport(restState);
	}

	public MeetingRoom editNoMake() throws PersistenceException, SecurityException {
		meetingRoom = MeetingRoom.load(restState.getMainObjectId() + "");
		meetingRoom.testPermission(logged, MyTeamworkPermissions.meetingRoom_canRead);
		restState.setMainObject(meetingRoom);
		meetingRoom.bricks.buildPassport(restState);
		com.twproject.rank.Hit.getInstanceAndStore(meetingRoom, logged, 0.1D);
		return meetingRoom;
	}

	public void cmdEdit() throws PersistenceException, SecurityException {
		editNoMake();
		SecurityException.riseExceptionIfNoPermission(meetingRoom.bricks.canRead,
				MyTeamworkPermissions.meetingRoom_canRead,
				meetingRoom);
		make(meetingRoom);
	}

	public void cmdGuess() throws PersistenceException, SecurityException, ActionException {
		this.meetingRoom = null;
		if ("yes".equalsIgnoreCase(ApplicationState.getApplicationSetting("USECODEONMEETINGROOMS"))) {
			try {
				this.meetingRoom = ((MeetingRoom) PersistenceHome.findUnique(MeetingRoom.class, "code",
						this.restState.mainObjectId));
			} catch (PersistenceException p) {
				throw new ActionException("REF_NOT_UNIQUE");
			}
		}
		if (this.meetingRoom == null) {
			this.meetingRoom = MeetingRoom.load(this.restState.getMainObjectId() + "");
		}
		if (this.meetingRoom != null) {
			this.restState.mainObjectId = this.meetingRoom.getId();
			editNoMake();
			if (!this.meetingRoom.bricks.canRead) {
				throw new ActionException("REF_PERMISSION_LACKING");
			}
			this.restState.mainObjectId = this.meetingRoom.getId();
			make(this.meetingRoom);

			this.restState.addClientEntry("MEETINGROOM_ID", this.meetingRoom.getId());
			cmdFind();
		} else {
			throw new ActionException("REF_NOT_FOUND");
		}
	}

	private void make(MeetingRoom meetingRoom) throws PersistenceException {

		restState.addClientEntry("MEETINGROOM_NAME", meetingRoom.getTask());
		restState.addClientEntry("MEETINGROOM_TASK", meetingRoom.getTask());
		restState.addClientEntry("MEETINGROOM_ID", meetingRoom.getId());
		restState.addClientEntry("MEETINGROOM_TYPE", meetingRoom.getType());
		restState.addClientEntry("MEETINGROOM_GRAVITY", meetingRoom.getGravity());

		String hql = "select listener from " + Listener.class.getName()
				+ " as listener where listener.owner=:own and listener.identifiableId=:iid and listener.theClass=:tcl";
		QueryHelper listenerQH = new QueryHelper(hql);
		listenerQH.addParameter("own", logged);
		listenerQH.addParameter("iid", meetingRoom.getId().toString());
		listenerQH.addParameter("tcl", MeetingRoom.class.getName());
		Listener l = (Listener) listenerQH.toHql().uniqueResultNullIfEmpty();
		if (l != null) {
			List<String> medias = StringUtilities.splitToList(l.getMedia(), ",");
			for (String media : medias) {
				restState.addClientEntry("MEETINGROOM_SUBSCRIBE_CLOSE_" + media, "yes");
			}
		}
	}

	public boolean cmdSave() throws PersistenceException, ActionException, ApplicationException, SecurityException {
		Resource previousAssignee = null;

		this.meetingRoom = null;
		TeamworkOperator teamworkOperator = this.logged;
		Person loggedPerson = teamworkOperator.getPerson();
		if (PersistenceHome.NEW_EMPTY_ID.equals(this.restState.mainObjectId)) {
			this.meetingRoom = new MeetingRoom();
			this.meetingRoom.setIdAsNew();
			this.meetingRoom.setOwner(this.logged);
		} else {
			this.meetingRoom = MeetingRoom.load(this.restState.getMainObjectId() + "");
			this.meetingRoom.bricks.buildPassport(this.restState);
		}
		MeetingRoomHistory history = new MeetingRoomHistory(this.meetingRoom);

		String oldMeetingRoom = this.meetingRoom.getAbstractForIndexing();

		this.restState.setMainObject(this.meetingRoom);

		boolean isNew = this.meetingRoom.isNew();

		ActionUtilities.setString(this.restState.getEntryAndSetRequired("DESCRIPTION"), this.meetingRoom,
				"description");
		try {
			this.meetingRoom
					.setDescription(this.restState.getEntryAndSetRequired("DESCRIPTION").stringValue());
		} catch (ActionException localActionException) {
		}

		this.meetingRoom.setName(this.restState.getEntryAndSetRequired("NAME").stringValue());

		Task oldTask = this.meetingRoom.getTask();
		ActionUtilities.setIdentifiable(this.restState.getEntry("MEETINGROOM_TASK"), this.meetingRoom, "task");
		if ((oldTask != null) && (!oldTask.equals(this.meetingRoom.getTask()))) {
			// oldTask.updateMeetingRoomTotals();
		}
		if (isNew) {
			this.meetingRoom.testPermission(this.logged, MyTeamworkPermissions.meetingRoom_canCreate);
		} else {
			this.meetingRoom.testPermission(this.logged, MyTeamworkPermissions.meetingRoom_canWrite);
		}
		// ActionUtilities.setString(this.restState.getEntry("MEETINGROOM_ID"),
		// this.meetingRoom, "id");
		ActionUtilities.setString(this.restState.getEntry("MEETINGROOM_GRAVITY"), this.meetingRoom, "gravity");
		ActionUtilities.setIdentifiable(this.restState.getEntry("MEETINGROOM_TYPE"), this.meetingRoom, "type");

		ActionUtilities.setIdentifiable(restState.getEntry("MEETINGROOM_TASK"), meetingRoom, "task");

		if ((oldTask != null) && (!oldTask.equals(meetingRoom.getTask()))) {
			oldTask.markAsDirty();
		}
		// try {
		// ClientEntry ce =
		// this.restState.getEntry("MEETINGROOM_DATE_CLOSE_BY");
		// Date date = ce.dateValue();
		// if ((date != null) && (this.meetingRoom.getTask() != null)
		// && (this.meetingRoom.getTask().getSchedule() != null)
		// && (!this.meetingRoom.getTask().getSchedule().contains(date))) {
		// ce.errorCode = (I18n.get("CLOSE_BY_OUT_OF_TASK_SCOPE") + ": "
		// + this.meetingRoom.getTask().getDisplayName() + " "
		// +
		// DateUtilities.dateToString(this.meetingRoom.getTask().getSchedule().getStartDate())
		// + " - "
		// +
		// DateUtilities.dateToString(this.meetingRoom.getTask().getSchedule().getEndDate()));
		// }
		// this.meetingRoom.setShouldCloseBy(date);
		// } catch (ParseException localParseException) {
		// }
		DesignerField.saveCustomFields("MEETINGROOM_CUSTOM_FIELD_", 6, this.meetingRoom, this.restState);

		this.meetingRoom.setArea(teamworkOperator);
		if (("yes".equalsIgnoreCase(ApplicationState.getApplicationSetting("USEUNIQUECODES")))
				&& (JSP.ex(this.meetingRoom.getId())) && (!this.meetingRoom.isUnique("code"))) {
			this.restState.getEntry("MEETINGROOM_CODE").errorCode = I18n.get("KEY_MUST_BE_UNIQUE");
		}
		MeetingRoomStatus newStatus = MeetingRoomStatus
				.load(Integer.valueOf(this.restState.getEntry("MEETINGROOM_STATUS").intValueNoErrorCodeNoExc()));
		if (newStatus == null) {
			newStatus = MeetingRoomStatus.getStatusOpen();
		}
		MeetingRoomStatus oldStatus = this.meetingRoom.getStatus();

		this.meetingRoom.setStatus(newStatus);


		// if (!isNew) {
		// long durationDelta = this.meetingRoom.getEstimatedDuration() -
		// this.meetingRoom.getWorklogDone();
		// if (durationDelta >= 0L) {
		// this.restState.addClientEntryTime("MEETINGROOM_WORKLOG_DELTA_ESTIMATED_TIME",
		// Long.valueOf(durationDelta));
		// }
		// }
		// if (isNew) {
		// String s =
		// this.restState.getEntry("PENDING_PF").stringValueNullIfEmpty();
		// if (JSP.ex(s)) {
		// JSONArray jsa = JSONArray.fromObject(s);
		// for (Object o : jsa) {
		// String uid = o.toString();
		// PersistentFile pf = PersistentFile.deserialize(uid);
		// if (pf != null) {
		// this.meetingRoom.addFile(pf);
		// }
		// }
		// }
		// if (JSP.ex(this.restState.getEntry("TEMP_ORDER"))) {
		// int pos =
		// this.restState.getEntry("TEMP_ORDER").intValueNoErrorCodeNoExc();
		// boolean orderByResource = "BY_RESOURCE"
		// .equals(this.restState.getEntry("SORT_FLAVOUR").stringValueNullIfEmpty());
		// if (orderByResource) {
		// this.meetingRoom.setOrderFactorByResource(pos);
		// } else {
		// this.meetingRoom.setOrderFactor(pos);
		// }
		// }
		// }
		if (this.restState.validEntries()) {
			if (PersistenceHome.NEW_EMPTY_ID.equals(this.restState.mainObjectId)) {
				this.meetingRoom.setOwner(this.logged);
			}
			String tags = this.restState.getEntry("MEETINGROOM_TAGS").stringValueNullIfEmpty();
			if (JSP.ex(tags)) {
				String[] taggi = tags.split(",");
				String twitterCall = null;
				for (String tag : taggi) {
					if ("@twitter".equalsIgnoreCase(tag.trim())) {
						twitterCall = tag.trim();
					}
				}
				// if ((JSP.ex(twitterCall)) && (this.logged.getPerson() !=
				// null)
				// &&
				// (this.logged.getPerson().getId().equals(this.meetingRoom.getAssignedTo().getId())))
				// {
				// String newTags = "";
				// for (String t : taggi) {
				// if (!twitterCall.equalsIgnoreCase(t.trim())) {
				// newTags = newTags + t.trim() + ", ";
				// }
				// }
				// if (JSP.ex(newTags)) {
				// newTags = newTags.substring(0, newTags.length() - 2);
				// }
				// this.meetingRoom.setTags(newTags);
				// }
			}
			this.meetingRoom.store();
			if (isNew) {
				history = new MeetingRoomHistory(this.meetingRoom);
				// history.store();
			} else {
				history.testChangedAndStore();
			}
			Hit.getInstanceAndStore(this.meetingRoom, this.logged, 0.2D);
			if (this.meetingRoom.getTask() != null) {
				Hit.getInstanceAndStore(this.meetingRoom.getTask(), this.logged, 0.1D);
			}
			this.meetingRoom.bricks.logged = null;
			this.meetingRoom.bricks.buildPassport(this.restState);

			String hql = "from " + Listener.class.getName() + " as listen where "
					+ "listen.owner = :owner and listen.theClass = :theClass and listen.identifiableId = :identifiableId";

			OqlQuery oql = new OqlQuery(hql);
			oql.getQuery().setEntity("owner", teamworkOperator);
			oql.getQuery().setString("theClass", MeetingRoom.class.getName());
			oql.getQuery().setString("identifiableId", this.meetingRoom.getId().toString());
			List<Listener> delendi = oql.list();
			for (Listener l : delendi) {
				l.remove();
			}
			String prefix = "MEETINGROOM_SUBSCRIBE_CLOSE_";
			String mediaSubscribed = MessagingSystem.mediaSubscribed(prefix, this.restState);
			if (mediaSubscribed.length() > 0) {
				Listener l = new Listener(teamworkOperator);
				l.setIdAsNew();
				l.setIdentifiable(this.meetingRoom);
				l.setMedia(mediaSubscribed);
				l.setEventType(MeetingRoom.Event.MEETINGROOM_CLOSE + "");
				l.setOneShot(true);

				l.store();
			}
//			if ((this.meetingRoom.getAssignedTo() != null)
//					&& ((previousAssignee == null) || (!this.meetingRoom.getAssignedTo().equals(previousAssignee)))) {
			// createMessageForMeetingRoomAssigned(teamworkOperator,
			// previousAssignee == null);
//			}
			if (isNew) {
				createEventMeetingRoomAddedClosed(this.meetingRoom, isNew, teamworkOperator,
						teamworkOperator.getDisplayName());
			} else if ((!newStatus.equals(oldStatus)) && (newStatus.isBehavesAsClosed())) {
				createEventMeetingRoomClosed(oldStatus, this.meetingRoom);
				createEventMeetingRoomAddedClosed(this.meetingRoom, isNew, teamworkOperator,
						teamworkOperator.getDisplayName());
			} else if (!oldMeetingRoom.equals(this.meetingRoom.getAbstractForIndexing())) {
				createEventMeetingRoomUpdated(this.meetingRoom);
			}
			if (this.meetingRoom.getTask() != null) {
				// new
				// AssignmentAction(this.restState).getOrCreateAssignment(this.meetingRoom.getTask(),
				// assignee, null);
			}
		}
		return this.restState.validEntries();
	}

	private void createEventMeetingRoomUpdated(MeetingRoom meetingRoom) throws StoreException {
		if (meetingRoom.getTask() != null) {
			ButtonLink edit = MeetingRoomBricks.getPopoupLinkToEditor(meetingRoom.getId());
			edit.label = ("I#" + "meetingRoom" + "#");
			SomethingHappened change = new SomethingHappened();
			change.setIdAsNew();
			change.setEventType("TASK_UPDATED_MEETINGROOM" + "");
			change.getMessageParams().put("SUBJECT", JSP.limWr(meetingRoom.getTask().getDisplayName(), 30));

			change.setMessageTemplate("TASK_UPDATED_MEETINGROOM" + "_MESSAGE_TEMPLATE");
			change.getMessageParams().put("meetingRoom", JSP.limWr(meetingRoom.getDisplayName(), 1000));
			// change.getMessageParams().put("assignee",
			// meetingRoom.getAssignedTo() != null ?
			// meetingRoom.getAssignedTo().getDisplayName() : "unassigned");
			change.getMessageParams().put("gravity", I18n.get(meetingRoom.getGravity()));
			change.getMessageParams().put("modifier", this.logged.getPerson().getDisplayName());
			change.getMessageParams().put("closer", this.logged.getPerson().getDisplayName());
			change.getMessageParams().put("status", meetingRoom.getStatus().getDescription());

			change.setWhoCausedTheEvent(this.logged);
			change.setLink(edit.toPlainLink());
			change.setIdentifiable(meetingRoom.getTask());
			change.store();
		}
	}

	private void createEventMeetingRoomClosed(MeetingRoomStatus oldStatus, MeetingRoom meetingRoom)
			throws StoreException {
		String subject = meetingRoom.getTask() != null ? JSP.limWr(meetingRoom.getTask().getDisplayName(), 30) : "";
		ButtonLink edit = MeetingRoomBricks.getPopoupLinkToEditor(meetingRoom.getId());
		edit.label = ("I#" + "meetingRoom" + "#");
		SomethingHappened change = new SomethingHappened();
		change.setIdAsNew();
		change.setEventType(MeetingRoom.Event.MEETINGROOM_CLOSE + "");
		change.getMessageParams().put("SUBJECT", subject);
		change.setMessageTemplate(MeetingRoom.Event.MEETINGROOM_CLOSE + "_MESSAGE_TEMPLATE");
		change.getMessageParams().put("meetingRoom", JSP.limWr(meetingRoom.getDisplayName(), 1000));
		change.getMessageParams().put("fromStatus", oldStatus.getDescription());
		change.getMessageParams().put("gravity", I18n.get(meetingRoom.getGravity()));
		change.getMessageParams().put("closer", this.logged.getPerson().getDisplayName());
		change.setWhoCausedTheEvent(this.logged);
		change.setLink(edit.toPlainLink());
		change.setIdentifiable(meetingRoom);
		change.store();
	}

	public static void createEventMeetingRoomAddedClosed(MeetingRoom meetingRoom, boolean justAdded,
			TeamworkOperator logged,
			String whoCausedEvent) throws StoreException {
		if (meetingRoom.getTask() != null) {
			boolean hasBeenClosed = meetingRoom.getStatus().isBehavesAsClosed();

			ButtonLink edit = MeetingRoomBricks.getPopoupLinkToEditor(meetingRoom.getId());
			edit.label = ("I#" + "meetingRoom" + "#");

			String language = "";
			if (logged != null) {
				language = logged.getLanguage();
			} else {
				language = ApplicationState.SYSTEM_LOCALE.getLanguage();
			}
			SomethingHappened changeEvent = new SomethingHappened();
			changeEvent.setIdAsNew();
			changeEvent.setEventType(
(hasBeenClosed ? "TASK_MEETINGROOM_CLOSED" : "TASK_MEETINGROOM_ADDED")
							.toString());
			changeEvent.getMessageParams().put("SUBJECT",
					JSP.limWr(meetingRoom.getTask().getDisplayName(), 30) + " - I#" + meetingRoom.getId() + "#");
			if (justAdded) {
				changeEvent.setMessageTemplate("MEETINGROOM_CREATED_MESSAGE_TEMPLATE");
				changeEvent.getMessageParams().put("creator", whoCausedEvent);
			} else {
				changeEvent.setMessageTemplate("TASK_UPDATED_MEETINGROOM" + "_MESSAGE_TEMPLATE");
				changeEvent.getMessageParams().put("closer", whoCausedEvent);
			}
			changeEvent.getMessageParams().put("meetingRoom", JSP.limWr(meetingRoom.getDisplayName(), 1000));
			changeEvent.getMessageParams().put("task", meetingRoom.getTask().getDisplayName());
			changeEvent.getMessageParams().put("status", meetingRoom.getStatus().getDescription());
			changeEvent.getMessageParams().put("gravity", I18n.getLabel(meetingRoom.getGravity(), language));
			if (logged != null) {
				changeEvent.setWhoCausedTheEvent(logged);
			}
			changeEvent.setLink(edit.toPlainLink());
			changeEvent.setIdentifiable(meetingRoom.getTask());
			changeEvent.store();

		}
	}

	public void cmdDelete() throws PersistenceException, SecurityException {
		this.meetingRoom = MeetingRoom.load(this.restState.getMainObjectId() + "");
		this.meetingRoom.testPermission(this.logged, MyTeamworkPermissions.meetingRoom_canCreate);
		DeleteHelper.cmdDelete(this.meetingRoom, this.restState);
	}

	public void cmdSaveAndAdd() throws PersistenceException, ApplicationException, ActionException, SecurityException {
		if (cmdSave()) {
			this.restState.removeEntry("MEETINGROOM_DESCRIPTION");
			this.restState.removeEntry("MEETINGROOM_WORKLOG_TIME");

			this.restState.addClientEntry("_LAST_SAVED_MEETINGROOM", this.restState.getMainObject().getId() + "");

			cmdAdd(false);
		}
	}

	public void cmdClone() throws PersistenceException, SecurityException {
		this.restState.removeEntry("MEETINGROOM_DESCRIPTION");
		this.restState.removeEntry("MEETINGROOM_WORKLOG_TIME");
		cmdAdd(true);
	}

	public void cmdPrepareDefaultFind() throws ActionException, PersistenceException {
		if ((this.restState.getCommand() == null)
				&& (!PersistentSearch.feedFromDefaultSearch("MEETINGROOMFILTER", this.restState))) {
			this.restState.addClientEntry("FLNM", "PF_MY_OPEN_MEETINGROOMS");
		}
		if (!PersistentSearch.feedFromSavedSearch(this.restState)) {
			String cmd = this.restState.getEntry("FLNM").stringValueNullIfEmpty();
			if (JSP.ex(cmd)) {
				this.restState.getClientEntries().getClientEntries().clear();

				this.restState.addClientEntry("FLNM", cmd);
				if ("PF_MY_OPEN_MEETINGROOMS".equals(cmd)) {
					MeetingRoomBricks.addOpenStatusFilter(this.restState);
					this.restState.addClientEntry("FLT_MEETINGROOM_TASK_STATUS", "STATUS_ACTIVE");
					addMyselfToFilter();
				} else if ("PF_MY_OPEN_TODOS".equals(cmd)) {
					MeetingRoomBricks.addOpenStatusFilter(this.restState);
					this.restState.addClientEntry("FLT_MEETINGROOM_TASK_STATUS", "STATUS_ACTIVE");
					addMyselfToFilter();
				} else if ("PF_MY_EXPIRED_MEETINGROOMS".equals(cmd)) {
					MeetingRoomBricks.addOpenStatusFilter(this.restState);
					addMyselfToFilter();
					this.restState.addClientEntry("FLT_MEETINGROOM_DATE_CLOSE_BY", "<t");
					this.restState.addClientEntry("OB_MEETINGROOMFILTER", "meetingRoom.shouldCloseBy");
				} else if ("PF_EXPIRED_MEETINGROOMS".equals(cmd)) {
					MeetingRoomBricks.addOpenStatusFilter(this.restState);
					this.restState.addClientEntry("FLT_MEETINGROOM_DATE_CLOSE_BY", "<t");
					this.restState.addClientEntry("FLT_MEETINGROOM_TASK_STATUS", "STATUS_ACTIVE");
					this.restState.addClientEntry("OB_MEETINGROOMFILTER", "meetingRoom.shouldCloseBy");
				} else if ("PF_MY_INSERTED_MEETINGROOMS".equals(cmd)) {
					MeetingRoomBricks.addOpenStatusFilter(this.restState);
					this.restState.addClientEntry("FLT_MEETINGROOM_ASSIGNED_BY", this.logged.getPerson().getId());
				} else if ("PF_MEETINGROOMS_OPENED_RECENTLY".equals(cmd)) {
					MeetingRoomBricks.addOpenStatusFilter(this.restState);
					CompanyCalendar calendar = new CompanyCalendar();
					calendar.setTime(new Date());
					calendar.add(5, -7);
					String aWeekAgo = DateUtilities.dateToString(calendar.getTime());
					this.restState.addClientEntry("FLT_MEETINGROOM_STATUS_LAST_CHANGE", ">" + aWeekAgo);
				} else if ("PF_MEETINGROOMS_CLOSED_RECENTLY".equals(cmd)) {
					MeetingRoomBricks.addCloseStatusFilter(this.restState);
					CompanyCalendar calendar = new CompanyCalendar();
					calendar.setTime(new Date());
					calendar.add(5, -7);
					String aWeekAgo = DateUtilities.dateToString(calendar.getTime());
					this.restState.addClientEntry("FLT_MEETINGROOM_STATUS_LAST_CHANGE", ">" + aWeekAgo);
				} else if ("PF_LONG_STANDING_MEETINGROOMS".equals(cmd)) {
					MeetingRoomBricks.addOpenStatusFilter(this.restState);
					CompanyCalendar calendar = new CompanyCalendar();
					calendar.setTime(new Date());
					calendar.add(2, -1);
					String lastMonth = DateUtilities.dateToString(calendar.getTime());
					this.restState.addClientEntry("FLT_MEETINGROOM_LAST_MODIFIED", "<" + lastMonth);
				} else if ("PF_OPEN_SEVERE_MEETINGROOMS".equals(cmd)) {
					MeetingRoomBricks.addOpenStatusFilter(this.restState);
					this.restState.addClientEntry("FLT_MEETINGROOM_TASK_STATUS", "STATUS_ACTIVE");
					this.restState.addClientEntry("FLT_MEETINGROOM_GRAVITY", "05_GRAVITY_BLOCK");
				} else if ("PF_MY_OPEN_SEVERE_MEETINGROOMS".equals(cmd)) {
					MeetingRoomBricks.addOpenStatusFilter(this.restState);
					this.restState.addClientEntry("FLT_MEETINGROOM_TASK_STATUS", "STATUS_ACTIVE");

					this.restState.addClientEntry("FLT_MEETINGROOM_GRAVITY", "05_GRAVITY_BLOCK");
					addMyselfToFilter();
				} else if ("PF_LAST_MODIFIED".equals(cmd)) {
					this.restState.addClientEntry("FLT_MEETINGROOM_LAST_MODIFIED", ">-2w");
				} else if ("PF_RECENTLY_USED".equals(cmd)) {
					this.restState.addClientEntry("RECENTLY_USED", "yes");
				}
			}
		}
	}

	private void addMyselfToFilter() {
		Person myPerson = this.logged.getPerson();
		this.restState.addClientEntry("FLT_MEETINGROOM_ASSIGNED_TO", myPerson.getId());
	}

	public void cmdFind() throws ActionException, PersistenceException {
		cmdPrepareDefaultFind();

		String hql = "select distinct meetingRoom.id, meetingRoom.status, meetingRoom.gravity, task.name, resource.name, meetingRoom.orderFactor, meetingRoom.orderFactorByResource, meetingRoom.shouldCloseBy, meetingRoom.creationDate , meetingRoom.lastStatusChangeDate, meetingRoom.shouldCloseBy";
		hql = hql + ",meetingRoom.impact.id";
		hql = hql + " from " + MeetingRoom.class.getName() + " as meetingRoom";

		QueryHelper qhelp = new QueryHelper(hql);

		DesignerField.queryCustomFields("MEETINGROOM_CUSTOM_FIELD_", 6, "meetingRoom", qhelp, this.restState);

		ActionUtilities.addOQLClause("MEETINGROOM_ID", "meetingRoom.id", "issid", qhelp, "C", this.restState);

		ActionUtilities.addQBEClause("FLT_MEETINGROOM_CODE", "meetingRoom.code", "code", qhelp, "C", this.restState);

		ActionUtilities.addQBEClause("FLT_MEETINGROOM_LAST_MODIFIED", "meetingRoom.lastModified", "lastModified", qhelp,
				"D",
				this.restState);

		ActionUtilities.addQBEClause("FLT_MEETINGROOM_STATUS_LAST_CHANGE", "meetingRoom.lastStatusChangeDate",
				"lastStatusChangeDate", qhelp, "D", this.restState);
		if (JSP.ex(this.restState.getEntry("FLT_OPEN_MEETINGROOMS"))) {
			MeetingRoomBricks.addOpenStatusFilter(this.restState);
		}
		String isSts = this.restState.getEntry("FLT_MEETINGROOM_STATUS").stringValueNullIfEmpty();
		if (JSP.ex(isSts)) {
			String[] idss = isSts.split(",");
			List<Integer> idsi = new ArrayList();
			for (String id : idss) {
				idsi.add(Integer.valueOf(id));
			}
			qhelp.addOQLInClause("meetingRoom.status.id", "statuses", idsi);
		}
		String taskId = this.restState.getEntry("FLT_MEETINGROOM_TASK").stringValueNullIfEmpty();
		if (JSP.ex(taskId)) {
			if (this.restState.getEntry("FLT_TASK_MEETINGROOM_SHOW_CHILDREN").checkFieldValue()) {
				Task task = (Task) PersistenceHome.findByPrimaryKey(Task.class, taskId);
				qhelp.addOQLClause("meetingRoom.task.ancestorIds like :ancs or meetingRoom.task.id=:taskId", "ancs",
						task.getChildAncentorIds() + "%");
				qhelp.addParameter("taskId", task.getId());
			} else {
				qhelp.addOQLClause("meetingRoom.task.id=:taskId", "taskId", taskId);
			}
		} else if (JSP.ex(this.restState.getEntry("FLT_MEETINGROOM_TASK_txt"))) {
			qhelp.addQBEORClauses(this.restState.getEntry("FLT_MEETINGROOM_TASK_txt").stringValueNullIfEmpty(),
					new QueryHelper.QueryHelperElement[] { qhelp.getOrElement("meetingRoom.task.name", "taskName", "C"),
							qhelp.getOrElement("meetingRoom.task.code", "taskCode", "C") });
		} else {
			qhelp.addQueryClause(" meetingRoom.task is not null");
		}
		String ts = this.restState.getEntry("FLT_MEETINGROOM_TASK_STATUS").stringValueNullIfEmpty();
		if (JSP.ex(ts)) {
			if (ts.contains(",")) {
				qhelp.addOQLInClause("task.status", "tst", StringUtilities.splitToList(ts, ","));
			} else {
				qhelp.addOQLClause("task.status = :tst", "tst", ts);
			}
		}
		String meetingRoom_gravity = this.restState.getEntry("FLT_MEETINGROOM_GRAVITY").stringValueNullIfEmpty();
		if (JSP.ex(meetingRoom_gravity)) {
			qhelp.addOQLInClause("meetingRoom.gravity", "gravity",
					StringUtilities.splitToList(meetingRoom_gravity, ","));
		}
		String taskTypeId = this.restState.getEntry("MEETINGROOM_TASK_TYPE").stringValueNullIfEmpty();
		if (JSP.ex(taskTypeId)) {
			qhelp.addOQLClause("task.type.id = :taskTypeId", "taskTypeId",
					Integer.valueOf(Integer.parseInt(taskTypeId)));
		} else if (JSP.ex(this.restState.getEntry("MEETINGROOM_TASK_TYPE_txt"))) {
			qhelp.addQBEClause("meetingRoom.task.type.description", "taskTypeName",
					this.restState.getEntry("MEETINGROOM_TASK_TYPE_txt").stringValueNullIfEmpty(), "C");
		}
		int meetingRoomTypeId = this.restState.getEntry("FLT_MEETINGROOM_TYPE").intValueNoErrorCodeNoExc();
		if (meetingRoomTypeId > 0) {
			qhelp.addOQLClause("meetingRoom.type.id=:type", "type", Integer.valueOf(meetingRoomTypeId));
		} else if (JSP.ex(this.restState.getEntry("FLT_MEETINGROOM_TYPE_txt"))) {
			qhelp.addQBEClause("meetingRoom.type.description", "meetingRoomTypeName",
					this.restState.getEntry("FLT_MEETINGROOM_TYPE_txt").stringValueNullIfEmpty(), "C");
		}
		String tags = this.restState.getEntry("FLT_MEETINGROOM_TAGS").stringValueNullIfEmpty();
		int i;
		if (JSP.ex(tags)) {
			Set<String> tgs = StringUtilities.splitToSet(tags, ",");
			i = 1;
			for (String tag : tgs) {
				tag = tag.trim();
				qhelp.addOQLClause("meetingRoom.tags like :tg1_" + i + " or meetingRoom.tags like :tg2_" + i
						+ " or meetingRoom.tags like :tg3_" + i + " or meetingRoom.tags=:tg4_" + i);
				qhelp.addParameter("tg1_" + i, tag + ", %");
				qhelp.addParameter("tg2_" + i, "%, " + tag + ", %");
				qhelp.addParameter("tg3_" + i, "%, " + tag);
				qhelp.addParameter("tg4_" + i, tag);
				i++;
			}
		}
		try {
			int id = this.restState.getEntry("FLT_MEETINGROOM_IMPACT").intValue();
			qhelp.addOQLClause("meetingRoom.impact.id=:impact", "impact", Integer.valueOf(id));
		} catch (ActionException localActionException) {
		} catch (ParseException e) {
			e.printStackTrace();
		}
		if (this.restState.getEntry("FLT_MEETINGROOM_HAVING_WRKLG").checkFieldValue()) {
			qhelp.addQueryClause("meetingRoom.worklogs.size>0");
		}
		boolean inHistory = this.restState.getEntry("FLT_MEETINGROOM_INHISTORY").checkFieldValue();
		if (inHistory) {
			ActionUtilities.addQBEClause("FLT_MEETINGROOM_NOTES", "history.comment", "comment", qhelp, "CLOB",
					this.restState);
		}
		String filter = this.restState.getEntry("CUST_ID").stringValueNullIfEmpty();
		if (filter != null) {
			if (!this.restState.getEntry("FLT_TASK_MEETINGROOM_SHOW_CHILDREN").checkFieldValue()) {
				qhelp.addOQLClause(
						" task.id in (select distinct assc.task.id from " + Assignment.class.getName()
								+ " as assc where assc.resource.id=:custId and assc.role.name like :roleCust)",
						"custId", filter);
				qhelp.addParameter("roleCust",
						ApplicationState.getApplicationSetting("DEFAULT_CUSTOMER_ROLE_NAME", "Customer") + "%");
			} else {
				QueryHelper tqh = new QueryHelper(
						"select distinct assc.task.id,assc.task.ancestorIds from " + Assignment.class.getName()
								+ " as assc where assc.resource.id=:custId and assc.role.name like :roleCust");
				tqh.addParameter("custId", filter);
				tqh.addParameter("roleCust",
						ApplicationState.getApplicationSetting("DEFAULT_CUSTOMER_ROLE_NAME", "Customer") + "%");
				List<Object[]> tsIdAncid = tqh.toHql().list();
				if (tsIdAncid.size() > 0) {
					int c = 1;
					String taskQuery = " task.id in (select p.id from " + Task.class.getName() + " as p where  ";
					for (Object[] obs : tsIdAncid) {
						taskQuery = taskQuery + (c > 1 ? " or " : "") + "p.id=:tid" + c
								+ " or p.ancestorIds like :ancid" + c;
						qhelp.addParameter("tid" + c, obs[0]);
						qhelp.addParameter("ancid" + c, "%" + (obs[1] == null ? obs[0] + "^"
								: new StringBuilder().append("").append(obs[1]).append(obs[0]).append("^").toString()));
						c++;
					}
					taskQuery = taskQuery + " )";
					qhelp.addOQLClause(taskQuery);
				}
			}
		}
		if (this.restState.getEntry("RECENTLY_USED").checkFieldValue()) {
			List<EntityGroupRank> ranks = RankUtilities.getEntityRankStatistically(this.logged.getIntId(),
					MeetingRoom.class.getName(), new Date());
			boolean something = JSP.ex(ranks);
			if (something) {
				List<String> ids = new ArrayList();
				for (int j = 0; j < ranks.size(); j++) {
					EntityGroupRank egr = ranks.get(j);
					ids.add(egr.id);
					if (j >= 19) {
						break;
					}
				}
				qhelp.addOQLInClause("meetingRoom.id", "meetingRoomxId", ids);
			}
		}
		boolean singleAssig = false;
		if (this.restState.getEntry("FLT_MEETINGROOM_UNASSIGNED").checkFieldValue()) {
			qhelp.addJoinAlias("left outer join meetingRoom.assignedTo as resource");
			qhelp.addQueryClause("resource is null");
		} else {
			if (inHistory) {
				qhelp.addJoinAlias("left outer join history.assignee as resource");
			} else {
				qhelp.addJoinAlias("left outer join meetingRoom.assignedTo as resource");
			}
			String assId = this.restState.getEntry("FLT_MEETINGROOM_ASSIGNED_TO").stringValueNullIfEmpty();
			if (JSP.ex(assId)) {
				qhelp.addOQLClause("resource.id = :assignee", "assignee", assId);
				singleAssig = true;
			} else {
				String assigText = this.restState.getEntry("FLT_MEETINGROOM_ASSIGNED_TO_txt").stringValueNullIfEmpty();
				if (JSP.ex(assigText)) {
					qhelp.addQBEORClauses(assigText,
							new QueryHelper.QueryHelperElement[] { qhelp.getOrElement("resource.name", "name", "C"),
									qhelp.getOrElement("resource.personSurname || ' ' || resource.personName",
											"surnameName", "C"),
							qhelp.getOrElement("resource.personName || ' ' || resource.personSurname", "nameSurname",
									"C") });
				}
			}
			String companyId = this.restState.getEntry("FLT_MEETINGROOM_ASSIGNED_COMPANY").stringValueNullIfEmpty();
			if (JSP.ex(companyId)) {
				if (!this.restState.getEntry("FLT_COMPANY_MEETINGROOM_SHOW_CHILDREN").checkFieldValue()) {
					qhelp.addOQLClause("resource.id = :company", "company", companyId);
				} else {
					Resource res = Resource.load(companyId);
					if (res != null) {
						qhelp.addOQLClause("resource.id = :company or resource.ancestorIds like :cpchil ", "cpchil",
								res.getChildAncentorIds() + "%");
						qhelp.addParameter("company", companyId);
					}
				}
				singleAssig = true;
			} else {
				String assigText = this.restState.getEntry("FLT_MEETINGROOM_ASSIGNED_COMPANY_txt")
						.stringValueNullIfEmpty();
				if (JSP.ex(assigText)) {
					qhelp.addQBEClause("resource.name", "companyName", assigText, "C");
					qhelp.addOQLClause("resource.class='COMPANY'");
				}
			}
		}
		if (inHistory) {
			qhelp.addJoinAlias("left outer join meetingRoom.meetingRoomHistories as history");
		}
		filter = this.restState.getEntry("FLT_AREA").stringValueNullIfEmpty();
		if (filter != null) {
			Area a = (Area) PersistenceHome.findByPrimaryKey(Area.class, filter);
			qhelp.addOQLClause("task.area = :area", "area", a);
		}
		MeetingRoomBricks.addSecurityClauses(qhelp, this.restState);

		qhelp.addJoinAlias(" join meetingRoom.task as task");

		DataTable.orderAction(qhelp, "MEETINGROOMFILTER", this.restState, "meetingRoom.gravity desc");

		boolean orderByResource = false;
		if (singleAssig) {
			orderByResource = true;
		}
		if (!qhelp.getHqlString().contains("meetingRoom.gravity desc")) {
			qhelp.addToHqlString(", meetingRoom.gravity desc");
		}
		if (orderByResource) {
			qhelp.addToHqlString(", meetingRoom.orderFactorByResource asc");
		} else {
			qhelp.addToHqlString(", meetingRoom.orderFactor asc");
		}
		OqlQuery oqlQuery = qhelp.toHql();
		if (qhelp.isValidQBE()) {
			HibernatePage page = HibernatePage.getHibernatePageInstance(oqlQuery.getQuery(),
					Paginator.getWantedPageNumber(this.restState),
					Paginator.getWantedPageSize("MEETINGROOMFILTER", this.restState));

			this.restState.setPage(page);
		}
	}

	public void cmdExport() throws ActionException, PersistenceException {
		cmdFind();
		if (JSP.ex(this.restState.getPage())) {
			List<MeetingRoom> iss = new ArrayList();
			List<Object[]> elements = this.restState.getPage().getAllElements();
			for (Object[] ob : elements) {
				MeetingRoom mt = MeetingRoom.load((String) ob[0]);
				if (mt != null) {
					iss.add(mt);
				}
			}
			if (iss.size() > 0) {
				ListPage lp = new ListPage(iss, 0, iss.size());
				this.restState.setPage(lp);
			}
		}
	}

	public void cmdUpgrade() throws PersistenceException, SecurityException {
		cmdEdit();

		Task parent = this.meetingRoom.getTask();
		Task newChild = new Task();

		newChild.setCode("[meetingRoom:" + this.meetingRoom.getId() + "]");
		newChild.setName("Generated from MeetingRoom: " + this.meetingRoom.getId());

		// newChild.setDescription(
		// JSP.limWr(new
		// StringBuilder().append(this.meetingRoom.getDescription()).append("").toString(),
		// 1850) + " I#"
		// + this.meetingRoom.getMnemonicCode() + "#");
		Period p;
		// if (this.meetingRoom.getShouldCloseBy() != null) {
		// p = new Period(this.meetingRoom.getCreationDate(),
		// this.meetingRoom.getShouldCloseBy());
		// } else {
			p = new Period(this.meetingRoom.getCreationDate(), new Date());
		// }
		p.store();
		newChild.setSchedule(p);
		newChild.setDuration(CompanyCalendar.getDistanceInWorkingDays(p.getStartDate(), p.getEndDate()));
		newChild.setArea(parent.getArea());
		newChild.setParentAndStore(parent);
		newChild.setStatus(parent.getStatus());
		if (JSP.ex(this.meetingRoom.getId())) {
			newChild.setCode(this.meetingRoom.getId().toString());
		}
		String gtc = ApplicationState.getApplicationSetting("GENTASKCODES");
		if ("yes".equalsIgnoreCase(gtc)) {
			newChild.bricks.suggestCodeFromParent();
		}
		newChild.store();
		// for (Worklog workLog : this.meetingRoom.getWorklogs()) {
		// workLog.setMeetingRoom(null);
		// workLog.store();
		// }
		// for (PersistentFile pf : this.meetingRoom.getFiles()) {
		// TaskAction.addDocToTask(newChild, pf.getFileLocation(),
		// pf.getName());
		// }
		// if (JSP.ex(new Identifiable[] { this.meetingRoom.getType() })) {
		// String hql = "select taskType from " + TaskType.class.getName() + "
		// as taskType";
		// QueryHelper qhelp = new QueryHelper(hql);
		// qhelp.addQBEClause("description", "desc",
		// this.meetingRoom.getType().getDescription(), "C");
		// List<TaskType> tasktypes = qhelp.toHql().list();
		// if (tasktypes.size() > 0) {
		// newChild.setType((TaskType) tasktypes.get(0));
		// }
		// }
		newChild.store();
		this.restState.setMainObject(newChild);

		// this.meetingRoom.setStatusClosed();
		this.meetingRoom.store();

		this.restState.addClientEntry("MEETINGROOM_ID", this.meetingRoom.getId());
	}

	public void cmdClose() throws PersistenceException, ApplicationException, ActionException, SecurityException {
		this.restState.addClientEntry("MEETINGROOM_STATUS", MeetingRoomStatus.getStatusClose());
		cmdSave();
		this.meetingRoom.bricks.buildPassport(this.restState);
		make((MeetingRoom) this.restState.getMainObject());
	}

	public void cmdSaveDur() throws SecurityException, ActionException, PersistenceException, ApplicationException {
		this.meetingRoom = MeetingRoom.load(this.restState.getMainObjectId() + "");
		if (this.meetingRoom != null) {
			long newDur = 0L;
			try {
				newDur = this.restState.getEntry("MEETINGROOM_WORKLOG_DELTA_ESTIMATED_TIME")
						.durationInWorkingMillis(true);

				// long est = newDur + this.meetingRoom.getWorklogDone();
				// this.restState.addClientEntryTime("MEETINGROOM_WORKLOG_ESTIMATED_TIME",
				// Long.valueOf(est));
			} catch (ParseException localParseException) {
			}
		}
		cmdSave();
	}

	public void cmdSortMeetingRooms() throws PersistenceException {
		String idss = this.restState.getEntry("meetingRooms").stringValueNullIfEmpty();

		boolean orderByResource = "BY_RESOURCE"
				.equals(this.restState.getEntry("SORT_FLAVOUR").stringValueNullIfEmpty());
		int i;
		if (idss != null) {
			i = 0;
			List<String> ids = StringUtilities.splitToList(idss, ",");
			for (String id : ids) {
				i++;
				MeetingRoom meetingRoom = MeetingRoom.load(id);
				if ((meetingRoom != null)
						&& (meetingRoom.hasPermissionFor(this.logged, MyTeamworkPermissions.meetingRoom_canWrite))) {
					// if (orderByResource) {
					// meetingRoom.setOrderFactorByResource(i);
					// } else {
					// meetingRoom.setOrderFactor(i);
					// }
					meetingRoom.store();
				}
			}
		}
		String issuId = this.restState.getEntry("meetingRoomId").stringValueNullIfEmpty();
		String gravity = this.restState.getEntry("newGravity").stringValueNullIfEmpty();
		if (JSP.ex(new String[] { issuId, gravity })) {
			MeetingRoom moved = MeetingRoom.load(issuId);
			if ((moved != null) && (moved.hasPermissionFor(this.logged, MyTeamworkPermissions.meetingRoom_canWrite))) {
				moved.setGravity(gravity);
				moved.store();
			}
		}
	}

	public void cmdBulkMoveToTask() throws ActionException, PersistenceException, SecurityException {
		try {
			String taskId = this.restState.getEntryAndSetRequired("MEETINGROOM_MOVE_TO_TASK").stringValue();
			Task task = (Task) PersistenceHome.findByPrimaryKey(Task.class, taskId);
			task.testPermission(this.logged, MyTeamworkPermissions.meetingRoom_canCreate);
			String comment = this.restState.getEntry("HIS_NOTES_TSK").stringValueNullIfEmpty();
			Set<String> ids = StringUtilities
					.splitToSet(this.restState.getEntry("meetingRoomIds").stringValueNullIfEmpty(),
					",");
			Set<Task> taskToBeUpgraded = new HashSet();
			for (String meetingRoomId : ids) {
				MeetingRoom meetingRoom = MeetingRoom.load(meetingRoomId);

				taskToBeUpgraded.add(meetingRoom.getTask());

				MeetingRoomHistory history = new MeetingRoomHistory(meetingRoom);
				meetingRoom.testPermission(this.logged, MyTeamworkPermissions.meetingRoom_canWrite);
				meetingRoom.setTask(task);

				meetingRoom.store();

				history.testChangedAndStore();
				if ((JSP.ex(comment)) && (meetingRoom.getLastMeetingRoomHistory() != null)) {
					meetingRoom.getLastMeetingRoomHistory().setComment(comment);
				}
			}
			task.store();
			// for (Task t : taskToBeUpgraded) {
			// t.updateMeetingRoomTotals();
			// }
		} catch (ActionException localActionException) {
		}
		cmdFind();
	}

	public void cmdBulkMoveToRes() throws ActionException, PersistenceException, SecurityException {
		Resource res;
		String comment;
		try {
			String taskId = this.restState.getEntryAndSetRequired("MEETINGROOM_MOVE_TO_RES").stringValue();
			res = (Resource) PersistenceHome.findByPrimaryKey(Resource.class, taskId);

			res.testPermission(this.logged, TeamworkPermissions.resource_canRead);

			Set<String> ids = StringUtilities
					.splitToSet(this.restState.getEntry("meetingRoomIds").stringValueNullIfEmpty(),
					",");
			comment = this.restState.getEntry("HIS_NOTES_RES").stringValueNullIfEmpty();
			for (String meetingRoomId : ids) {
				MeetingRoom meetingRoom = MeetingRoom.load(meetingRoomId);
				MeetingRoomHistory history = new MeetingRoomHistory(meetingRoom);
				if (meetingRoom.hasPermissionFor(this.logged, MyTeamworkPermissions.meetingRoom_canWrite)) {
					Assignment assig = new AssignmentAction(this.restState).getOrCreateAssignment(meetingRoom.getTask(),
							res,
							null);
					if (assig != null) {
						// meetingRoom.setAssignedTo(res);

						meetingRoom.store();

						history.testChangedAndStore();
						if ((JSP.ex(comment)) && (meetingRoom.getLastMeetingRoomHistory() != null)) {
							meetingRoom.getLastMeetingRoomHistory().setComment(comment);
						}
					} else {
						this.restState.addMessageWarning(I18n.get("MEETINGROOM_COULDNT_BE_MOVED%%",
								new String[] { JSP.limWr(meetingRoom.getDisplayName(), 50) }));
					}
				} else {
					this.restState.addMessageWarning(I18n.get("MEETINGROOM_COULDNT_BE_MOVED%%",
							new String[] { JSP.limWr(meetingRoom.getDisplayName(), 50) }));
				}
			}
		} catch (ActionException localActionException) {
		}
		cmdFind();
	}

	public void cmdBulkSetStatus() throws ActionException, PersistenceException, SecurityException {
		MeetingRoomStatus status = MeetingRoomStatus.load(
Integer
				.valueOf(this.restState.getEntryAndSetRequired("MEETINGROOM_STATUS_ALL").intValueNoErrorCodeNoExc()));

		Set<String> ids = StringUtilities.splitToSet(this.restState.getEntry("meetingRoomIds").stringValueNullIfEmpty(),
				",");
		String comment = this.restState.getEntry("HIS_NOTES_ST").stringValueNullIfEmpty();
		for (String meetingRoomId : ids) {
			MeetingRoom meetingRoom = MeetingRoom.load(meetingRoomId);
			MeetingRoomHistory history = new MeetingRoomHistory(meetingRoom);
			meetingRoom.testPermission(this.logged, MyTeamworkPermissions.meetingRoom_canWrite);

			meetingRoom.setStatus(status);
			meetingRoom.store();

			history.testChangedAndStore();
			if ((JSP.ex(comment)) && (meetingRoom.getLastMeetingRoomHistory() != null)) {
				meetingRoom.getLastMeetingRoomHistory().setComment(comment);
			}
		}
		cmdFind();
	}

	public void cmdBulkSetGravity() throws ActionException, PersistenceException, SecurityException {
		String gravity = this.restState.getEntryAndSetRequired("MEETINGROOM_GRAVITY_ALL").stringValue();

		Set<String> ids = StringUtilities.splitToSet(this.restState.getEntry("meetingRoomIds").stringValueNullIfEmpty(),
				",");
		for (String meetingRoomId : ids) {
			MeetingRoom meetingRoom = MeetingRoom.load(meetingRoomId);
			MeetingRoomHistory history = new MeetingRoomHistory(meetingRoom);
			meetingRoom.testPermission(this.logged, MyTeamworkPermissions.meetingRoom_canWrite);

			meetingRoom.setGravity(gravity);
			meetingRoom.store();

			history.testChangedAndStore();
		}
		cmdFind();
	}

	public void cmdBulkSetImpact() throws ActionException, PersistenceException, SecurityException {
		// MeetingRoomImpact impact = MeetingRoomImpact.load(
		// Integer
		// .valueOf(this.restState.getEntryAndSetRequired("MEETINGROOM_IMPACT_ALL").intValueNoErrorCodeNoExc()));
		//
		// Set<String> ids =
		// StringUtilities.splitToSet(this.restState.getEntry("meetingRoomIds").stringValueNullIfEmpty(),
		// ",");
		// for (String meetingRoomId : ids) {
		// MeetingRoom meetingRoom = MeetingRoom.load(meetingRoomId);
		// meetingRoom.testPermission(this.logged,
		// MyTeamworkPermissions.meetingRoom_canWrite);
		// // meetingRoom.setImpact(impact);
		// meetingRoom.store();
		// }
		cmdFind();
	}

	public void cmdBulkAddComment() throws ActionException, PersistenceException, SecurityException {
		Set<String> ids = StringUtilities.splitToSet(this.restState.getEntry("meetingRoomIds").stringValueNullIfEmpty(),
				",");
		String comment = this.restState.getEntry("HIS_NOTES_ST").stringValueNullIfEmpty();
		if (JSP.ex(comment)) {
			for (String meetingRoomId : ids) {
				MeetingRoom meetingRoom = MeetingRoom.load(meetingRoomId);
				if ((meetingRoom != null)
						&& (meetingRoom.hasPermissionFor(this.logged, MyTeamworkPermissions.meetingRoom_canWrite))) {
					MeetingRoomHistory history = new MeetingRoomHistory(meetingRoom);
					history.setMeetingRoom(meetingRoom);
					history.setComment(comment);
					history.store();
				}
			}
		}
		cmdFind();
	}

	public void cmdBulkSetNewDate() throws ActionException, PersistenceException, SecurityException {
		Set<String> ids = StringUtilities.splitToSet(this.restState.getEntry("meetingRoomIds").stringValueNullIfEmpty(),
				",");
		Date newDate = this.restState.getEntry("MEETINGROOM_NEWDATE_ALL").dateValueNoErrorNoCatchedExc();
		String errorMessage = "";
		for (String meetingRoomId : ids) {
			MeetingRoom meetingRoom = MeetingRoom.load(meetingRoomId);
			if ((meetingRoom != null)
					&& (meetingRoom.hasPermissionFor(this.logged, MyTeamworkPermissions.meetingRoom_canWrite))) {
				if ((newDate != null) && (meetingRoom.getTask() != null)
						&& (meetingRoom.getTask().getSchedule() != null)
						&& (!meetingRoom.getTask().getSchedule().contains(newDate))) {
					errorMessage = errorMessage + "I#" + "meetingRoom" + "# &nbsp;&nbsp;";
				} else {
					// meetingRoom.setShouldCloseBy(newDate);
					meetingRoom.store();
				}
			}
		}
		if (JSP.ex(errorMessage)) {
			this.restState.addMessageError(I18n.get("CLOSE_BY_OUT_OF_TASK_SCOPE") + ": " + errorMessage);
		}
		cmdFind();
	}

	public void cmdBulkDelMeetingRooms(boolean onlyIfEmpty) throws ActionException, PersistenceException {
		Set<String> ids = StringUtilities.splitToSet(this.restState.getEntry("meetingRoomIds").stringValueNullIfEmpty(),
				",");
		for (String meetingRoomId : ids) {
			MeetingRoom meetingRoom = MeetingRoom.load(meetingRoomId);
			if ((meetingRoom != null)
					&& (meetingRoom.hasPermissionFor(this.logged, MyTeamworkPermissions.meetingRoom_canCreate))) {
				if (onlyIfEmpty) {
					// if (!JSP.ex(meetingRoom.getDescription())) {
					// meetingRoom.remove();
					// }
				} else {
					meetingRoom.remove();
				}
			}
		}
		if (!onlyIfEmpty) {
			cmdFind();
		}
	}

	public void cmdBulkCloseMeetingRooms()
			throws ActionException, PersistenceException, SecurityException, ApplicationException {
		this.restState.addClientEntry("MEETINGROOM_STATUS_ALL", MeetingRoomStatus.getStatusClose());
		cmdBulkSetStatus();
	}

	public void cmdBulkPrint() {
		Set<String> ids = StringUtilities.splitToSet(this.restState.getEntry("meetingRoomIds").stringValueNullIfEmpty(),
				",");

		String hql = "select distinct meetingRoom.id, meetingRoom.status, meetingRoom.gravity, meetingRoom.orderFactor, meetingRoom.shouldCloseBy from "
				+ MeetingRoom.class.getName() + " as meetingRoom where meetingRoom.id in (:ids)";
		OqlQuery oql = new OqlQuery(hql);
		oql.getQuery().setParameterList("ids", ids);
		this.restState.setPage(
				HibernatePage.getHibernatePageInstance(oql.getQuery(), Paginator.getWantedPageNumber(this.restState),
						Paginator.getWantedPageSize("MEETINGROOMFILTER", this.restState)));
	}

	public void cmdBulkMergeMeetingRooms() throws SecurityException, PersistenceException, ActionException {
		Set<String> ids = StringUtilities.splitToSet(this.restState.getEntry("meetingRoomIds").stringValueNullIfEmpty(),
				",");

		String hql = "select meetingRoom from " + MeetingRoom.class.getName()
				+ " as meetingRoom where meetingRoom.id in (:ids)";
		OqlQuery oql = new OqlQuery(hql);
		oql.getQuery().setParameterList("ids", ids);
		List<MeetingRoom> iss = oql.getQuery().list();

		Map<String, MeetingRoom> masters = new HashTable();

		Set<MeetingRoom> toBeRemoved = new HashSet();
		for (MeetingRoom meetingRoom : iss) {
			meetingRoom.testPermission(this.logged, MyTeamworkPermissions.meetingRoom_canCreate);

			// String key = "T" + (meetingRoom.getTask() == null ? "" :
			// meetingRoom.getTask().getId()) + "_"
			// + (meetingRoom.getAssignedTo() == null ? "" :
			// meetingRoom.getAssignedTo().getId());
			// if (masters.containsKey(key)) {
			// MeetingRoom master = masters.get(key);
			// master.setDescription(master.getDescription() + "\n" +
			// meetingRoom.getDescription());
			// master.setEstimatedDuration(master.getEstimatedDuration() +
			// meetingRoom.getEstimatedDuration());
			// toBeRemoved.add(meetingRoom);
			// } else {
			// masters.put(key, meetingRoom);
			// }
		}
		for (MeetingRoom meetingRoom : toBeRemoved) {
			meetingRoom.remove();
		}
		cmdFind();
	}

}
