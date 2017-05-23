/**
 * 
 */
package com.twproject.task;

import org.jblooming.security.Permission;

import com.twproject.security.TeamworkPermissions;

/**
 * @author x-wang
 *
 */
public class MyTeamworkPermissions extends TeamworkPermissions {
	public static final Permission meetingRoom_canRead = new Permission("TW_meetingRoom_r");
	public static final Permission meetingRoom_canWrite = new Permission("TW_meetingRoom_w");
	public static final Permission meetingRoom_canCreate = new Permission("TW_meetingRoom_c");
}
