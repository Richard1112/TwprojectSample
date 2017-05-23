<%@ page import="org.jblooming.scheduler.Job, org.jblooming.waf.constants.Commands, org.jblooming.waf.html.button.ButtonLink, org.jblooming.waf.html.core.JspHelper, org.jblooming.waf.html.core.JspIncluderSupport, org.jblooming.waf.settings.I18n, org.jblooming.waf.view.PageSeed, org.jblooming.waf.view.PageState" %>
<%

  JspHelper rowDrawer = (JspHelper) JspIncluderSupport.getCurrentInstance(request);
  Job job = (Job) rowDrawer.parameters.get("ROW_OBJ");

  PageState pageState = PageState.getCurrentPageState(request);

  PageSeed edit = new PageSeed("jobEditor.jsp");
  edit.command=Commands.EDIT;

  edit.setMainObjectId(job.getId());
  ButtonLink editLink = ButtonLink.getTextualInstance(job.getName(), edit);


  PageSeed onOff = pageState.pageFromCommonsRoot("scheduler/jobList.jsp");
  onOff.setCommand("ONOFF");
  onOff.setMainObjectId(job.getId());
  ButtonLink inst = new ButtonLink(onOff);
  inst.iconChar = job.isEnabled() ? ";" : "&iexcl;";
  inst.label = "";
  inst.toolTip = I18n.get(job.isEnabled() ? "DISABLE" : "ENABLE");

  PageSeed del = new PageSeed("jobEditor.jsp");
  del.setMainObjectId(job.getId());
  del.setCommand(Commands.DELETE_PREVIEW);
  ButtonLink delLink = new ButtonLink(del);
  delLink.iconChar = "d";
  delLink.label = "";
  delLink.additionalCssClass="delete";



%>
<a href="<%=edit.toLinkToHref()%>">
  <tr class="alternate">
    <td><%editLink.toHtml(pageContext);%></td>
    <td><%=job.getDescription() != null ? job.getDescription() : ""%>
    </td>
    <td><%=job.getExecutable() != null ? job.getExecutable() : ""%>
    </td>
    <td><%=job.getSchedule().getName()%></td>
    <td align="center"><%inst.toHtmlInTextOnlyModality(pageContext);%></td>
    <td align="center" class="lreq30"><%delLink.toHtmlInTextOnlyModality(pageContext);%></td>
  </tr>
</a>

