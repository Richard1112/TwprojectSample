<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %><%@ page import="com.twproject.operator.TeamworkOperator,
                com.twproject.resource.Person,
                 com.twproject.security.RoleTeamwork,
                 com.twproject.security.SecurityBricks,
                 com.twproject.security.TeamworkPermissions,
                 com.twproject.task.Assignment,
                 com.twproject.task.Task,
                 com.twproject.task.TaskBricks,
                 com.twproject.waf.TeamworkPopUpScreen,
                 net.sf.json.JSONArray, net.sf.json.JSONObject, org.jblooming.waf.ScreenArea,
                 org.jblooming.waf.html.button.ButtonJS,
                 org.jblooming.waf.html.container.ButtonBar, org.jblooming.waf.html.core.JST,
                 org.jblooming.waf.html.input.SmartCombo, org.jblooming.waf.settings.I18n, org.jblooming.waf.view.PageState, org.jblooming.waf.html.display.Hint, org.jblooming.agenda.Period"%><%

PageState pageState = PageState.getCurrentPageState(request);
  if (!pageState.screenRunning) {
    pageState.screenRunning = true;
    //final ScreenArea body = new ScreenArea(new TaskController(), request);
    final ScreenArea body = new ScreenArea( request);
    TeamworkPopUpScreen lw = new TeamworkPopUpScreen(body);
    lw.register(pageState);
    pageState.perform(request, response);
    pageState.toHtml(pageContext);
  } else {

    Task task = Task.load(pageState.getEntry("TASK_ID").intValueNoErrorCodeNoExc()+"");

    if (task==null)
      return;

    task.bricks.buildPassport(pageState);

    TeamworkOperator loggedOperator = (TeamworkOperator) pageState.getLoggedOperator();
    Person loggedPerson = loggedOperator.getPerson();


//---------------------------------------------------- ASSIGNMENTS ------------------------------------------------------------------------

if (task.bricks.assignment_canCRW){

  ButtonJS add=new ButtonJS("addAssigRow({})");
  add.additionalCssClass="edit";
  add.iconChar="P";


%><h1><%=I18n.get("ADD_ASSIGNMENTS")%></h1>
<h3><%=task.getDisplayName()%></h3>


  <table class="table dataTable" assigs=true alertonchange=true>
    <tr>
      <th class="tableHead"><%=I18n.get("NAME")%></th>
      <th class="tableHead" id="rolesColumn"><%=I18n.get("ROLE")%></th>
      <th class="tableHead" colspan="2"><%=I18n.get("WORKLOG_ESTIMATED_SHORT")%></th>
      <th class="tableHead" style="text-align: center"><%add.toHtmlInTextOnlyModality(pageContext);%></th>
    </tr>
    </table><%

  }

  ButtonBar buttonBar = new ButtonBar();

  ButtonJS save = new ButtonJS(I18n.get("SAVE"),"createAssignments($(this));");
  save.additionalCssClass="first";
  save.enabled = task.bricks.assignment_canCRW;
  buttonBar.addButton(save);

  //buttonBar.loggableIdentifiableSupport = task;
  buttonBar.toHtml(pageContext);


  pageState.addClientEntry("resourceId","##resId##");
  pageState.addClientEntry("resourceId_txt","##resName##");
  SmartCombo resCombo = task.bricks.getAssignableResourceCombo("resourceId", false, pageState);
  resCombo.fieldSize = 30;
  resCombo.label = "";
  resCombo.linkToEntity=null;
  resCombo.separator="";
  resCombo.script="style=width:100%";
  resCombo.onValueSelectedScript="updateResourceLoad($(this));";
  //aggiungo un bottone aggiungi risorsa se ho i diritti
  if (pageState.getLoggedOperator().hasPermissionFor(TeamworkPermissions.resource_canCreate))
    resCombo.addEntityButton= new ButtonJS(I18n.get("ADD_RESOURCE"),"createNewResource($(this))");

  pageState.addClientEntry("roleId","##roleId##");
  pageState.addClientEntry("roleId_txt","##roleName##");
  SmartCombo roles = SecurityBricks.getRoleComboForAssignments("roleId", task, false, pageState);
  roles.fieldSize = 30;
  roles.label="";
  roles.separator="";
  roles.script=" style='width:100%;' role";

  RoleTeamwork projectManagerRole = TaskBricks.getProjectManagerRole(loggedPerson.getArea());
  RoleTeamwork customerRole = TaskBricks.getCustomerRole(loggedPerson.getArea());
  RoleTeamwork workerRole = TaskBricks.getWorkerRole(loggedPerson.getArea());

  Hint.HintWriter hintWriter = new Hint.HintWriter();
  hintWriter.addHint("HINT_FIRST_ASSIG_ROLE", "#roleId_txt", 400, 250,true, pageState);
  hintWriter.toHtml(pageContext);

  //si controlla se ci sono già delle assegnazioni in modo da proporre delle righe già pre-fillate
  boolean okPM=false;
  boolean okCUST=false;
  boolean okWK=false;
  boolean youAreAlready=false;

  for (Assignment ass: task.getAssignments()) {
    if (ass.getRole().equals(projectManagerRole))
      okPM = true;
    else if (ass.getRole().equals(customerRole))
      okCUST = true;
    else if (ass.getRole().equals(workerRole))
      okWK = true;

    if (ass.getResource().equals(loggedPerson))
      youAreAlready=true;
  }

  JSONArray assigsToAdd = new JSONArray();
  if(!okPM && projectManagerRole!=null){
    JSONObject a= new JSONObject();
    a.element("roleId",projectManagerRole.getId());
    a.element("roleName",projectManagerRole.getDisplayName());
    if (!youAreAlready){
      a.element("resId",loggedPerson.getId());
      a.element("resName",loggedPerson.getDisplayName());
      youAreAlready=true;
    }
    assigsToAdd.add(a);
  }
  if(!okWK && workerRole!=null){
    JSONObject a= new JSONObject();
    a.element("roleId",workerRole.getId());
    a.element("roleName",workerRole.getDisplayName());
    if (!youAreAlready){
      a.element("resId",loggedPerson.getId());
      a.element("resName",loggedPerson.getDisplayName());
      youAreAlready=true;
    }
    assigsToAdd.add(a);
  }
  if(!okCUST && customerRole!=null){
    JSONObject a= new JSONObject();
    a.element("roleId",customerRole.getId());
    a.element("roleName",customerRole.getDisplayName());
    a.element("resId","");
    a.element("resName","");
    assigsToAdd.add(a);
  }

  for (int i=assigsToAdd.size(); i<3;i++) {
    JSONObject a= new JSONObject();
    a.element("roleId","");
    a.element("roleName","");
    a.element("resId","");
    a.element("resName","");
    assigsToAdd.add(a);
  }

  Period period = new Period(task.getSchedule().getStartDate(),task.getSchedule().getEndDate());

%>

<div id="templates" style="display:none;">
<%-- ---------------------------------  ASSIGNMENT ROW ------------------------------------------------------------------------------------------------------------------- --%>
<%=JST.start("ASSIGNMENT_ROW")%>
<tr class="assigRow" >
  <td><%resCombo.toHtml(pageContext);%></td>
  <td><%roles.toHtml(pageContext);%></td>
  <td><input type="text" name="WL"  size="5" class="formElements validated durationmillis" onchange="updateResourceLoad($(this))" entryType="DURATIONMILLIS" style="width: 100%"></td>
  <td class="workloadInfo" align="center"></td>
  <td align="center"><span class="teamworkIcon delAssig delete" style="cursor: pointer" onclick="$(this).closest('tr').remove();">d</span></td>
</tr>
<%=JST.end()%>
</div>

<jsp:include page="plan/workloadUtilities.js.jsp"></jsp:include>

<script>
  $(function(){
    $("#templates").loadTemplates().remove();
    var assigsToAdd=<%=assigsToAdd%>;
    for (var i=0;i<assigsToAdd.length;i++){
      addAssigRow(assigsToAdd[i]);
    }
  });

  function addAssigRow(data){
    $("table[assigs] tr:last").after($.JST.createFromTemplate(data,"ASSIGNMENT_ROW"))
  }

  function createAssignments(el){
    //console.debug("createAssignments");
    if (canSubmitForm($("table[assigs]"))) {
      var data = {CM :"NEWASSIGS",taskId:"<%=task.getId()%>"};

      //recover assignemnts
      var assigs = [];

      $(".assigRow").each(function () {
        var row = $(this);
        var ass = {
          resId:  row.find("input[name=resourceId]").val(),
          roleId: row.find("input[name=roleId]").val(),
          estWl:  row.find("input[name=WL]").val()
        };
        if (ass.resId && ass.roleId)
          assigs.push(ass);
      });

      data.assigs = JSON.stringify(assigs);
      //console.debug(data);
      $.getJSON(contextPath+"/applications/teamwork/task/taskAjaxController.jsp",data,function(response){
        jsonResponseHandling(response);
        if (response.ok) {
          $("table[assigs] :input").updateOldValue(); // per non avere il messagio di leave
          //decide dove andare
          //top.location.href = contextPath + "/applications/teamwork/task/taskAssignmentList.jsp?CM=FN&TASK_ID=" + response.taskId;
          top.location.reload(true);
        }
        hideSavingMessage();
      });
    }
  }


  function updateResourceLoad(el){
    var row = el.closest("tr");
    computeResourceLoad(el,<%=period.jsonify()%>,row.find("[name=resourceId]").val(), millisFromString(row.find("[name=WL]").val()),-1);
  }

    <%------------------------------------------- ADD RESOURCE MANAGEMENT ---------------------------------------------------%>
  function createNewResource(el){
    var row = el.closest(".assigRow");
    var name=row.find("[name=resourceId_txt]").val();
    var url= contextPath + "/applications/teamwork/resource/resourceNew.jsp?CM=ADD&name="+encodeURI(name);

    openBlackPopup(url,700,320,function(response) {
      //fillare lo smart combo
      if (response && response.resId && response.resName) {
        row.find("[name=resourceId]").val(response.resId);
        row.find("[name=resourceId_txt]").val(response.resName).focus().blur();

        //se è stata creato un login si comunicano i dati
        if (response.loginCreatedMessage)
          showFeedbackMessage("INFO",response.loginCreatedMessage);
      }
    })
  }

</script>

  <%


  }
  %>
