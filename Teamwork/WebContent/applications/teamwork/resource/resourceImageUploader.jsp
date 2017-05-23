<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ page import="com.twproject.operator.TeamworkOperator,
                 com.twproject.resource.Resource,
                 com.twproject.waf.TeamworkPopUpScreen,
                 org.jblooming.utilities.JSP,
                 org.jblooming.waf.ScreenArea,
                 org.jblooming.waf.html.core.JspHelper,
                 org.jblooming.waf.view.PageState" %>
<%
  PageState pageState = PageState.getCurrentPageState();
  TeamworkOperator logged = (TeamworkOperator) pageState.getLoggedOperator();

  if (!pageState.screenRunning) {
    pageState.screenRunning = true;
    final ScreenArea body = new ScreenArea(request);
    TeamworkPopUpScreen lw = new TeamworkPopUpScreen(body);
    lw.register(pageState);
    pageState.perform(request, response);
    pageState.toHtml(pageContext);
  } else {

    int resId=pageState.getEntry("RES_ID").intValueNoErrorCodeNoExc();
    Resource resource=Resource.load(resId+"");

    String imgUrl = resource.bricks.getAvatarImageUrl();


%>
<div id="holder" class="uploadizeDrop justOpened" style="width: 400px; height: 400px; overflow: hidden;">
  <%if (JSP.ex(imgUrl)){%><img src="<%=imgUrl%>"><%}%>
</div>
<%
    JspHelper imageUploader = new JspHelper("/commons/layout/partImageUploader.jsp");
    imageUploader.parameters.put("imgUrl", imgUrl);
    imageUploader.parameters.put("fixAspectRatio", true);
    imageUploader.toHtml(pageContext);
%>

<script>

function saveImage() {
  var imgData = $("#imageContent").val();
  if (imgData && imgData.length > 1000) {
    showSavingMessage();
    var request = {CM: "SVIMG", "RES_ID": "<%=resId%>", imgData: imgData};
    $.ajax("resourceAjaxController.jsp", {
      dataType: "json",
      data:     request,
      type:     "POST",

      success: function (response) {
        hideSavingMessage();
        jsonResponseHandling(response);
        if (response.ok) {
          closeBlackPopup(response);
        }
      }
    });
  } else {
    closeBlackPopup();
  }
}

function deleteImage() {
  showSavingMessage();
  var request = {CM: "RMIMG", "RES_ID": "<%=resId%>"};
  $.getJSON("resourceAjaxController.jsp", request, function (response) {
    hideSavingMessage();
    jsonResponseHandling(response);
    if (response.ok) {
      closeBlackPopup(response);
    }
  });
}

</script>


<%
  }
%>


