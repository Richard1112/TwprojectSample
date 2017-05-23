<%@ page import="com.twproject.agenda.Event, com.twproject.operator.TeamworkOperator, 
com.twproject.resource.Person, com.twproject.resource.Resource, 
com.twproject.security.TeamworkPermissions, com.twproject.task.*, 
com.twproject.task.businessLogic.MeetingRoomAction, net.sf.json.JSONArray, 
net.sf.json.JSONObject, org.jblooming.agenda.Period, org.jblooming.messaging.MessagingSystem, 
org.jblooming.messaging.SomethingHappened, org.jblooming.ontology.Pair, 
org.jblooming.ontology.PersistentFile, org.jblooming.ontology.businessLogic.DeleteHelper, 
org.jblooming.oql.OqlQuery, org.jblooming.persistence.PersistenceHome, org.jblooming.persistence.exceptions.PersistenceException, 
org.jblooming.persistence.hibernate.PersistenceContext, org.jblooming.tracer.Tracer, org.jblooming.utilities.DateUtilities, 
org.jblooming.utilities.JSP, org.jblooming.utilities.StringUtilities, org.jblooming.waf.JSONHelper, 
org.jblooming.waf.constants.Commands, org.jblooming.waf.constants.Fields, org.jblooming.waf.exceptions.ActionException, 
org.jblooming.waf.html.button.ButtonLink, org.jblooming.waf.html.input.Uploader, org.jblooming.waf.settings.ApplicationState, 
org.jblooming.waf.settings.I18n, org.jblooming.waf.view.*, java.util.*
, com.twproject.task.*,
com.twproject.task.businessLogic.MeetingRoomAction
" %>
<%
  JSONHelper jsonHelper = new JSONHelper();
  JSONObject json = jsonHelper.json;
  PageState pageState = PageState.getCurrentPageState(request);
  try {
    TeamworkOperator logged = (TeamworkOperator) pageState.getLoggedOperator();

    // ---------------------------------------------------------------------- SAVE ISSUE SINGOLA (chiamato solo da organizer eda ChangeStatus)
    Person loggedPerson = logged.getPerson();
    if (Commands.SAVE.equals(pageState.command)) {

      RestState restState=pageState; //qui si lavora con il pageStatevero
      MeetingRoomAction action = new MeetingRoomAction(restState);

      //ce coming from multi editor are incomplete
      // perform a make and override arrived CE
      ClientEntries newCes = new ClientEntries();
      newCes.addEntries(restState.getClientEntriesSet());

      // first I have to perform a fake-make or an add
      if ((restState.mainObjectId + "").startsWith("new")) {
        action.cmdAdd(false);
        restState.mainObjectId = PersistenceHome.NEW_EMPTY_ID;
      } else {
        action.cmdEdit();
      }

      MeetingRoomStatus oldStatus = ((MeetingRoom) restState.getMainObject()).getStatus();

      // override ce from edit with saved ones
      restState.addClientEntries(newCes);

      //in some cases i want to get/store values as default
      if (restState.getEntry("setValuesAsDefault").checkFieldValue()) {
        restState.getEntryOrDefault("STATUS",MeetingRoomStatus.getStatusOpen().getId()+"");
        restState.getEntryOrDefault("GRAVITY",MeetingRoom.GRAVITY_MEDIUM);
        restState.getEntryOrDefault("TASK");
      }


      // and now perform a real save
      if ( action.cmdSave()) {
    	  MeetingRoom meetingRoom = (MeetingRoom) restState.getMainObject();

    	  MeetingRoomStatus newStatus = ((MeetingRoom) restState.getMainObject()).getStatus();

        // check if worklog input can be displayed
        //if (oldStatus != null && oldStatus != newStatus && newStatus.isAskForWorklog()) {
        //  Assignment ass = meetingRoom.getAssignmentOnTask(loggedPerson);
        //  if (ass != null) {
        //    json.element("assId", ass.getId() + "");
        //  }
        //}
        //check if requires notes
        if (meetingRoom.getLastMeetingRoomHistory() != null && meetingRoom.getStatus().isAskForComment()) {
          //return back last history
          json.element("histId", meetingRoom.getLastMeetingRoomHistory().getId() + "");
        }

        //insert a json object used in organizer.jsp
        json.element("meetingRoom", meetingRoom.jsonify());


        //ci potrebbe essere anche un ordinamento;
        if (JSP.ex(restState.getEntry("SORT_FLAVOUR")) && JSP.ex(restState.getEntry("issues"))){
          //action.cmdSortIssues();
        }

      }

      //---------------------------------------------------------------------- SAVE MULTIPLE MeetingRoom
    } else if ("ADDTODO".equals(pageState.command)) {
      String desc = pageState.getEntry("descr").stringValueNullIfEmpty();
      String code = pageState.getEntry("descr").stringValueNullIfEmpty();
      if (JSP.ex(desc)) {
        MeetingRoom todo = new MeetingRoom();
        todo.setIdAsNew();
        todo.setArea(logged);
        todo.setOwner(logged);
        todo.setCode(code);
        todo.setDescription(desc);
        todo.setStatusOpen();
        todo.setGravity(MeetingRoom.GRAVITY_MEDIUM);
        todo.store();

        json.element("todo", todo.jsonify());
      }

    }
    
  } catch (Throwable t) {
    jsonHelper.error(t);
  }

  jsonHelper.close(pageContext);


%>