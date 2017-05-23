/**
 * 
 */
package com.twproject.task;

import java.io.Serializable;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.jblooming.designer.DesignerField;
import org.jblooming.oql.OqlQuery;
import org.jblooming.oql.QueryHelper;
import org.jblooming.persistence.exceptions.FindException;
import org.jblooming.persistence.exceptions.PersistenceException;
import org.jblooming.security.Area;
import org.jblooming.security.Role;
import org.jblooming.utilities.JSP;
import org.jblooming.waf.Bricks;
import org.jblooming.waf.html.button.ButtonJS;
import org.jblooming.waf.html.button.ButtonLink;
import org.jblooming.waf.html.button.ButtonSupport;
import org.jblooming.waf.html.input.ColorValueChooser;
import org.jblooming.waf.html.input.SmartCombo;
import org.jblooming.waf.settings.ApplicationState;
import org.jblooming.waf.settings.I18n;
import org.jblooming.waf.view.PageSeed;
import org.jblooming.waf.view.PageState;
import org.jblooming.waf.view.RestState;

import com.twproject.operator.TeamworkOperator;
import com.twproject.resource.Person;
import com.twproject.resource.Resource;
import com.twproject.security.TeamworkPermissions;
import com.twproject.task.Assignment;
import com.twproject.task.Issue;
import com.twproject.task.IssueStatus;

/**
 * 工具类，用于组装下拉框等
 * 
 * @author WangXi
 * @create May 15, 2017
 */
public class MeetingRoomBricks extends Bricks {
	public MeetingRoom mainObject;
	public TeamworkOperator logged;
	public Person loggedPerson;
	public boolean canWrite;
	public boolean canAdd;
	public boolean canRead;
	public boolean canSelectAssignee;

	public MeetingRoomBricks(MeetingRoom document) {
		mainObject = document;
	}

	public static ButtonJS getBlackEditor(Serializable id) {
		return getBlackEditor(id, "ED");
	}

	public static ButtonJS getBlackEditor(Serializable id, String command) {
		return getBlackEditor(id, command, "");
	}

	public static ButtonJS getBlackEditor(Serializable id, String command, String params) {
		return new ButtonJS("openIssueEditorInBlack('" + id + "','" + command + "','" + params + "');");
	}

	public static ButtonLink getPopoupLinkToEditor(Serializable id) {
		PageSeed edit = new PageSeed(ApplicationState.serverURL + "/applications/teamwork/issue/issueList.jsp");
		edit.setCommand("FN");
		edit.addClientEntry("ISSUE_ID", id);
		ButtonLink link = new ButtonLink(edit);
		return link;
	}

	public String getGravityColor() {
		String color = "#666666";
		if ("05_GRAVITY_BLOCK".equals(mainObject.getGravity())) {
			color = "#FF0000";
		} else if ("04_GRAVITY_CRITICAL".equals(mainObject.getGravity())) {
			color = "#9A5932";
		} else if ("03_GRAVITY_HIGH".equals(mainObject.getGravity())) {
			color = "#F9791C";
		} else if ("02_GRAVITY_MEDIUM".equals(mainObject.getGravity())) {
			color = "#FFF32C";
		} else if ("01_GRAVITY_LOW".equals(mainObject.getGravity()))
			color = "#FFFFFF";
		return color;
	}

	public void buildPassport(RestState pageState) throws PersistenceException {
		if (this.logged == null) {
			TeamworkOperator logged = (TeamworkOperator) pageState.getLoggedOperator();

			this.logged = logged;

			loggedPerson = logged.getPerson();

			canAdd = mainObject.hasPermissionFor(logged, TeamworkPermissions.issue_canCreate);

			canWrite = (((canAdd) && (mainObject.isNew()))
					|| (mainObject.hasPermissionFor(logged, TeamworkPermissions.issue_canWrite)));

			canRead = ((canWrite) || (mainObject.hasPermissionFor(logged, TeamworkPermissions.issue_canRead)));
			canSelectAssignee = (((mainObject.getTask() != null)
					&& (mainObject.getTask().hasPermissionFor(logged, TeamworkPermissions.issue_canWrite)))
					|| (logged.hasPermissionFor(TeamworkPermissions.issue_canWrite)));
		}
	}

	public static SmartCombo getIssueCombo(String fieldName, boolean onlyOpenIssues, String additionalHql) {
		String hql = "select issue.id, substring(issue.description,1,40) || '..' from " + Issue.class.getName()
				+ " as issue ";
		QueryHelper queryHelperForFiltering = new QueryHelper(hql);

		if ((additionalHql != null) && (additionalHql.trim().length() > 0)) {
			queryHelperForFiltering.addOQLClause(additionalHql);
		}

		String baseFilter = " (issue.description like :filter)";

		if (onlyOpenIssues) {
			baseFilter = baseFilter + " and (issue.status.behavesAsOpen = true)";
		}

		queryHelperForFiltering.addOQLClause(baseFilter);

		queryHelperForFiltering.addToHqlString(" order by issue.description");

		String whereForId = "where issue.id = :filter";

		SmartCombo taskSC = new SmartCombo(fieldName, hql, null, whereForId);
		queryHelperForFiltering = queryHelperForFiltering;

		// separator = "</td><td>";
		// fieldSize = 40;

		return taskSC;
	}

	public static ColorValueChooser getStatusChooser(String fieldName, String type, PageState pageState)
			throws FindException {
		return getStatusChooser(fieldName, type, false, false, pageState);
	}

	public static ColorValueChooser getStatusChooser(String fieldName, String type, boolean addChoose, boolean multiple,
			PageState pageState) throws FindException {
		@SuppressWarnings("deprecation")
		ColorValueChooser ccv = new ColorValueChooser(fieldName, type, pageState);
		ccv.multiSelect = multiple;

		@SuppressWarnings("unchecked")
		List<MeetingRoomStatus> il = new OqlQuery(
				"select iss from " + MeetingRoomStatus.class.getName() + " as iss order by iss.orderBy").list();
		for (MeetingRoomStatus is : il) {
			ccv.addCodeColorValue(is.getId() + "", is.getColor(), is.getDescription());
		}
		if (addChoose)
			ccv.addCodeColorValue("", "gray", "- " + pageState.getI18n("EDITOR_CHOOSE") + " -");
		return ccv;
	}

	public static ColorValueChooser getGravityChooser(String fieldName, String type, boolean addChoose,
			boolean multiple, PageState pageState) {
		ColorValueChooser ccv = new ColorValueChooser(fieldName, type, pageState);
		// multiSelect = multiple;
		if (addChoose) {
			ccv.addCodeColorValue("", "gray", "- " + pageState.getI18n("EDITOR_CHOOSE") + " -");
		}
		for (String grv : Issue.getGravities()) {
			ccv.addCodeColorValue(grv, getGravityColor(grv), pageState.getI18n(grv));
		}
		return ccv;
	}

	public static int getGravityOrder(String gravity) {
		if ("05_GRAVITY_BLOCK".equals(gravity))
			return 1;
		if ("04_GRAVITY_CRITICAL".equals(gravity))
			return 2;
		if ("03_GRAVITY_HIGH".equals(gravity))
			return 3;
		if ("02_GRAVITY_MEDIUM".equals(gravity)) {
			return 4;
		}
		return 99;
	}

	public static String getGravityColor(String gravity) {
		if ("05_GRAVITY_BLOCK".equals(gravity))
			return "#DB2727";
		if ("04_GRAVITY_CRITICAL".equals(gravity))
			return "#8C6044";
		if ("03_GRAVITY_HIGH".equals(gravity))
			return "#F9791C";
		if ("02_GRAVITY_MEDIUM".equals(gravity)) {
			return "#F9C154";
		}
		return "#EEEEEE";
	}

	/**
	 * 下拉框做成
	 * 
	 * @param fieldName
	 *            控件名称
	 * @param mt
	 *            绑定对象
	 * @param pageState
	 *            页面流
	 * @return 下拉框对象
	 * @throws PersistenceException
	 *             SmartCombo
	 */
	public static SmartCombo getMtTypeCombo(String fieldName, MeetingRoom mt, PageState pageState)
			throws PersistenceException {
		String hql = "select tt.id, tt.description from " + MeetingRoomType.class.getName() + " as tt ";
		QueryHelper queryHelperForFiltering = new QueryHelper(hql);
		TeamworkOperator loggedOperator = (TeamworkOperator) pageState.getLoggedOperator();

		Set<Area> areas = new HashSet<>();

		if ((mt != null) && (mt.getTask() != null)) {
			areas.add(mt.getTask().getArea());
		} else {
			Area myArea = loggedOperator.getPerson().getArea();
			if (myArea != null) {
				areas.add(myArea);
			}
			Set<Area> areasGl = loggedOperator.getAreasForPermission(MyTeamworkPermissions.meetingRoom_canWrite);
			if (JSP.ex(areasGl)) {
				areas.addAll(areasGl);
			}
		}
		queryHelperForFiltering.addQueryClause("tt.area in (:areas) or tt.area is null");
		queryHelperForFiltering.addParameter("areas", areas);

		String baseFilter = " (tt.description like :filter) ";

		queryHelperForFiltering.addOQLClause(baseFilter);

		queryHelperForFiltering.addToHqlString(" order by tt.intValue, tt.description");

		String whereForId = "where tt.id = :filter";

		SmartCombo taskSC = new SmartCombo(fieldName, hql, null, whereForId);
		taskSC.searchAll = true;
		taskSC.queryHelperForFiltering = queryHelperForFiltering;
		taskSC.separator = "</td><td>";
		taskSC.fieldSize = 15;

		// 添加按钮
		if (pageState.getLoggedOperator().hasPermissionFor(TeamworkPermissions.classificationTree_canManage)) {
			PageSeed issueTypeEditor = pageState.pageFromRoot("meetingRoom/meetingRoomType.jsp");
			ButtonSupport addTT = ButtonLink.getBlackInstance(I18n.get("ADD_TYPE"), issueTypeEditor);
			addTT.enabled = loggedOperator.hasPermissionFor(TeamworkPermissions.classificationTree_canManage);
			taskSC.addEntityButton = addTT;
		}

		return taskSC;
	}


	public static boolean hasCustomField() {
		return DesignerField.hasCustomField("ISSUE_CUSTOM_FIELD_", 6);
	}

	public static void addOpenStatusFilter(PageSeed pageSeed) {
		String openStatuses = "";
		for (IssueStatus iss : IssueStatus.getStatusesAsOpen())
			openStatuses = openStatuses + iss.getId() + ",";
		openStatuses = openStatuses.endsWith(",") ? openStatuses.substring(0, openStatuses.length() - 1) : openStatuses;
		pageSeed.addClientEntry("FLT_ISSUE_STATUS", openStatuses);
	}

	public static void addCloseStatusFilter(PageSeed pageSeed) {
		String closeStatuses = "";
		for (IssueStatus iss : IssueStatus.getStatusesAsClose())
			closeStatuses = closeStatuses + iss.getId() + ",";
		closeStatuses = closeStatuses.endsWith(",") ? closeStatuses.substring(0, closeStatuses.length() - 1)
				: closeStatuses;
		pageSeed.addClientEntry("FLT_ISSUE_STATUS", closeStatuses);
	}

	public static void addSecurityClauses(QueryHelper qhelp, RestState restState) throws PersistenceException {
		TeamworkOperator logged = (TeamworkOperator) restState.getLoggedOperator();
		if (!logged.hasPermissionAsAdmin()) {
			Person myPerson = logged.getPerson();

			qhelp.addJoinAlias(" left outer join task.assignments as assignment");

			qhelp.addOQLClause("( issue.owner = :logged or issue.assignedTo=:loggedRes or ( ( task.owner = :logged",
					"logged", logged);
			qhelp.addParameter("loggedRes", myPerson);

			Set<Area> areas = logged.getAreasForPermission(TeamworkPermissions.issue_canRead);
			if (areas.size() > 0) {
				qhelp.addOrQueryClause("task.area in (:areas)");
				qhelp.addParameter("areas", areas);
			}

			if (myPerson != null) {
				List<Resource> myAncs = myPerson.getAncestors();

				OqlQuery oqlQuery = new OqlQuery(" select distinct role from " + Assignment.class.getName()
						+ " as ass join ass.role as role where role.permissionIds like :taskRead and "
						+ "ass.resource in (:myAncs)");

				oqlQuery.getQuery().setParameterList("myAncs", myAncs);
				oqlQuery.getQuery().setString("taskRead", "%" + TeamworkPermissions.issue_canRead.toString() + "%");

				List<Role> roles = oqlQuery.list();
				if (roles.size() > 0) {
					qhelp.addOrQueryClause("assignment.role in (:assigRoles) and assignment.resource = :myself");
					qhelp.addParameter("myself", myPerson);
					qhelp.addParameter("assigRoles", roles);
				}
			}

			qhelp.addToHqlString(" ) or task is null ");

			qhelp.addOQLClause("( resource.owner = :logged", "logged", logged);

			if (areas.size() > 0) {
				qhelp.addOrQueryClause("resource.area in (:areas)");
			}

			qhelp.addToHqlString(") ) ");

			qhelp.addToHqlString(")");
		}
	}
}
