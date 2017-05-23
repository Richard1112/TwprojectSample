/**
 * 
 */
package com.twproject.wafm;

import org.jblooming.waf.settings.ApplicationState;

import com.twproject.waf.TeamworkLoader;
import com.twproject.wafm.settings.MyTeamworkSettings;

/**
 * @author x-wang
 *
 */
public class MyTeamworkLoader extends TeamworkLoader {
	@Override
	public void configApplications() {
		MyTeamworkSettings teamworkSettings = new MyTeamworkSettings();
		ApplicationState.platformConfiguration.addApplication(teamworkSettings);

		org.jblooming.waf.AccessControlFilter.LOGIN_PAGE_PATH_FROM_ROOT = "/applications/teamwork/security/login.jsp";
		org.jblooming.waf.FrontControllerFilter.ERROR_PAGE_PATH_FROM_ROOT = "/applications/teamwork/administration/error.jsp";
		ApplicationState.platformConfiguration.defaultIndex = "/applications/teamwork/index.jsp";
		ApplicationState.platformConfiguration.defaultApplication = teamworkSettings;
	}
}
