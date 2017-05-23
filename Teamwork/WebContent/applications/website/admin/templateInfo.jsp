<%@ page import="com.twproject.waf.TeamworkPopUpScreen"%>
<%@ page import="org.jblooming.operator.Operator"%>
<%@ page import="org.jblooming.waf.ScreenArea"%>
<%@ page import="org.jblooming.waf.SessionState"%>
<%@ page import="org.jblooming.waf.settings.I18n"%>
<%@ page import="org.jblooming.waf.view.PageState"%>
<%@page pageEncoding="UTF-8" %><%
  
  PageState pageState = PageState.getCurrentPageState(request);

  //verify permissions
  Operator logged = pageState.getLoggedOperator();
  if (logged==null || !logged.hasPermissionAsAdmin())
    throw new SecurityException(I18n.get("PERMISSION_LACKING"));  

  if (!pageState.screenRunning) {
    pageState.screenRunning = true;
    //put controller !
    final ScreenArea body = new ScreenArea(request);
    TeamworkPopUpScreen lw = new TeamworkPopUpScreen(body);
    lw.register(pageState);
    pageState.perform(request, response).toHtml(pageContext);

  } else {

%><h2><%=I18n.get("TEMPLATE_INFO_TITLE")%></h2>
<table class="table">
    <tr><td>
      <%=I18n.get("TEMPLATE_INFO")%>
      <!--
      Per poter essere utilizzato come template il file deve avere almeno un'area definita come tale.<br>
      Quindi all'interno di un qualsiasi tag html è necessario l'attributo <cite>areaname</cite>="...".<br>
      L'attributo <cite>custom</cite> (valore "yes" o "no") identifica un'area in cui gli utenti possono o meno inserire contenuti.<br>
      Se custom="yes" oppure non è specificato l'inserimento è libero.<br>
      Se custom="no" solo l'amministratore pu&ograve; inserire contenuti.
      N.B. il tag che contiene l'attributo areaName deve necessariamente avere il corrispondente tag di chiusura.
      Inoltre non sono supportate aree tra loro annidate
      Esempio:
      -->
    </td></tr>
    <tr><td>
      &lt;TABLE cellSpacing=0 cellPadding=0 width="100%" border=0&gt;<br>
&nbsp; &lt;TR&gt;<br>
&nbsp;&nbsp; &lt;TD <cite>areaname="AREA01" custom="yes"</cite>&gt;&lt;/TD&gt;<br>
&nbsp;&nbsp; &lt;TD <cite>areaname="AREA02" custom="yes"</cite>"&gt;&lt;/TD&gt;<br>
&nbsp;&nbsp; &lt;TD <cite>areaname="AREA03" custom="yes"</cite>&gt;&lt;/TD&gt;<br>
&nbsp;&nbsp; &lt;TD <cite>areaname="AREA04" custom="yes"</cite>&gt;&lt;/TD&gt;<br>
&nbsp; &lt;/TR&gt;<br>
      &lt;/TABLE&gt;<br>
      &lt;div <cite>areaname="FOOTER" custom="yes"</cite>&gt;&lt;/div&gt;<br>
    </td></tr>
    <tr><td><br><hr width="50%"><br></td></tr>
    <tr><td><%=I18n.get("NOT_SUPPORTED_HTML_CODE")%>
      &lt;TABLE width="100%"&gt;<br>
&nbsp; &lt;TR&gt;<br>
&nbsp;&nbsp; &lt;td <font color="red">areaName="AREA01"</font>&gt; <font color="red"><cite>it will be inserted *</cite></font><br>
&nbsp;&nbsp;&nbsp; &lt;TABLE width="100%"&gt;<br>
&nbsp;&nbsp;&nbsp;&nbsp; &lt;tr&gt;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;TD <font color="red">areaName="AREA02"</font> custom="yes"&gt;<font color="red"><cite>uncatched area</cite></font>&lt;/TD&gt;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;TD <font color="red">areaName="AREA03"</font> custom="yes"&gt;<font color="red"><cite>uncatched area</cite></font>&lt;/TD&gt;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;TD <font color="red">areaName="AREA04"</font> custom="yes"&gt;<font color="red"><cite>uncatched area</cite></font>&lt;/TD&gt;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;TD <font color="red">areaName="AREA05"</font> custom="no"&gt;<font color="red"><cite>uncatched are</cite>a</font>&lt;/TD&gt;<br>
&nbsp;&nbsp;&nbsp;&nbsp; &lt;/tr&gt;<br>
&nbsp;&nbsp;&nbsp; &lt;/table&gt;<br>
&nbsp;&nbsp; &lt;/td&gt;<br>
                <font color="red">* here AREA01 will be inserted</font><br>
&nbsp; &lt;/TR&gt;<br>
      &lt;/TABLE&gt;<br>
    </td></tr>
  </table><%


  }
%>
