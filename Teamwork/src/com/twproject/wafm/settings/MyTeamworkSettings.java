/**
 * 
 */
package com.twproject.wafm.settings;

import org.hibernate.MappingException;
import org.jblooming.persistence.hibernate.HibernateFactory;
import org.jblooming.persistence.hibernate.PlatformAnnotationConfiguration;
import org.jblooming.security.Permissions;
import org.jblooming.waf.settings.ApplicationState;
import org.jblooming.waf.settings.PlatformConfiguration;

import com.opnlb.fulltext.IndexingHelper;
import com.twproject.agenda.DiscussionPointStatus;
import com.twproject.agenda.Event;
import com.twproject.document.TeamworkDocument;
import com.twproject.forum.TeamworkForumEntry;
import com.twproject.meeting.DiscussionPoint;
import com.twproject.meeting.Meeting;
import com.twproject.messaging.board.Board;
import com.twproject.operator.TeamworkOperator;
import com.twproject.resource.Person;
import com.twproject.resource.Resource;
import com.twproject.security.TeamworkPermissions;
import com.twproject.setup.businessLogic.TeamworkClassLoader;
import com.twproject.task.Issue;
import com.twproject.task.IssueHistory;
import com.twproject.task.IssueStatus;
import com.twproject.task.MeetingRoom;
import com.twproject.task.MeetingRoomHistory;
import com.twproject.task.MeetingRoomStatus;
import com.twproject.task.Task;
import com.twproject.task.process.TaskProcess;
import com.twproject.waf.TeamworkCommandController;
import com.twproject.waf.TeamworkViewerBricks;
import com.twproject.waf.settings.TeamworkSettings;
import com.twproject.worklog.Worklog;
import com.twproject.worklog.WorklogPlan;
import com.twproject.worklog.WorklogSupport;

/**
 * @author x-wang
 *
 */
public class MyTeamworkSettings extends TeamworkSettings {

	/**
	 * 
	 */
	public MyTeamworkSettings() {
		super(TeamworkOperator.class,
				new Permissions[] { new TeamworkPermissions(), new com.opnlb.website.security.WebSitePermissions() });

		ApplicationState.commandController = TeamworkCommandController.class;

		PlatformConfiguration.schedulerRunsByDefault = true;

		org.jblooming.security.businessLogic.LoginAction.cookieName = "TEAMWORKCOOKIE";

		org.jblooming.security.businessLogic.LoginAction.cookiePath = "/applications/teamwork/security";

		TeamworkViewerBricks tvb = new TeamworkViewerBricks();
		ApplicationState.entityViewers.put(Issue.class.getName(), tvb);
		ApplicationState.entityViewers.put(Task.class.getName(), tvb);
		ApplicationState.entityViewers.put(Person.class.getName(), tvb);
		ApplicationState.entityViewers.put(com.twproject.resource.Company.class.getName(), tvb);
		ApplicationState.entityViewers.put(Resource.class.getName(), tvb);
		ApplicationState.entityViewers.put(Board.class.getName(), tvb);
		ApplicationState.entityViewers.put(Event.class.getName(), tvb);
		ApplicationState.entityViewers.put(TeamworkForumEntry.class.getName(), tvb);
		ApplicationState.entityViewers.put(Worklog.class.getName(), tvb);
		ApplicationState.entityViewers.put(WorklogPlan.class.getName(), tvb);
		ApplicationState.entityViewers.put(Meeting.class.getName(), tvb);
		ApplicationState.entityViewers.put(TeamworkDocument.class.getName(), tvb);

		// meetingroom
		ApplicationState.entityViewers.put(MeetingRoom.class.getName(), tvb);
		ApplicationState.entityViewers.put(MeetingRoomHistory.class.getName(), tvb);

	}

	@Override
	public void configurePersistence(PlatformConfiguration pc) throws Exception {
		try {
			new TeamworkClassLoader().getResource(Task.class.getName());

			@SuppressWarnings("deprecation")
			PlatformAnnotationConfiguration hibConfiguration = (PlatformAnnotationConfiguration) HibernateFactory
					.getConfig();

			IndexingHelper.baseConfiguration(hibConfiguration);
			org.jblooming.flowork.FlowHibernateConfiguration.configure(hibConfiguration);

			java.net.URL ce = HibernateFactory.class.getClassLoader().getResource("designer.hbm.xml");
			hibConfiguration.addURL(ce);

			ce = HibernateFactory.class.getClassLoader().getResource("flowork.hbm.xml");
			hibConfiguration.addURL(ce);

			ce = HibernateFactory.class.getClassLoader().getResource("teamwork.hbm.xml");
			hibConfiguration.addURL(ce);

			ce = HibernateFactory.class.getClassLoader().getResource("website.hbm.xml");
			hibConfiguration.addURL(ce);

			ce = HibernateFactory.class.getClassLoader().getResource("customMapping.hbm.xml");
			if (ce != null) {
				hibConfiguration.addURL(ce);
			}

			hibConfiguration.addAnnotatedClass(WorklogSupport.class);
			hibConfiguration.addAnnotatedClass(Worklog.class);
			hibConfiguration.addAnnotatedClass(WorklogPlan.class);

			hibConfiguration.addAnnotatedClass(TaskProcess.class);

			hibConfiguration.addAnnotatedClass(com.opnlb.website.forum.ForumEntry.class);
			hibConfiguration.addAnnotatedClass(Issue.class);

			hibConfiguration.addAnnotatedClass(TeamworkForumEntry.class);
			hibConfiguration.addAnnotatedClass(Meeting.class);
			hibConfiguration.addAnnotatedClass(Event.class);
			hibConfiguration.addAnnotatedClass(DiscussionPoint.class);
			hibConfiguration.addAnnotatedClass(com.twproject.meeting.DiscussionPointType.class);
			hibConfiguration.addAnnotatedClass(DiscussionPointStatus.class);
			hibConfiguration.addAnnotatedClass(com.twproject.rank.Hit.class);
			hibConfiguration.addAnnotatedClass(IssueHistory.class);
			hibConfiguration.addAnnotatedClass(IssueStatus.class);

			hibConfiguration.addAnnotatedClass(com.twproject.task.TaskDataHistory.class);
			hibConfiguration.addAnnotatedClass(com.twproject.task.AssignmentDataHistory.class);

			// meeting room
			hibConfiguration.addAnnotatedClass(MeetingRoom.class);
			hibConfiguration.addAnnotatedClass(MeetingRoomStatus.class);

		} catch (MappingException e) {
			throw new RuntimeException(e);
		}
	}
}
