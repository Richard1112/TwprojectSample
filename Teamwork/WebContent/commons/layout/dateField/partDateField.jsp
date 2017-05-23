<%@ page import="org.jblooming.utilities.DateUtilities,
                 org.jblooming.utilities.JSP,
                 org.jblooming.waf.html.core.JspIncluderSupport,
                 org.jblooming.waf.html.input.DateField,
                 org.jblooming.waf.html.input.InputElement,
                 org.jblooming.waf.html.input.TextField,
                 org.jblooming.waf.settings.I18n" %>
<%

  DateField dateField = (DateField) JspIncluderSupport.getCurrentInstance(request);
  StringBuffer inputScript = new StringBuffer();
  StringBuffer separ = new StringBuffer();

  if (!JSP.ex(dateField.dateFormat)) {
    dateField.dateFormat = DateUtilities.getFormat(DateUtilities.DATE_SHORT);
  }


  if (dateField.className == null)
    dateField.className = "formElements";
  if (dateField.separator == null || (dateField.labelstr != null && dateField.labelstr.length() > 0 && dateField.separator.length() == 0))
    dateField.separator = "</td><td>"; //

  separ.append(dateField.separator);


  if (!dateField.isSearchField()) {
    inputScript.append(" onblur =\"$(this).oneTime(100,'dfblur',function(){if ($(this).is('.formElementsError')) {");
    inputScript.append("$(this).focus();} ");

    if (dateField.onblurOnDateValid != null)
      inputScript.append(" else{" + dateField.onblurOnDateValid + "}");

    inputScript.append("});\" ");
  }

  if ((dateField.disabled) || (dateField.readOnly))
    dateField.readOnly = true;

  inputScript.append(JSP.w(dateField.script));
  inputScript.append(" format=\"" + dateField.dateFormat + "\"");


  TextField tf = new TextField("text", dateField.labelstr, dateField.fieldName, separ.toString(), dateField.size, false, dateField.readOnly, 255, inputScript.toString());
  tf.searchField = dateField.isSearchField();
  tf.preserveOldValue = dateField.preserveOldValue;
  tf.innerLabel = dateField.innerLabel;
  tf.disabled = dateField.disabled;
  tf.toolTip = dateField.toolTip;
  tf.minValue = dateField.minValue;
  tf.maxValue = dateField.maxValue;
  tf.fieldClass = dateField.className;
  tf.entryType= InputElement.EntryType.DATE;


  tf.id = dateField.id;

  if (dateField.required)
    tf.required = true;

  if (JSP.ex(dateField.getKeyToHandle()) && JSP.ex(dateField.getLaunchedJsOnActionListened()) && JSP.ex(dateField.getActionListened()))
    tf.addKeyPressControl(dateField.getKeyToHandle(), dateField.getLaunchedJsOnActionListened(), dateField.getActionListened());
  tf.toHtml(pageContext);
%><span title="<%=I18n.get("DATEFIELDCALENDAR")%>" id="<%=dateField.id%>s_inputDate" class="teamworkIcon openCalendar"
  onclick="$(this).dateField({inputField:$(this).prevAll(':input:first'),dateFormat:'<%=dateField.dateFormat%>',isSearchField:<%=dateField.isSearchField()?"true":"false"%>});">m</span>
            