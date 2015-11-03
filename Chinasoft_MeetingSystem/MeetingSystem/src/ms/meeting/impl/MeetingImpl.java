package ms.meeting.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import ms.meeting.service.MeetingService;
import ms.profile.Emp;
import ms.profile.History;
import ms.profile.Meeting;
import ms.profile.Meetingroom;
import ms.profile.Meetingstatus;
import ms.profile.Participants;
/**
 * 
 * @author 锋客
 *
 */
@Service
@Transactional
public class MeetingImpl implements MeetingService {

	@Resource
	SessionFactory session;

	// 预定会议
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	@Override
	public void addMeeting(int meetingroom_id, int emp_id, String meetName,
			String meetParticipants_ids, Timestamp meetStarttime,
			Timestamp meetEndtime) {
		//会议发起人
		Emp emp = (Emp) session.getCurrentSession().get(Emp.class, emp_id);
		Meetingroom meetingroom = (Meetingroom) session.getCurrentSession()
				.get(Meetingroom.class, meetingroom_id);
		Meetingstatus meetingstatus = (Meetingstatus) session
				.getCurrentSession().get(Meetingstatus.class, 1);
		String[] temp = meetParticipants_ids.split(",");
		int meetParticipants = temp.length;
		Meeting meeting = new Meeting(meetingroom, meetingstatus, emp,
				meetName, meetParticipants, meetStarttime, meetEndtime);
		session.getCurrentSession().persist(meeting);
		//添加会议成员
		for(int i=0;i<temp.length;i++){
			Emp emp_1 = (Emp) session.getCurrentSession().get(Emp.class, Integer.parseInt(temp[i]));
			Participants participant = new Participants(meeting, emp_1);
			session.getCurrentSession().persist(participant);
		}
		//添加记录信息
		String historyEmpinformation=emp.getEmpId()+"添加了一条会议记录:  参加人员："+meetParticipants_ids+"  开始时间："+meetStarttime+"  结束时间："+meetEndtime;
		Timestamp historyDate=new Timestamp(System.currentTimeMillis());
		History history=new History(emp.getEmpId(), historyEmpinformation, historyDate);
		session.getCurrentSession().save(history);
	}
	//取消会议
	@Override
	public void cancelMeeting(int empId,int id) {
		Meeting meeting = (Meeting) session.getCurrentSession().get(
				Meeting.class, id);
		Meetingstatus meetingstatus = (Meetingstatus) session
				.getCurrentSession().get(Meetingstatus.class, 4);
		meeting.setMeetingstatus(meetingstatus);
		session.getCurrentSession().persist(meeting);
		//添加记录信息
		String historyEmpinformation=String.valueOf(empId)+"取消了一条会议记录:  参加人员："+meeting.getMeetParticipants()+"  开始时间："+meeting.getMeetStarttime()+"  结束时间："+meeting.getMeetEndtime();
		Timestamp historyDate=new Timestamp(System.currentTimeMillis());
		History history=new History(empId,historyEmpinformation, historyDate);
		session.getCurrentSession().save(history);
	}
	
	//查询会议
	@SuppressWarnings("unchecked")
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	@Override
	public List<Meeting> selectByTypeMeeting(int empId,String type, String requests) {
		List<Meeting> meetings = new ArrayList<Meeting>();
		List<Meeting> meetings_return = new ArrayList<Meeting>();
		// 查询全部信息
		/*
		 * 查询内容：编号，名称，时间等等
		 */
		//获得所有会议信息记录
		meetings = session.getCurrentSession().createQuery("from Meeting").list();
		//添加记录信息
		String historyEmpinformation=String.valueOf(empId)+"查询会议记录:  type="+type+"  requests="+requests;
		Timestamp historyDate=new Timestamp(System.currentTimeMillis());
		History history=new History(empId, historyEmpinformation, historyDate);
		session.getCurrentSession().save(history);
		//判断是否输出所有信息
		if(type.equals("selectall")){
			return meetings;
		}
		//根据id查询所有相关信息
		String[] temp = requests.split(",");
		if (type.equals("meeting_id")) {
				for (Meeting me : meetings) {
					for(int i=0;i<temp.length;i++){
						if (Integer.parseInt(temp[i])==me.getMeetId()) {
							meetings_return.add(me);
						}
					}
					
				}
				return meetings_return;
			}
		//根据name查询细信息
			if (type.equals("meeting_name")) {
				for (Meeting me : meetings) {
					if (requests.contains(me.getMeetName())) {
						meetings_return.add(me);
					}
				}
				return meetings_return;
			}
		//根据meeting_status查询
			if(type.equals("meeting_status")){
				for (Meeting me : meetings) {
					if (me.getMeetingstatus().getMeetingstatusId().equals(Integer.parseInt(requests))){
						meetings_return.add(me);
					}
				}
				return meetings_return;
			}
			
		

		return meetings_return;

	}
	
	//更新会议信息
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	@Override
	public void updateMeeting(int meeting_id, int meetingroom_id, int emp_id,
			String meetName, String meetParticipants_ids,
			Timestamp meetStarttime, Timestamp meetEndtime) {
		System.out.println("开始更新会议");
		//查询会议的预订者
		Emp emp = (Emp) session.getCurrentSession().get(Emp.class, emp_id);
		//查询房间号
		Meetingroom meetingroom = (Meetingroom) session.getCurrentSession()
				.get(Meetingroom.class, meetingroom_id);
		//更改会议状态
		Meetingstatus meetingstatus = (Meetingstatus) session
				.getCurrentSession().get(Meetingstatus.class, 1);
		//会议人数
		String[] temp = meetParticipants_ids.split(",");
		int meetParticipants = temp.length;
		//新建会议
		Meeting meeting = new Meeting(meeting_id,meetingroom, meetingstatus, emp,
				meetName, meetParticipants, meetStarttime, meetEndtime);
		//替代会议信息
		session.getCurrentSession().merge(meeting);
		//添加记录信息
		String historyEmpinformation=String.valueOf(emp_id)+"更新了会议记录:  会议ID"+meeting_id;
		Timestamp historyDate=new Timestamp(System.currentTimeMillis());
		History history=new History(emp_id, historyEmpinformation, historyDate);
		session.getCurrentSession().save(history);
		
	}

}
