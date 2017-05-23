<%@ page import="com.twproject.resource.Person,
                 com.twproject.resource.ResourceBricks,
                 com.twproject.security.TeamworkPermissions,
                 com.twproject.task.Issue,
                 com.twproject.task.IssueBricks,
                 com.twproject.task.TaskBricks,
                 org.jblooming.operator.Operator,
                 org.jblooming.utilities.JSP,
                 org.jblooming.waf.SessionState,
                 org.jblooming.waf.constants.Fields,
                 org.jblooming.waf.html.button.ButtonJS,
                 org.jblooming.waf.html.button.ButtonLink,
                 org.jblooming.waf.html.container.ButtonBar,
                 org.jblooming.waf.html.input.*,
                 org.jblooming.waf.html.state.Form,
                 org.jblooming.waf.settings.ApplicationState,
                 org.jblooming.waf.settings.I18n,
                 org.jblooming.waf.view.PageSeed,
                 org.jblooming.waf.view.PageState, 
                 com.twproject.task.IssueStatus, 
                 com.twproject.resource.Resource,
                 
                 com.twproject.task.MyTeamworkPermissions,
                 com.twproject.task.MeetingRoom,
                 com.twproject.task.MeetingRoomBricks,
                 com.twproject.task.MeetingRoomStatus"
  %>
<%

  PageState pageState = PageState.getCurrentPageState(request);

%>
<div id="createMtExDiv" class="portletBox" style="background-color: #FBFBD4">
<script>

  function saveAndReloadMt(button) {
    //console.debug("saveAndReloadIssues")
    if(canSubmitForm('CREATEMT_FORM')) {
      showSavingMessage();
      var request = {CM: "SV", OBJID: "new", setValuesAsDefault: "yes"};
      $("#mtCreateLine").fillJsonWithInputValues(request);

      $.getJSON(contextPath + "/applications/teamwork/meetingRoom/meetingRoomAjaxControllerJson.jsp", request, function (response) {
        jsonResponseHandling(response);
        if (response.ok) {
          showFeedbackMessageInDiv("OK", "<%=I18n.get("ROOM_CORRECTLY_SAVED")%>", "createMtExDiv");
          //$("#ISSUE_DESCRIPTION").val("");
          $("body").trigger("mtEvent", [
            {type: "save", response: response}
          ])
        }
        hideSavingMessage();
      });
    }
  }

</script>
<%

  Operator logged = pageState.getLoggedOperator();

  PageSeed self = pageState.pagePart(request);
  Form f = new Form(self);
  f.id = "CREATEMT_FORM";
  f.additionalParams="novalidate";
  pageState.setForm(f);

  f.start(pageContext);


  //set combbox default value
  
  //pageState.getEntryOrDefault("STATUS", MeetingRoomStatus.getStatusOpen().getId()+"");
  pageState.getEntryOrDefault("GRAVITY",MeetingRoom.GRAVITY_MEDIUM);


  //set title link
  PageSeed ps = new PageSeed(request.getContextPath() + "/applications/teamwork/issue/issueList.jsp");
  ButtonLink sub = new ButtonLink(ps);
  sub.iconChar = "i";
  sub.label = "";


%>
<div style="float:right;padding-top: 15px">
  <%//sub.toHtmlInTextOnlyModality(pageContext);
  sub.label=I18n.get("ADD_MEETINGROOM");
    sub.iconChar="";
  %>
</div>
<h1><%sub.toHtmlInTextOnlyModality(pageContext);%>
</h1>
<div class="issueRow issueRowFocused">


  <table id="mtCreateLine" width="100%" border="0">
    <tr>
      <td nowrap valign="top" colspan="3"><%
    	TextField tf = new TextField(I18n.get("ROOM_NAME"), "NAME", "<br>", 30);
      	tf.required = true;
      	tf.toHtml(pageContext);

      %></td>
    </tr>
    <tr>
      <td colspan="3"><%
        TextArea ta = new TextArea(I18n.get("ROOM_DESCRIPTION"), "DESCRIPTION", "", 70, 10, "");
        ta.script = "style='height:123px;width:100%;'";
        ta.toolTip = "MEETINGROOM DESCRIPTION";
        ta.required = false;
        ta.toHtml(pageContext);
      %></td>
    </tr>
    <tr>
      <td>
        <div id="createIssues" <%--style="<%=showDiv ? ""  : "display:none"%>"--%>><%
          //SmartCombo taskSC = TaskBricks.getTaskCombo("ISSUE_TASK", false, TeamworkPermissions.issue_canCreate, pageState);
          SmartCombo taskSC = TaskBricks.getTaskCombo("MEETINGROOM_TASK", true, TeamworkPermissions.issue_canCreate, pageState);
          taskSC.fieldSize = 10;
          taskSC.separator = "<br>";
          taskSC.preserveOldValue = false;
          taskSC.addAllowed = true;
          taskSC.required = true;
          taskSC.label = I18n.get("ROOM_TASK");
          taskSC.toHtmlI18n(pageContext);
          //inhibit submit
        %></div>

      </td>
      <td align="left" nowrap><%
          SmartCombo sc = MeetingRoomBricks.getMtTypeCombo("MEETINGROOM_TYPE", null, pageState);
          sc.separator = "<br>";
          sc.label = I18n.get("ROOM_TYPE");
          sc.fieldSize = 10;
          sc.toHtml(pageContext);
      %> </td>

      <td></td>
    </tr>
    <tr>
      <td><%

        ColorValueChooser cvcG = IssueBricks.getGravityChooser("MEETINGROOM_GRAVITY", "ISSGRLIN", false, false, pageState);
        cvcG.height = 30;
        cvcG.label = "";
        cvcG.label = I18n.get("ROOM_GRAVITY");
        cvcG.separator = "<br>";
        cvcG.showOpener = true;
        cvcG.toHtml(pageContext);

      %></td>
      <td valign="top">1<%


        ColorValueChooser cvcS = MeetingRoomBricks.getStatusChooser("MEETINGROOM_STATUS", "STATUSLINE_MT", pageState);
      cvcS.label = I18n.get("ROOM_STATUS");
      cvcS.height = 30;
      cvcS.separator = "<br>";
      cvcS.showOpener = true;
      cvcS.toHtml(pageContext);


      %></td>

      <td></td>
    </tr>

  </table>
  <div class="editButton"><%

    ButtonBar bar = new ButtonBar();
    bar.buttonAreaHtmlClass="buttonArea notFix";
    ButtonJS savebutton = new ButtonJS(I18n.get("SAVE"), "saveAndReloadMt($(this));");
    savebutton.additionalCssClass = "first";
    bar.addButton(savebutton);
    bar.toHtml(pageContext);

  %></div>
</div>
<%
  f.end(pageContext);
%></div>


