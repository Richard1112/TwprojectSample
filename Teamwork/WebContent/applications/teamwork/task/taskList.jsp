<%@ page import="com.twproject.operator.TeamworkOperator, com.twproject.task.businessLogic.TaskController, com.twproject.waf.TeamworkHBFScreen, org.jblooming.utilities.JSP, org.jblooming.waf.ScreenArea,
                 org.jblooming.waf.constants.Commands, org.jblooming.waf.constants.Fields, org.jblooming.waf.html.button.ButtonSubmit, org.jblooming.waf.html.core.JspHelper, org.jblooming.waf.html.display.DataTable,
                 org.jblooming.waf.html.input.LoadSaveFilter, org.jblooming.waf.html.state.Form, org.jblooming.waf.settings.I18n, org.jblooming.waf.view.PageSeed, org.jblooming.waf.view.PageState, org.jblooming.waf.PluginBricks, org.jblooming.waf.html.button.ButtonSupport, org.jblooming.waf.html.button.ButtonLink, org.jblooming.waf.settings.ApplicationState, org.jblooming.waf.html.button.ButtonJS, com.twproject.security.TeamworkPermissions, org.jblooming.waf.html.container.DivOnMouseover" %> <%


    PageState pageState = PageState.getCurrentPageState(request);

    if (!pageState.screenRunning) {
        pageState.screenRunning = true;
        final ScreenArea body = new ScreenArea(new TaskController(), request);
        TeamworkHBFScreen lw = new TeamworkHBFScreen(body);
        lw.register(pageState);
        pageState.perform(request, response);
        pageState.toHtml(pageContext);

    } else {
        TeamworkOperator logged = (TeamworkOperator) pageState.getLoggedOperator();

        PageSeed self = pageState.thisPage(request);
        self.setCommand(Commands.FIND);
        Form f = new Form(self);
        f.id = "TASK_LIST";
        f.alertOnChange = false;

        pageState.setForm(f);
        f.start(pageContext);

        DataTable dataTable= new DataTable("TSKLST",f, new JspHelper("/applications/teamwork/task/rowTaskList.jsp"), TaskController.class,pageState );
        dataTable.addHeader(I18n.get("STATUS"),"task.status");
        dataTable.addHeader(I18n.get("TASK_NAME"), null,null,"task.name","headTaskName");
        dataTable.addHeader(I18n.get("TASK_CODE"),"1%","task.code");

        dataTable.addHeader(I18n.get("TYPE"), "task.type");
        dataTable.addHeader(I18n.get("START"),"task.schedule.start");
        dataTable.addHeader(I18n.get("END"),"task.schedule.end");
        dataTable.addHeader(I18n.get("ISSUES"),"task.totalIssuesOpen");
        dataTable.addHeader(I18n.get("WORKLOG_DONE_SHORT"),"task.totalWorklogDone");
        dataTable.addHeader("","1%",null);

        dataTable.addHeader(I18n.get("WORKGROUP"));
        dataTable.addHeader("<span class=teamworkIcon title="+I18n.get("TASK_DIARY")+">Q</span>");
        dataTable.addHeader("<span class=teamworkIcon title="+I18n.get("DOCUMENTS")+">n</span>");
        dataTable.addHeader(I18n.get("PROGRESS"),"1%","task.progress");
        dataTable.tableClass="table";


        LoadSaveFilter lsfb = new LoadSaveFilter("", "TASK", dataTable.form);
        lsfb.toolTip=I18n.get("MY_SAVED_FILTERS");
        lsfb.drawButtons = false;
        lsfb.drawEditor = true;


      String savedFilterName = pageState.getEntry(Fields.FLD_FILTER_NAME).stringValueNullIfEmpty();%>

<%------------------------------------------------ MAIN COLUMN START ---------------------------------------------------------%>

<div class="mainColumn">

    <%---------------------------------------------- HEADER START ---------------------------------------------------------%>
    <h1 class="filterTitle" defaultTitle="<%=I18n.get("TASK_LIST")%>">
        <%=JSP.ex(savedFilterName)?I18n.get(savedFilterName):I18n.get("TASK_LIST")%>
    </h1>

    <%---------------------------------------------- HEADER END ---------------------------------------------------------%>

    <%----------------------------------------------------------------------------  START FILTER ----------------------------------------------------------------------------%>
    <% JspHelper filter = new JspHelper("partTaskListFilter.jsp");
        filter.parameters.put("searchButton", dataTable.getSearchButton());
        filter.parameters.put("loadSaveFilter",lsfb);
        filter.toHtml(pageContext);
    %>
    <%----------------------------------------------------------------------------  END FILTER ----------------------------------------------------------------------------%>
    <%

      ButtonSubmit toList=new ButtonSubmit(I18n.get("VIEW_AS_LIST"),"",f);
      toList.variationsFromForm.href="taskList.jsp";
      toList.hasFocus=true;

      ButtonSubmit toGantt=new ButtonSubmit(I18n.get("VIEW_AS_GANTT"),"",f);
      toGantt.variationsFromForm.href="taskListAsGantt.jsp";

%>
  <div style="position: relative">
    <%dataTable.drawPaginator(pageContext);%>
  </div>

  <%

      //---------------------------------  INIZIO TABELLA ----------------------------------------------
        dataTable.drawTable(pageContext);
      //---------------------------------  FINE TABELLA ----------------------------------------------

      dataTable.drawPaginatorPagesOnly(pageContext);
        new JspHelper("taskListNothingFound.jsp").toHtml(pageContext);
    %>

</div>
<%---------------------------------------------- MAIN COLUMN END ---------------------------------------------------------%>

<%---------------------------------------------- RIGHT COLUMN START ---------------------------------------------------------%>
<% JspHelper rightColumn = new JspHelper("partTaskListRightColumn.jsp");
    rightColumn.parameters.put("loadSaveFilter",lsfb);
    rightColumn.toHtml(pageContext);%>
<%------------------------------------------------ RIGHT COLUMN END ---------------------------------------------------------%>

<%
        f.end(pageContext);
%>

<script>
  $("#TASK_MENU").addClass('selected');

  //inject the table search
  createTableFilterElement($("#headTaskName"),".dataTable .taskRow",".tlTaskCode,.tlTaskName");


  //chiamata ogni volta che si rinfresca la tabella
  function dataTableCallback(totalNumberOfElements){
    //console.debug("Task List, dataTableCallback",totalNumberOfElements);
    if (totalNumberOfElements>0) {
      $("#btn_ttlp,#btn_gnt_print,#btn_print").removeAttr("disabled").show();
      $("#no_task_add_box").hide();
    }else {
      $("#btn_ttlp,#btn_gnt_print,#btn_print").attr("disabled", true).hide();
      $("#no_task_add_box").show();
    }
  }


  //todo questo deve fare chiamata server side, chiedere le note, rinfrescare la pagina e se non si poteva fare il cambio stato rimettere lo stato vecchio
  function changeStatus(hidden,data){
    //console.debug("changeStatus",hidden,data);
  }

</script>


<%
    }

%>
