<%@ page import="com.twproject.task.Assignment, com.twproject.task.Task, net.sf.json.JSONArray, net.sf.json.JSONObject, org.jblooming.waf.html.core.JspHelper, org.jblooming.waf.html.core.JspIncluderSupport, org.jblooming.waf.view.PageState, com.twproject.security.TeamworkPermissions, com.twproject.task.TaskDependency" %><%
  JspHelper rowDrawer = (JspHelper) JspIncluderSupport.getCurrentInstance(request);
  Task task = (Task) ((Object[])rowDrawer.parameters.get("ROW_OBJ"))[0];

  PageState pageState = PageState.getCurrentPageState(request);

  JSONObject jTask = task.jsonify(false, pageState);

  //add depth
  jTask.element("level", 0);


  // in case of deps can't move
  if (task.getPreviouses().size()>0 || task.getNexts().size()>0) {
    jTask.element("hasExternalDep", true);
  }
  //add dependencies
  jTask.element("depends", "");


  //add assignments
  JSONArray assigs = new JSONArray();
  for (Assignment ass : task.getAssignementsSortedByRole()) {
    JSONObject jAss = new JSONObject();
    jAss.element("id", ass.getId());
    jAss.element("roleId", ass.getRole().getId());
    jAss.element("resourceId", ass.getResource().getId());
    jAss.element("effort", ass.getEstimatedWorklog());
    assigs.add(jAss);
  }
  jTask.element("assigs", assigs);

  //canWrite
  jTask.element("canWrite", task.hasPermissionFor(pageState.getLoggedOperator(), TeamworkPermissions.task_canWrite));
  jTask.element("canAddIssue", task.hasPermissionFor(pageState.getLoggedOperator(), TeamworkPermissions.issue_canCreate));

%><script>
  _tasks.push(<%=jTask.toString()%>);
  <%for (Assignment ass : task.getAssignementsSortedByRole()) {%>
    _resources[<%=ass.getResource().getId()%>]={id:<%=ass.getResource().getId()%>,name:"<%=ass.getResource().getName()%>"};
    _roles[<%=ass.getRole().getId()%>]={id:<%=ass.getRole().getId()%>,name:"<%=ass.getRole().getName()%>"};
  <%}%>
</script>

