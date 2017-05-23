<%@ page contentType="application/json; charset=utf-8" pageEncoding="UTF-8" %>
<%@ page import="com.twproject.operator.TeamworkOperator,
                 com.twproject.resource.Person,
                 com.twproject.resource.Resource,
                 com.twproject.resource.ResourceBricks,
                 net.sf.json.JSONArray,
                 net.sf.json.JSONObject,
                 org.jblooming.ontology.Hidrator,
                 org.jblooming.oql.QueryHelper,
                 org.jblooming.security.Permission,
                 org.jblooming.waf.JSONHelper,
                 org.jblooming.waf.view.ClientEntry,
                 org.jblooming.waf.view.PageState,
                 java.util.List, java.util.ArrayList, org.jblooming.utilities.JSP" %>
<%

  JSONHelper jsonHelper = new JSONHelper();


  PageState pageState = jsonHelper.pageState;
  JSONObject json = jsonHelper.json;
  try {
    TeamworkOperator logged = (TeamworkOperator) pageState.getLoggedOperator();

    //---------------------------- WORKGROUP COMPOSER SEARCH PEOPLE ----------------------------------------------------
    if ("WGSRCPEOPLE".equals(pageState.command)) {

      String hql = "select distinct resource from " + Person.class.getName() + " as resource";
      QueryHelper qhelp = new QueryHelper(hql);
      String filter = pageState.getEntry("PEOPLE").stringValueNullIfEmpty();
      if (filter != null) {

        qhelp.addQBEORClauses(
                filter,
                qhelp.getOrElement("resource.personName", "personName", QueryHelper.TYPE_CHAR),
                qhelp.getOrElement("resource.personSurname || resource.personName", "surnameName", QueryHelper.TYPE_CHAR),
                qhelp.getOrElement("resource.personName || resource.personSurname", "nameSurname", QueryHelper.TYPE_CHAR),
                qhelp.getOrElement("resource.personSurname", "personSurname", QueryHelper.TYPE_CHAR)
        );


      }

      if (pageState.getEntry("HAVE_LOGIN").checkFieldValue())
        qhelp.addOQLClause("resource.myself is not null and resource.myself.enabled = true");

      qhelp.addOQLClause("resource.hidden = false");

      String permTxt = pageState.getEntry("PERM_REQUIRED").stringValueNullIfEmpty();

      List<Permission> permissions= new ArrayList();
      if (JSP.ex(permTxt)){
        for (String p : permTxt.split(","))
          permissions.add(new Permission(p.trim()));
      }
      /*
      permRequired.listValue(new Hidrator<Permission>() {
        public Permission hidrate(String succ) {
          return new Permission(succ);
        }
      });
      */

      //inject security clauses
      ResourceBricks.addSecurityClauses("resource", true, qhelp, permissions, logged, true, true);

      JSONArray jsa = new JSONArray();

      List<Resource> cand = qhelp.toHql().list();
      for (Resource res : cand) {
        jsa.add(res.jsonify(false));
      }
      json.element("resources", jsa);

    }



  } catch (Throwable t) {
    jsonHelper.error(t);
  }

  jsonHelper.close(pageContext);

%>