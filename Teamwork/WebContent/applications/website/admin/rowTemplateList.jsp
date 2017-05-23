<%@ page import=" com.opnlb.website.template.Template, org.jblooming.utilities.JSP, org.jblooming.waf.constants.Commands, org.jblooming.waf.constants.Fields, org.jblooming.waf.html.button.ButtonLink, org.jblooming.waf.html.core.JspHelper, org.jblooming.waf.html.core.JspIncluderSupport, org.jblooming.waf.settings.I18n, org.jblooming.waf.view.PageSeed" %>
<%
  JspHelper rowDrawer = (JspHelper) JspIncluderSupport.getCurrentInstance(request);
  Template template = (Template) rowDrawer.parameters.get("ROW_OBJ");

  PageSeed edit = new PageSeed("templateEditor.jsp");
  edit.setCommand(Commands.EDIT);
  edit.mainObjectId = template.getId();
  edit.addClientEntry("EDITOR", Fields.FALSE);

%>
<tr class="alternate">
  <td style="cursor:pointer"><%
    ButtonLink name = ButtonLink.getTextualInstance(template.getName(), edit);
    name.toHtmlInTextOnlyModality(pageContext);
  %></td>
  <td style="cursor:pointer"><%=JSP.w(template.getDescription())%></td>
  <td><%=JSP.w(template.getTemplateFile())%></td>
  <%
    ButtonLink delLink = new ButtonLink(edit);
    edit.setCommand(Commands.DELETE_PREVIEW);
    delLink.iconChar = "d";
    delLink.label = "";
    delLink.additionalCssClass = "delete";
    delLink.toolTip = I18n.get("DELETE") + " id: " + template.getId() + " - " + I18n.get("NAME") + ": " + template.getName();
  %>
  <td align="center"><%delLink.toHtmlInTextOnlyModality(pageContext);%></td>
</tr>