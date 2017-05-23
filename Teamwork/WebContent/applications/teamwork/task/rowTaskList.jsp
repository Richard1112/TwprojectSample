<%@ page import="com.opnlb.website.forum.ForumEntry, com.twproject.operator.TeamworkOperator, com.twproject.resource.Resource, com.twproject.task.Assignment, com.twproject.task.IssueBricks, com.twproject.task.Task, com.twproject.waf.html.StatusIcon, org.jblooming.utilities.DateUtilities, org.jblooming.utilities.JSP, org.jblooming.waf.html.button.ButtonLink, org.jblooming.waf.html.core.JspHelper, org.jblooming.waf.html.core.JspIncluderSupport, org.jblooming.waf.html.display.PercentileDisplay, org.jblooming.waf.settings.I18n, org.jblooming.waf.view.PageSeed, org.jblooming.waf.view.PageState, java.util.List, org.jblooming.waf.html.button.ButtonJS, com.twproject.task.TaskStatus, org.jblooming.waf.html.input.ColorValueChooser, java.util.HashSet, java.util.Set" %><%


  JspHelper rowDrawer = (JspHelper) JspIncluderSupport.getCurrentInstance(request);
  Task task = (Task) ((Object[])rowDrawer.parameters.get("ROW_OBJ"))[0];

  PageState pageState = PageState.getCurrentPageState(request);

  TeamworkOperator logged= (TeamworkOperator) pageState.getLoggedOperator();
  ButtonLink bEdit = ButtonLink.getEditInstance("taskOverview.jsp", task, request);

  String taskCode = JSP.w(task.getCode());
  taskCode=taskCode.equals("-")?"":taskCode;

  StatusIcon statusIcon = task.bricks.getStatusIcon(18, pageState);
  //todo attivare nella prossima release
  //ColorValueChooser statusIcon = task.bricks.getStatusChooser("stsc" + task.getId(), pageState);
  //statusIcon.displayValue=false;
  //statusIcon.onChangeScript = "changeStatus(hidden,data);";

  PercentileDisplay progressBar = task.bricks.getProgressBar(true);
  progressBar.width="90px";
  progressBar.height="15px";


  PageSeed issues = pageState.pageFromRoot("task/taskIssueList.jsp");
  issues.mainObjectId=task.getId();
  IssueBricks.addOpenStatusFilter(issues);
  ButtonLink is = new ButtonLink("", issues);
  //is.iconChar = "i";

  boolean isInLate= TaskStatus.STATUS_ACTIVE.equals(task.getStatus()) && task.getSchedule() != null && task.getSchedule().getEndDate().getTime() < System.currentTimeMillis();

%>
  <tr class="alternate taskRow <%=isInLate?"expired":""%>">
    <td align="center" width="1%"><%statusIcon.toHtml(pageContext);
    %></td>
    <td class="tlTaskName">
      <div class="pathSmall"><%=task.getPath(" / ", false)%></div>
      <a href="<%=bEdit.pageSeed.toLinkToHref()%>" class="button textual bolder taskName" ><%=JSP.encode(task.getName())%></a>
    </td>
    <td class="textSmall tlTaskCode" title="<%=taskCode%>" style="position: relative;">
      <div class="ellipsis"><%=taskCode%></div>
      <%
        String imageUrl = task.bricks.getImageUrl();
        if (JSP.ex(imageUrl)){
          %><div class="taskRowTaskImage" style="background-image: url(<%=imageUrl%>)"></div><%
        }
      %>
    </td>


    <td class="textSmall tlTaskType"><div class="ellipsis"><%=JSP.w(task.getType() != null ? task.getType().getDescription() : "")%></div></td>
    <td class="textSmall" nowrap><%=JSP.ex(task.getSchedule())?JSP.w(task.getSchedule().getStartDate()):""%><%=(task.isStartIsMilestone()?" <span class='teamworkIcon' title='"+I18n.get("MILESTONE")+"'>^</span> ":"")%></td>
    <td class="textSmall <%=isInLate?"warning warningIcon":""%>" nowrap><%=JSP.ex(task.getSchedule())?JSP.w(task.getSchedule().getValidityEndDate()):""%><%=(task.isEndIsMilestone()?" <span class='teamworkIcon' title='"+I18n.get("MILESTONE")+"'>^</span> ":"")%></td>
    <td align="right" nowrap><%is.label=task.getTotalIssuesOpen() + "/" + task.getTotalIssues(); is.toHtmlInTextOnlyModality(pageContext);%></td>
    <td align="right"><%=DateUtilities.getMillisInHoursMinutes(task.getWorklogDone())%><%

      Assignment guessedAssig = task.getFirstAssignmentsForResource(logged.getPerson());
      if (guessedAssig!=null){
        ButtonJS bjs=new ButtonJS("openWorklogEditorPopup($(this),{assId:'"+guessedAssig.getId()+"',title:'"+JSP.limWr(task.getDisplayName(),30)+"'});");
        bjs.iconChar="w";
        bjs.toHtmlInTextOnlyModality(pageContext);
      }
    %>

    </td>
    <td>
      <%
        if (guessedAssig!=null){
          ButtonJS bjsc=new ButtonJS("openExpenseEditorPopup($(this),{assId:'"+guessedAssig.getId()+"',title:'"+JSP.limWr(task.getDisplayName(),30)+"'});");
          bjsc.toolTip=I18n.get("ADD_EXPENSE");
          bjsc.iconChar="4";
          bjsc.additionalCssClass="lreq20 lreqHide";
          bjsc.toHtmlInTextOnlyModality(pageContext);
        }
      %>
    </td>

    <td nowrap><div class="facesBox" onclick="location.href='taskAssignmentList.jsp?TASK_ID=<%=task.getId()%>&CM=LIST_ASSIGS';">
    <%
      // Show workgroup
      int count=1;
      Set<Resource> visited = new HashSet();
      for (Resource res: task.getWorkGroup()) {
        if (visited.contains(res))
          continue;
        // add ....
        if (count>4 ){
          PageSeed ps = pageState.pageFromRoot("task/taskAssignmentList.jsp");
          ps.command = "LIST_ASSIGS";
          ps.addClientEntry("TASK_ID", task.getId());

          %><a class="faceMore" title="<%=I18n.get("MORE")%>"><span class="teamworkIcon" style="line-height:36px; font-size:20px;cursor:pointer">&hellip;</span></a><%
          break;
        }

        String imgTitle = res.getDisplayName();
        Assignment guessdAss = task.getFirstAssignmentsForResource(res,true);

        imgTitle=imgTitle+(guessdAss==null?"":" "+guessdAss.getRole().getCode());

        %><img src="<%=res.bricks.getAvatarImageUrl()%>" title="<%=imgTitle%>" class="face small" align="top" style="cursor:pointer;"><%
        count++;
        visited.add(res);
      }
    %>
    </div>
    </td>
    <td nowrap align="center"><% if (task.getForumEntry()!=null && task.getForumEntry().getChildrenSize()>0) {

      ForumEntry fe = task.getForumEntry();
      PageSeed discus = pageState.pageFromRoot("task/taskForumList.jsp");
      discus.addClientEntry("TASK_ID",task.getId());
      ButtonLink discusLink = new ButtonLink("", discus);
      discusLink.label=fe.getChildrenSize()+"";
      discusLink.toHtmlInTextOnlyModality(pageContext);

      }
    %></td>
    <td nowrap align="center"><% if (JSP.ex(task.getDocuments())) {
      PageSeed docs = pageState.pageFromRoot("task/taskDocumentList.jsp");
      docs.addClientEntry("TASK_ID", task.getId());
      docs.command="LIST_DOCS";
      ButtonLink docLink = new ButtonLink("", docs);
      docLink.label=task.getDocuments().size()+"";
      docLink.toHtmlInTextOnlyModality(pageContext);

      }
    %></td>
    <td nowrap><%progressBar.toHtml(pageContext);%></td>
  </tr>
