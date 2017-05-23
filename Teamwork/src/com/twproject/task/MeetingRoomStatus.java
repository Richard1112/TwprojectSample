/**
 * 
 */
package com.twproject.task;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.Query;
import org.hibernate.annotations.Type;
import org.jblooming.PlatformRuntimeException;
import org.jblooming.ontology.IdentifiableSupport;
import org.jblooming.oql.OqlQuery;
import org.jblooming.persistence.PersistenceHome;
import org.jblooming.persistence.exceptions.FindByPrimaryKeyException;


/**
 * 会议室状态
 * 
 * @author WangXi
 * @create May 15, 2017
 */
@SuppressWarnings("rawtypes")
@Entity
@Table(name = "twk_meetingRoom_status")
public class MeetingRoomStatus extends IdentifiableSupport {
	private String description;
	private boolean behavesAsOpen;
	private boolean behavesAsClosed;
	private boolean askForComment;
	private boolean askForWorklog;
	private int orderBy;
	private String color;

	public MeetingRoomStatus() {
		System.out.println(12);
	}
	@Override
	@Id
	@Type(type = "int")
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Serializable getId() {
		return super.getId();
	}

	public boolean isBehavesAsOpen() {
		return behavesAsOpen;
	}

	public void setBehavesAsOpen(boolean behavesAsOpen) {
		this.behavesAsOpen = behavesAsOpen;
	}

	public boolean isBehavesAsClosed() {
		return behavesAsClosed;
	}

	public void setBehavesAsClosed(boolean behavesAsClosed) {
		this.behavesAsClosed = behavesAsClosed;
	}

	public boolean isAskForComment() {
		return askForComment;
	}

	public void setAskForComment(boolean askForComment) {
		this.askForComment = askForComment;
	}

	public boolean isAskForWorklog() {
		return askForWorklog;
	}

	public void setAskForWorklog(boolean askForWorklog) {
		this.askForWorklog = askForWorklog;
	}

	public int getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(int orderBy) {
		this.orderBy = orderBy;
	}

	public static MeetingRoomStatus load(Serializable id) throws FindByPrimaryKeyException {
		return (MeetingRoomStatus) PersistenceHome.findByPrimaryKey(MeetingRoomStatus.class, id);
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Transient
	public static MeetingRoomStatus getStatusClose() {
		Query query = new OqlQuery("select iss from " + MeetingRoomStatus.class.getName()
				+ " as iss where iss.behavesAsClosed=true order by iss.orderBy").getQuery();
		query.setMaxResults(1);

		MeetingRoomStatus status = (MeetingRoomStatus) query.uniqueResult();
		if (status == null)
			throw new PlatformRuntimeException("There is no issue status that behaves as 'closed'");
		return status;
	}

	@Transient
	public static MeetingRoomStatus getStatusOpen() {
		Query query = new OqlQuery("select iss from " + MeetingRoomStatus.class.getName()
				+ " as iss  order by iss.orderBy").getQuery();
		query.setMaxResults(1);

		MeetingRoomStatus status = (MeetingRoomStatus) query.uniqueResult();
		if (status == null)
			throw new PlatformRuntimeException("There is no issue status that behaves as 'open'");
		return status;
	}

	@Transient
	public static List<MeetingRoomStatus> getStatusesAsOpen() {
		Query query = new OqlQuery("select iss from " + MeetingRoomStatus.class.getName()
				+ " as iss where iss.behavesAsOpen=true order by iss.orderBy").getQuery();
		@SuppressWarnings("unchecked")
		List<MeetingRoomStatus> statuses = query.list();
		return statuses;
	}

	@Transient
	public static List<MeetingRoomStatus> getStatusesAsClose() {
		Query query = new OqlQuery("select iss from " + MeetingRoomStatus.class.getName()
				+ " as iss where iss.behavesAsClosed=true order by iss.orderBy").getQuery();
		@SuppressWarnings("unchecked")
		List<MeetingRoomStatus> statuses = query.list();
		return statuses;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}
}
