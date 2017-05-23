<%@ page import="com.twproject.operator.TeamworkOperator, com.twproject.security.TeamworkPermissions, com.twproject.waf.TeamworkPopUpScreen, org.jblooming.company.DepartmentType, org.jblooming.ontology.businessLogic.DeleteHelper, org.jblooming.oql.OqlQuery, org.jblooming.persistence.PersistenceHome, org.jblooming.persistence.exceptions.PersistenceException, org.jblooming.security.Area, org.jblooming.waf.ScreenArea, org.jblooming.waf.SessionState, org.jblooming.waf.constants.Commands, org.jblooming.waf.html.button.ButtonLink, org.jblooming.waf.html.button.ButtonSubmit, org.jblooming.waf.html.container.ButtonBar, org.jblooming.waf.html.display.DeletePreviewer, org.jblooming.waf.html.input.TextField, org.jblooming.waf.html.state.Form, org.jblooming.waf.settings.I18n, org.jblooming.waf.view.ClientEntry, org.jblooming.waf.view.PageSeed, org.jblooming.waf.view.PageState, java.util.List, java.util.Map, java.util.Set" %>
<%

  PageState pageState = PageState.getCurrentPageState(request);

  if (!pageState.screenRunning) {

    pageState.screenRunning = true;

    final ScreenArea body = new ScreenArea(request);
    TeamworkPopUpScreen lw = new TeamworkPopUpScreen(body);
    lw.register(pageState);
    pageState.perform(request, response);

    if (Commands.SAVE.equals(pageState.command)) {

      Map<String, ClientEntry> map = pageState.getClientEntries().getEntriesStartingWithStripped("DESC_");
      for (String id : map.keySet()) {

        DepartmentType t = (DepartmentType) PersistenceHome.findByPrimaryKey(DepartmentType.class, id);
        t.setStringValue(pageState.getEntry("CODE_" + id).stringValue());
        t.setDescription(pageState.getEntry("DESC_" + id).stringValue());
        t.store();
      }

      String newDesc = pageState.getEntry("DESC").stringValueNullIfEmpty();
      if (newDesc != null) {
        DepartmentType t = new DepartmentType();
        t.setStringValue(pageState.getEntry("CODE").stringValue());
        t.setDescription(pageState.getEntry("DESC").stringValue());
        t.store();
        pageState.removeEntry("CODE");
        pageState.removeEntry("DESC");
      }

    } else if (Commands.DELETE_PREVIEW.equals(pageState.command)) {
      DepartmentType t = (DepartmentType) PersistenceHome.findByPrimaryKey(DepartmentType.class, pageState.mainObjectId);
      pageState.setMainObject(t);

    } else if (Commands.DELETE.equals(pageState.command)) {

      try {
        DepartmentType t = (DepartmentType) PersistenceHome.findByPrimaryKey(DepartmentType.class, pageState.mainObjectId);
        DeleteHelper.cmdDelete(t, pageState);
        pageState.mainObjectId = null;
        pageState.command = null;
      } catch (PersistenceException e) {
      }
    }

    pageState.toHtml(pageContext);

  } else {

    %><script>$("#RESOURCE_MENU").addClass('selected');</script><%

    TeamworkOperator logged = (TeamworkOperator) pageState.getLoggedOperator();
    Set<Area> areas = null;

    if (!logged.hasPermissionAsAdmin()) {
      areas = logged.getAreasForPermission(TeamworkPermissions.classificationTree_canManage);
      if (areas.size() == 0)
        throw new SecurityException("Cannot manage task types");
    }

    String hql = "from " + DepartmentType.class.getName() + " as tt ";
    OqlQuery oql = new OqlQuery(hql);
    List<DepartmentType> tts = oql.list();

%><h1><%=I18n.get("DEPARTMENT_TYPE_MENU")%></h1><%

    PageSeed ps = pageState.thisPage(request);
    ps.mainObjectId = pageState.mainObjectId;
    Form form = new Form(ps);
    pageState.setForm(form);
    form.start(pageContext);

%><table class="table"><tr><th class="tableHead">Id</th><th class="tableHead"><%=I18n.get("CODE")%></th><th class="tableHead"><%=I18n.get("DESCRIPTION")%></th><th class="tableHead"><%=I18n.get("DELETE_SHORT")%></th></tr><%


    for (DepartmentType tt : tts) {
     
        %> <tr class="alternate" >
       <td><%=tt.getId()%></td><%

      pageState.addClientEntry("CODE_"+tt.getId(),tt.getStringValue());
      TextField tf = new TextField("TEXT","","CODE_"+tt.getId(),"",15,false);
      tf.label="";
      tf.separator="";

      %><td><%tf.toHtml(pageContext);%></td><%

      pageState.addClientEntry("DESC_"+tt.getId(),tt.getDescription());
      tf = new TextField("TEXT","","DESC_"+tt.getId(),"",30,false);
      tf.label="";
      tf.separator="";  
      %><td><%tf.toHtml(pageContext);%></td>

      <td align="center"><%ButtonLink.getDeleteInstanceForList("departmentType.jsp",tt,request).toHtml(pageContext);%></td></tr><%

    }

%>
  <tr class="alternate highlight"><td><span class="sectionTitle"><%=I18n.get("TASK_TYPE_NEW")%></span></td><%

    TextField tf = new TextField("TEXT","","CODE","",15,false);
    tf.label="";
    tf.separator="";
  %><td><%tf.toHtml(pageContext);%></td><%

    tf = new TextField("TEXT","","DESC","",30,false);
    tf.label="";
    tf.separator="";
  %><td colspan="2"><%tf.toHtml(pageContext);%></td></tr><%

    %></table><%
    ButtonBar bb = new ButtonBar();
    ButtonSubmit save = ButtonSubmit.getSaveInstance(form, I18n.get("SAVE"));
    save.additionalCssClass="first";
    bb.addButton(save);
    bb.toHtml(pageContext);

    new DeletePreviewer(form).toHtml(pageContext);

    form.end(pageContext);

  }


%>