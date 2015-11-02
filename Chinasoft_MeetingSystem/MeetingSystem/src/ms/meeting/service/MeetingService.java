package ms.meeting.service;

import java.sql.Timestamp;
import java.util.List;

import ms.profile.Meeting;

public interface MeetingService {
	
	//预订会议
	public void addMeeting(int meetingroom_id,int emp_id,String meetName,String meetParticipants_ids,Timestamp meetStarttime,Timestamp meetEndtime);
	//取消预订
	public void cancelMeeting(int empId,int id);
	//查询会议
	public List<Meeting> selectByTypeMeeting(int empId,String type,String requests);
	//更新会议信息
	public void updateMeeting(int meeting_id,int meetingroom_id,int emp_id,String meetName,String meetParticipants_ids,Timestamp meetStarttime,Timestamp meetEndtime);
	
}
