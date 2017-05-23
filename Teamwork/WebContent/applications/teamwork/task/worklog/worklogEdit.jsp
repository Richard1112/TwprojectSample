<%@ page import="com.twproject.operator.TeamworkOperator, com.twproject.waf.TeamworkPopUpScreen, com.twproject.worklog.Worklog, org.jblooming.persistence.PersistenceHome, org.jblooming.utilities.JSP, org.jblooming.waf.ScreenArea, org.jblooming.waf.constants.Commands, org.jblooming.waf.html.button.ButtonSubmit, org.jblooming.waf.html.container.ButtonBar, org.jblooming.waf.html.container.Container, org.jblooming.waf.html.input.DateField, org.jblooming.waf.html.input.TextField, org.jblooming.waf.html.state.Form, org.jblooming.waf.view.PageSeed, org.jblooming.waf.view.PageState, org.jblooming.waf.settings.I18n, org.jblooming.waf.html.button.ButtonLink"%>
<%
  PageState pageState = PageState.getCurrentPageState(request);
  if (!pageState.screenRunning) {
    pageState.screenRunning = true;
    final ScreenArea body = new ScreenArea(request);
    TeamworkPopUpScreen lw = new TeamworkPopUpScreen(body);
    lw.register(pageState);
    pageState.perform(request, response);
   pageState.toHtml(pageContext);

  } else {

    TeamworkOperator logged = (TeamworkOperator) pageState.getLoggedOperator();

    Worklog w = (Worklog) PersistenceHome.findByPrimaryKey(Worklog.class,pageState.mainObjectId);

    if (Commands.SAVE.equals(pageState.command) &&  w.bricks.canWrite(logged)) {

      w.setDuration(pageState.getEntry("ISSUE_WORKLOG_TIME").durationInWorkingMillis(true));
      w.setAction(pageState.getEntry("ISSUE_WORKLOG_ACTION").stringValue());
      w.setInserted(pageState.getEntry("WORKLOG_AT_DAY").dateValue());
      //ActionUtilities.setIdentifiable(pageState.getEntry("ISSUE"),w,"issue");
      w.store();

    } else {
      pageState.addClientEntryTime("ISSUE_WORKLOG_TIME",w.getDuration());
      pageState.addClientEntry("ISSUE_WORKLOG_ACTION",w.getAction());
      pageState.addClientEntry("WORKLOG_AT_DAY",w.getInserted());
      pageState.addClientEntry("ISSUE",w.getIssue());
    }

    PageSeed self = pageState.thisPage(request);
    self.mainObjectId = w.getId();
    self.setCommand(Commands.SAVE);

    Form f = new Form(self);
    f.start(pageContext);
    pageState.setForm(f);



  PageSeed edTask = pageState.pageFromRoot("task/taskAssignmentEditor.jsp");
  edTask.command = Commands.EDIT;
  edTask.addClientEntry("TASK_ID", w.getAssig().getTask().getId());
  edTask.mainObjectId = w.getAssig().getId();
  ButtonLink editLink = ButtonLink.getTextualInstance(I18n.get("EDIT_ASSIGNMENT"), edTask);
  editLink.label = w.getAssig().getDisplayName();

  TextField dur = new TextField("ISSUE_WORKLOG_TIME","</td><td>");
  dur.fieldSize=6;


  DateField df = new DateField("WORKLOG_AT_DAY",pageState);
  df.toolTip = I18n.get("WORKLOG_AT_DAY_EDIT_HELP");

  TextField act = new TextField("ISSUE_WORKLOG_ACTION","</td><td>");
  act.fieldSize=50;

%>
<h2><%=I18n.get("WORKLOG_EDIT")%></h2>
<table class="table">
  <tr>
    <td><%=I18n.get("ASSIGNMENT")%></td>
    <td><%editLink.toHtmlInTextOnlyModality(pageContext);%></td>
  </tr>
  <tr>
    <td><label><%=I18n.get("ISSUE")%></label></td>
    <td><%=w.getIssue() != null ? JSP.encode(w.getIssue().getDescription()) : ""%></td>
  </tr>
  <tr>
    <td><%dur.toHtmlI18n(pageContext);%></td>
  </tr>

  <tr>
    <td><%df.toHtmlI18n(pageContext);%></td>
  </tr>
  <tr>
    <td><%act.toHtmlI18n(pageContext);%></td>
  </tr>
</table>
<%

    ButtonBar bb = new ButtonBar();
    ButtonSubmit saveInstance = ButtonSubmit.getSaveInstance(f, I18n.get("SAVE"));
    boolean canWrite = w.bricks.canWrite(logged);
    saveInstance.enabled = canWrite;

    bb.addButton(saveInstance);

    bb.toHtml(pageContext);

    f.end(pageContext);

  }
  %>


