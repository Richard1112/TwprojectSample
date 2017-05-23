/**
 * 
 */
package com.twproject.task;

import java.util.List;

import org.jblooming.oql.OqlQuery;
import org.jblooming.scheduler.JobLogData;

/**
 * 定时任务测试
 * 
 * @author x-wang
 *
 */
public class MeetingRoomStatusUpdateJob extends org.jblooming.scheduler.ExecutableSupport {

	/*
	 * 7 (non-Javadoc)
	 * 
	 * @see org.jblooming.scheduler.Executable#run(org.jblooming.scheduler.
	 * JobLogData)
	 */
	@Override
	public JobLogData run(JobLogData paramJobLogData) throws Exception {
		try {
			String hql = "select mt from " + MeetingRoom.class.getName() + " as mt where mt.status='1'";
			List<MeetingRoom> mts = new OqlQuery(hql).list();
			if (mts != null) {
				for (MeetingRoom m : mts) {
					m.setMtStatus(MeetingRoomStatus.getStatusClose());
					m.store();
				}
			}
		} catch (Exception e) {

		}
		return null;
	}

}
