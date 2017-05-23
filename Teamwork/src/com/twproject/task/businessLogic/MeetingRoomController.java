/**
 * 
 */
package com.twproject.task.businessLogic;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jblooming.ApplicationException;
import org.jblooming.PlatformRuntimeException;
import org.jblooming.persistence.exceptions.PersistenceException;
import org.jblooming.persistence.exceptions.RemoveException;
import org.jblooming.security.SecurityException;
import org.jblooming.utilities.ReflectionUtilities;
import org.jblooming.waf.ActionController;
import org.jblooming.waf.exceptions.ActionException;
import org.jblooming.waf.settings.ApplicationState;
import org.jblooming.waf.view.PageSeed;
import org.jblooming.waf.view.PageState;

/**
 * @author x-wang
 *
 */
public class MeetingRoomController implements ActionController {

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.jblooming.waf.ActionController#perform(javax.servlet.http.
	 * HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public PageState perform(HttpServletRequest request, HttpServletResponse response)
			throws PersistenceException, ActionException, SecurityException, ApplicationException, IOException {
		PageState pageState = PageState.getCurrentPageState(request);

		MeetingRoomAction meetingRoomAction = new MeetingRoomAction(pageState);

		String command = pageState.getCommand();
		if ("AD".equals(command)) {
			meetingRoomAction.cmdAdd(false);
		} else if (("ED".equals(command)) || ("DELETEPREVIEW".equals(command))) {
			meetingRoomAction.cmdEdit();
		} else if ("GUESS".equals(command)) {
			String oldId = pageState.mainObjectId + "";
			try {
				meetingRoomAction.cmdGuess();
			} catch (ActionException ae) {
				PageSeed newSeed = pageState.pageFromRoot("tools/invalidReference.jsp");
				newSeed.addClientEntry("CAUSE", ae.getMessage());
				newSeed.addClientEntry("TYPE", "MEETINGROOM");
				newSeed.addClientEntry("REF", oldId);
				newSeed.setPopup(true);
				pageState.redirect(newSeed);
			}
		} else if ("SV".equals(command)) {
			meetingRoomAction.cmdSave();
		} else if ("SAVE_DUR".equals(command)) {
			meetingRoomAction.cmdSaveDur();
		} else if ("SAVE_AND_ADD_NEW".equals(command)) {
			meetingRoomAction.cmdSaveAndAdd();
		} else if ("CLONE".equals(command)) {
			meetingRoomAction.cmdClone();
		} else if ("DL".equals(command)) {
			try {
				meetingRoomAction.cmdDelete();
			} catch (RemoveException ex) {
				pageState.setAttribute("DELEXCPT", ex);
			}
		} else if ("TRANSFORM".equals(command)) {
			meetingRoomAction.cmdUpgrade();
		} else if ("CLOSE".equals(command)) {
			meetingRoomAction.cmdClose();
		} else if ("BULK_MOVE_TO_TASK".equals(command)) {
			meetingRoomAction.cmdBulkMoveToTask();
		} else if ("BULK_MOVE_TO_RES".equals(command)) {
			meetingRoomAction.cmdBulkMoveToRes();
		} else if ("BULK_SET_STATUS".equals(command)) {
			meetingRoomAction.cmdBulkSetStatus();
		} else if ("BULK_SET_GRAVITY".equals(command)) {
			meetingRoomAction.cmdBulkSetGravity();
		} else if ("BULK_SET_IMPACT".equals(command)) {
			meetingRoomAction.cmdBulkSetImpact();
		} else if ("BULK_ADD_COMMENT".equals(command)) {
			meetingRoomAction.cmdBulkAddComment();
		} else if ("BULK_ADD_TAGS".equals(command)) {
			// meetingRoomAction.cmdBulkAddTags();
		} else if ("BULK_DEL_MEETINGROOMS".equals(command)) {
			meetingRoomAction.cmdBulkDelMeetingRooms(false);
		} else if ("BULK_CLOSE_MEETINGROOMS".equals(command)) {
			meetingRoomAction.cmdBulkCloseMeetingRooms();
		} else if ("BULK_MERGE_MEETINGROOMS".equals(command)) {
			meetingRoomAction.cmdBulkMergeMeetingRooms();
		} else if ("BULK_SET_NEW_DATE".equals(command)) {
			meetingRoomAction.cmdBulkSetNewDate();
		} else if ("BULK_PRINT".equals(command)) {
			meetingRoomAction.cmdBulkPrint();
		} else if ("EXPORT".equals(command)) {
			meetingRoomAction.cmdExport();
		} else if ("FN".equals(command)) {
			meetingRoomAction.cmdFind();
		} else {
			meetingRoomAction.cmdPrepareDefaultFind();
		}
		try {
			ReflectionUtilities.invoke(ApplicationState.applicationParameters.get("get"), "doFilter",
					new Object[] { request, response });
		} catch (Throwable e) {
			throw new PlatformRuntimeException(e);
		}
		return pageState;
	}

}
