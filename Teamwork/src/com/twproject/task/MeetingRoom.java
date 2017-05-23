/**
 * 
 */
package com.twproject.task;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

import org.hibernate.annotations.ForeignKey;
import org.hibernate.annotations.Index;
import org.hibernate.annotations.Type;
import org.hibernate.search.annotations.FieldBridge;
import org.hibernate.search.bridge.builtin.IntegerBridge;
import org.jblooming.logging.Auditable;
import org.jblooming.logging.Sniffable;
import org.jblooming.ontology.SecuredSupportWithArea;
import org.jblooming.operator.Operator;
import org.jblooming.operator.User;
import org.jblooming.persistence.PersistenceHome;
import org.jblooming.persistence.exceptions.FindByPrimaryKeyException;
import org.jblooming.security.Area;
import org.jblooming.security.Permission;
import org.jblooming.security.Securable;
import org.jblooming.utilities.JSP;
import org.jblooming.waf.settings.I18n;

import com.opnlb.fulltext.Indexable;
import com.twproject.operator.TeamworkOperator;

import net.sf.json.JSONObject;

/**
 * 
 * @author WangXi
 * @create May 9, 2017
 */
@SuppressWarnings("deprecation")
@javax.persistence.Entity
@javax.persistence.Table(name = "twk_meeting_room")
@org.hibernate.search.annotations.Indexed(index = "fulltext")
public class MeetingRoom extends SecuredSupportWithArea implements Securable, Indexable,
		Auditable, Sniffable {
	public MeetingRoomBricks bricks = new MeetingRoomBricks(this);

	public static final String GRAVITY_LOW = "01_GRAVITY_LOW";

	public static final String GRAVITY_MEDIUM = "02_GRAVITY_MEDIUM";

	public static final String GRAVITY_HIGH = "03_GRAVITY_HIGH";

	public static final String GRAVITY_CRITICAL = "04_GRAVITY_CRITICAL";

	public static final String GRAVITY_BLOCK = "05_GRAVITY_BLOCK";

	private String code;
	private String name;
	private String description;
	private Operator owner;
	private MeetingRoomType type;
	private String customField1;
	private String customField2;
	private String customField3;
	private Task task; // 任务
	// private Date endDate;
	private String gravity; // 级别
	private MeetingRoomStatus status; // 状态
	private MeetingRoomHistory lastMeetingRoomHistory = null;

	public MeetingRoom() {
		System.out.println(1);
	}

	public static enum Event {
		MEETINGROOM_CLOSE, MEETINGROOM_ASSIGNED;
		
		private Event() {
		}
	}
	@Override
	@Id
	@org.hibernate.annotations.Type(type = "string")
	@org.hibernate.search.annotations.DocumentId
	@FieldBridge(impl = IntegerBridge.class)
	public Serializable getId() {
		return super.getId();
	}

	@Lob
	@Column(name = "descriptionx")
	@Type(type = "org.hibernate.type.TextType")
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(length = 30, name = "codex")
	@org.hibernate.annotations.Index(name = "idx_mt_code")
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Override
	@ManyToOne(targetEntity = TeamworkOperator.class)
	@ForeignKey(name = "fk_meetingRoom_owner")
	@Index(name = "idx_meetingRoom_owner")
	@JoinColumn(name = "ownerx")
	public Operator getOwner() {
		return owner;
	}

	@Override
	public void setOwner(Operator owner) {
		this.owner = owner;
	}

	@ManyToOne(targetEntity = MeetingRoomStatus.class)
	@ForeignKey(name = "fk_meetingRoom_mtStatus")
	@org.hibernate.annotations.Index(name = "idx_meetingRoom_mtStatus")
	@JoinColumn(name = "statusx")
	public MeetingRoomStatus getStatus() {
		return status;
	}

	public void setStatus(MeetingRoomStatus status) {
		this.status = status;
	}

	public void setStatusClosed() {
		setMtStatus(MeetingRoomStatus.getStatusClose());
	}

	public void setStatusOpen() {
		setMtStatus(MeetingRoomStatus.getStatusOpen());
	}

	public void setMtStatus(MeetingRoomStatus status) {
		MeetingRoomStatus oldSts = getStatus();
		if (((oldSts != null) && (!oldSts.equals(status))) || ((status != null) && (!status.equals(oldSts)))) {
			// setLastStatusChangeDate(new Date());
			setStatus(status);
		}
	}
	// /**
	// * @return the endDate
	// */
	// public Date getEndDate() {
	// return endDate;
	// }
	//
	// /**
	// * @param endDate
	// * the endDate to set
	// */
	// public void setEndDate(Date endDate) {
	// this.endDate = endDate;
	// }

	/**
	 * @return the name
	 */
	@Override
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 *            the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the gravity
	 */
	public String getGravity() {
		return gravity;
	}

	/**
	 * @param gravity
	 *            the gravity to set
	 */
	public void setGravity(String gravity) {
		this.gravity = gravity;
	}

	@ManyToOne(targetEntity = MeetingRoomType.class)
	@ForeignKey(name = "fk_meettingRoom_type")
	@org.hibernate.annotations.Index(name = "idx_meettingRoom_type")
	@JoinColumn(name = "type")
	public MeetingRoomType getType() {
		return type;
	}

	public void setType(MeetingRoomType type) {
		this.type = type;
	}

	/**
	 * @return the customField1
	 */
	public String getCustomField1() {
		return customField1;
	}

	/**
	 * @param customField1
	 *            the customField1 to set
	 */
	public void setCustomField1(String customField1) {
		this.customField1 = customField1;
	}

	/**
	 * @return the customField2
	 */
	public String getCustomField2() {
		return customField2;
	}

	/**
	 * @param customField2
	 *            the customField2 to set
	 */
	public void setCustomField2(String customField2) {
		this.customField2 = customField2;
	}

	/**
	 * @return the customField3
	 */
	public String getCustomField3() {
		return customField3;
	}

	/**
	 * @param customField3
	 *            the customField3 to set
	 */
	public void setCustomField3(String customField3) {
		this.customField3 = customField3;
	}

	@ManyToOne(targetEntity = Task.class, fetch = FetchType.LAZY)
	@ForeignKey(name = "fk_mt_task")
	@org.hibernate.annotations.Index(name = "idx_mt_task")
	public Task getTask() {
		return task;
	}

	public void setTask(Task task) {
		this.task = task;
	}

	@Override
	@ManyToOne(targetEntity = Area.class)
	@JoinColumn(name = "areax")
	@ForeignKey(name = "fk_mt_area")
	@org.hibernate.annotations.Index(name = "idx_meetingRoom_area")
	public Area getArea() {
		return super.getArea();
	}

	@Override
	public void setArea(Area area) {
		super.setArea(area);
	}

	@Transient
	public void setArea(TeamworkOperator logged) {
		if (getTask() != null) {
			setArea(getTask().getArea());
		} else {
			setArea(logged.getPerson().getArea());
		}
	}
	/*
	 * (non-Javadoc)
	 * 
	 * @see com.opnlb.fulltext.Indexable#getAbstractForIndexing()
	 */
	@Override
	@Transient
	public String getAbstractForIndexing() {
		String afi = "test";

		// for (DiscussionPoint dp : getDiscussionPoints()) {
		// afi = afi + JSP.w(dp.getTitle()) + " M#" + getId() + "#\n"
		// + (dp.getLead() != null ? dp.getLead().getDisplayName() + "\n" : "")
		// + JSP.w(dp.getMinute());
		// }

		return afi;
	}


	@Override
	public boolean hasPermissionFor(User u, Permission p) {
		boolean ret = false;
		if (super.hasPermissionFor(u, p)) {
			ret = true;
		}
		return ret;
	}

	@Transient
	public MeetingRoomHistory getLastMeetingRoomHistory() {
		return lastMeetingRoomHistory;
	}

	public void setLastMeetingRoomHistory(MeetingRoomHistory lastMeetingRoomHistory) {
		this.lastMeetingRoomHistory = lastMeetingRoomHistory;
	}

	public static MeetingRoom load(String mainObjectId) throws FindByPrimaryKeyException {
		return (MeetingRoom) PersistenceHome.findByPrimaryKey(MeetingRoom.class, mainObjectId);
	}

	@Transient
	public static int getGravityScore(String aGravity) {
		if ((!JSP.ex(aGravity)) || (aGravity.length() < 2))
			return 0;
		return Integer.parseInt(aGravity.charAt(1) + "");
	}

	@Override
	public JSONObject jsonify() {
		JSONObject jso = super.jsonify();
		jso.element("id", getId());
		jso.element("name", JSP.encode(getName()));
		jso.element("typeId", getType() == null ? "" : getType().getId());
		jso.element("type", getType() == null ? "" : getType().getDescription());


		Task task = getTask();
		if (task == null) {
			jso.element("taskId", "-1");
			jso.element("taskName", I18n.get("NO_TASK"));
			jso.element("taskCode", "");

			jso.element("taskOrder", "");
		} else {
			jso.element("taskId", task.getId());
			jso.element("taskName", getTask().getName());
			jso.element("taskCode", getTask().getCode());
			jso.element("tcodid", task.getMnemonicCode());
			jso.element("taskOrder", task.getName());
			if (I18n.isActive("CUSTOM_FEATURE_LIST_SHOW_TASK_PATH")) {
				jso.element("taskPath", task.getPath(" / ", false));
			}
		}

		if (getStatus() == null) {
			jso.element("statusId", "-1");
			jso.element("statusName", I18n.get("NO_STATUS"));
			jso.element("statusColor", "#ffffff");
			jso.element("statusOrder", "");
		} else {
			jso.element("statusId", getStatus().getId());
			jso.element("statusName", getStatus().getDescription());
			jso.element("statusColor", getStatus().getColor());
			jso.element("statusOrder", getStatus().getOrderBy());
			jso.element("isOpen", getStatus().isBehavesAsOpen());
		}

		if (getGravity() == null) {
			jso.element("gravityId", "-1");
			jso.element("gravityName", I18n.get("NO_GRAVITY"));
			jso.element("gravityColor", "#ffffff");
			jso.element("gravityOrder", 99);
		} else {
			jso.element("gravityId", getGravity());
			jso.element("gravityName", I18n.get(getGravity()));
			jso.element("gravityColor", IssueBricks.getGravityColor(getGravity()));
			jso.element("gravityOrder", IssueBricks.getGravityOrder(getGravity()));
		}

		jso.element("lastModified", getLastModified().getTime());
		jso.element("lastModifier", getLastModifier());


		return jso;
	}


}
