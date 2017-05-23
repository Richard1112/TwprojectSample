/**
 * 
 */
package com.twproject.task;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.ForeignKey;
import org.hibernate.annotations.Index;
import org.hibernate.annotations.Type;
import org.jblooming.ontology.SecuredLoggableSupport;
import org.jblooming.operator.Operator;
import org.jblooming.persistence.PersistenceHome;
import org.jblooming.persistence.exceptions.FindByPrimaryKeyException;
import org.jblooming.persistence.exceptions.StoreException;
import org.jblooming.utilities.JSP;

import com.twproject.operator.TeamworkOperator;
import com.twproject.resource.Resource;
import com.twproject.resource.ResourceBricks;
import com.twproject.task.Issue;
import com.twproject.task.IssueHistory;
import com.twproject.task.IssueStatus;
import com.twproject.task.Task;

import net.sf.json.JSONObject;

/**
 * @author x-wang
 *
 */
@Table(name = "twk_meetingRoom_history")
public class MeetingRoomHistory extends SecuredLoggableSupport {
	private Operator owner;
	private MeetingRoom meetingRoom;
	private String comment;
	private MeetingRoomStatus status;
	private MeetingRoomStatus oldStatus;
	private Resource assignee;
	private Task task;
	private String extRequesterEmail;

	public MeetingRoomHistory() {
	}

	public MeetingRoomHistory(MeetingRoom meetingRoom)
	{
		setMeetingRoom(meetingRoom);
		setTask(meetingRoom.getTask());
		setOldStatus(meetingRoom.getStatus());
		setStatus(meetingRoom.getStatus());
		// setAssignee(meetingRoom.getAssignedTo());
	}

	@Override
	@Id
	@Type(type = "int")
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Serializable getId() {
		return super.getId();
	}

	@Override
	@ManyToOne(targetEntity = TeamworkOperator.class, fetch = FetchType.LAZY)
	@ForeignKey(name = "fk_issuehist_owner")
	@Index(name = "idx_issuehist_owner")
	@JoinColumn(name = "ownerx")
	public Operator getOwner() {
		return this.owner;
	}

	@Override
	public void setOwner(Operator owner) {
		this.owner = owner;
	}

	@Lob
	@Column(name = "commentx")
	@Type(type = "org.hibernate.type.TextType")
	public String getComment() {
		return this.comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	@ManyToOne(targetEntity = IssueStatus.class)
	@ForeignKey(name = "fk_issuehist_isstat")
	@Index(name = "idx_issuehist_isstat")
	@JoinColumn(name = "statusx")
	public MeetingRoomStatus getStatus() {
		return this.status;
	}

	public void setStatus(MeetingRoomStatus status) {
		this.status = status;
	}

	@ManyToOne(targetEntity = IssueStatus.class)
	@ForeignKey(name = "fk_mthist_isoldstat")
	@Index(name = "idx_mthist_isoldstat")
	@JoinColumn(name = "oldstatus")
	public MeetingRoomStatus getOldStatus() {
		return this.oldStatus;
	}

	public void setOldStatus(MeetingRoomStatus oldStatus) {
		this.oldStatus = oldStatus;
	}



	@ManyToOne(targetEntity = Task.class)
	@ForeignKey(name = "fk_issuehist_task")
	@Index(name = "idx_issuehist_task")
	public Task getTask() {
		return this.task;
	}

	public void setTask(Task task) {
		this.task = task;
	}

	@ManyToOne(targetEntity = Issue.class)
	@ForeignKey(name = "fk_mthist_issue")
	@Index(name = "idx_mthist_meetingRoom")
	public MeetingRoom getMeetingRoom() {
		return this.meetingRoom;
	}

	public void setMeetingRoom(MeetingRoom meetingRoom) {
		this.meetingRoom = meetingRoom;
	}

	public boolean somethingChanged(MeetingRoom meetingRoom) {
		boolean changed = false;
		if (((getTask() != null) && (!getTask().equals(meetingRoom.getTask())))
				|| ((getTask() == null) && (meetingRoom.getTask() != null))) {
			setTask(meetingRoom.getTask());
			changed = true;
		} else {
			setTask(null);
		}
		if (((getOldStatus() != null) && (!getOldStatus().equals(meetingRoom.getStatus())))
				|| ((getOldStatus() == null) && (meetingRoom.getStatus() != null))) {
			setStatus(meetingRoom.getStatus());
			changed = true;
		} else {
			setStatus(null);
		}
		// if (((getAssignee() != null) &&
		// (!getAssignee().equals(issue.getAssignedTo())))
		// || ((getAssignee() == null) && (issue.getAssignedTo() != null))) {
		// setAssignee(issue.getAssignedTo());
		// changed = true;
		// } else {
		// setAssignee(null);
		// }
		if (changed) {
			meetingRoom.setLastMeetingRoomHistory(this);
		} else {
			meetingRoom.setLastMeetingRoomHistory(null);
		}
		return changed;
	}

	public boolean testChangedAndStore() throws StoreException {
		boolean ret = somethingChanged(this.meetingRoom);
		if (ret) {
			store();
		}
		return ret;
	}

	public static IssueHistory load(Serializable mainObjectId) throws FindByPrimaryKeyException {
		return (IssueHistory) PersistenceHome.findByPrimaryKey(IssueHistory.class, mainObjectId);
	}

	@Column(length = 60)
	@Index(name = "idx_issue_extemail")
	public String getExtRequesterEmail() {
		return this.extRequesterEmail;
	}

	public void setExtRequesterEmail(String extRequesterEmail) {
		this.extRequesterEmail = extRequesterEmail;
	}

	@Override
	public JSONObject jsonify() {
		JSONObject jso = new JSONObject();

		jso.element("id", getId());
		jso.element("comment", JSP.encode(getComment()));

		Task task = getTask();
		if (task != null) {
			jso.element("taskId", task.getId());

			jso.element("taskName", task.getName());
			jso.element("taskCodde", task.getCode());
			jso.element("tcodid", task.getMnemonicCode());
			jso.element("taskOrder", task.getName());
		}

		if (getStatus() != null) {
			jso.element("statusId", getStatus().getId());
			jso.element("statusName", getStatus().getDescription());
			jso.element("statusColor", getStatus().getColor());
			jso.element("statusOrder", getStatus().getOrderBy());
			jso.element("isOpen", getStatus().isBehavesAsOpen());
		}
		if (getOldStatus() != null) {
			jso.element("oldStatusId", getOldStatus().getId());
			jso.element("oldStatusName", getOldStatus().getDescription());
			jso.element("oldStatusColor", getOldStatus().getColor());
			jso.element("oldStatusOrder", getOldStatus().getOrderBy());
			jso.element("oldSisOpen", getOldStatus().isBehavesAsOpen());
		}
		jso.element("lastModified", getLastModified().getTime());
		jso.element("lastModifier", getLastModifier());

		jso.element("creationDate", getCreationDate().getTime());
		jso.element("creator", getCreator());

		jso.element("ownerId", getOwner() == null ? "-1" : getOwner().getId());
		if (getOwner() != null) {
			jso.element("ownerAvatarUrl", ((TeamworkOperator) getOwner()).getPerson().bricks.getAvatarImageUrl());
		} else if (JSP.ex(getExtRequesterEmail())) {
			jso.element("ownerAvatarUrl", ResourceBricks.getGravatarUrl(getExtRequesterEmail(), 50));
		}
		jso.element("extRequesterEmail", getExtRequesterEmail());

		return jso;
	}
}
