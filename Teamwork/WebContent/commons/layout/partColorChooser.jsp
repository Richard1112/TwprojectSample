<%@ page import="org.jblooming.utilities.JSP,
                 org.jblooming.waf.html.core.JspIncluderSupport,
                 org.jblooming.waf.html.input.ColorChooser,
                 org.jblooming.waf.html.input.TextField"%><%

  ColorChooser cc = (ColorChooser)JspIncluderSupport.getCurrentInstance(request);

    %><label for="<%=cc.fieldName%>"><%=JSP.w(cc.label)%></label><%=JSP.w(cc.separator)%>
    <span class="colorChooserGroup"><%
      TextField hidden=new TextField(cc.showTextField?"text":"hidden",cc.fieldName,"",2);
      hidden.label="";
      hidden.fieldClass=hidden.fieldClass+" colorChooserField";
      hidden.readOnly=cc.disabled;
      hidden.toHtml(pageContext);
      %>
    </span>

<script type="text/javascript">
  var defs = [initialize(contextPath + "/commons/js/jquery/minicolors/jquery.miniColors.css", "css"),
    initialize(contextPath + "/commons/js/jquery/minicolors/jquery.miniColors.min.js", "script")];

  $.when.apply(null, defs).done(function () {
    $("#<%=cc.fieldName%>").minicolors({
      disabled:<%=cc.disabled?"true":"false"%>,
      change: function (hex, rgb) {
        var color = "#" + hex;
      }
    }).next().css({height: "<%=cc.colorSquareHeight%>px", width: "<%=cc.colorSquareWidth%>px"});


  });
</script>

