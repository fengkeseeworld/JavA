package ms.meeting.action;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import ms.meeting.service.MeetingService;
import ms.profile.Meeting;
import ms.util.InputCheck;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.opensymphony.xwork2.ActionContext;

@Controller
@Scope("propertype")
public class MeetingAddAction {
	@Resource
	MeetingService meetingService;
	private int meetingroom_id;
	private int emp_id;
	private String meetName;
	private String meetParticipants_ids;
	private Timestamp meetStarttime;
	private Timestamp meetEndtime;
	private int meeting_id;

	public int getMeeting_id() {
		return meeting_id;
	}

	public void setMeeting_id(int meeting_id) {
		this.meeting_id = meeting_id;
	}

	public int getMeetingroom_id() {
		return meetingroom_id;
	}

	public void setMeetingroom_id(String meetingroom_id) {
		if (meetingroom_id.equals("")) {
			meetingroom_id = "201";
		}
		this.meetingroom_id = Integer.parseInt(meetingroom_id);
	}

	public int getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}

	public String getMeetName() {
		return meetName;
	}

	public void setMeetName(String meetName) {
		this.meetName = meetName;
	}

	public String getMeetParticipants_ids() {
		return meetParticipants_ids;
	}

	public void setMeetParticipants_ids(String meetParticipants_ids) {
		this.meetParticipants_ids = meetParticipants_ids;
	}

	public Timestamp getMeetStarttime() {
		return meetStarttime;
	}

	public void setMeetStarttime(String meetStarttime) {
		Timestamp timestamp = new Timestamp((Integer.parseInt(meetStarttime
				.substring(0, 4)) - 1900), Integer.parseInt(meetStarttime
				.substring(5, 7)) - 1, Integer.parseInt(meetStarttime
				.substring(8, 10)), Integer.parseInt(meetStarttime.substring(
				11, 13)), Integer.parseInt(meetStarttime.substring(14, 16)), 0,
				0);
		System.out.println(timestamp);
		this.meetStarttime = timestamp;
	}

	public Timestamp getMeetEndtime() {
		return meetEndtime;
	}

	public void setMeetEndtime(String meetEndtime) {
		Timestamp timestamp = new Timestamp((Integer.parseInt(meetEndtime
				.substring(0, 4)) - 1900), Integer.parseInt(meetEndtime
				.substring(5, 7)) - 1, Integer.parseInt(meetEndtime.substring(
				8, 10)), Integer.parseInt(meetEndtime.substring(11, 13)),
				Integer.parseInt(meetEndtime.substring(14, 16)), 0, 0);
		this.meetEndtime = timestamp;
	}

	public String add() {
		ActionContext ac = ActionContext.getContext();
		InputCheck check = new InputCheck();
		//输入条件判定
		List<Object> list=new ArrayList<Object>();
		list.add(meetingroom_id);
		list.add(emp_id);
		list.add(meetParticipants_ids);
		list.add(meetStarttime);
		list.add(meetEndtime);
		if(!check.notNull(list)){
			ac.put("error", "输入不能为空！！！");
			return "error";
		}
		long now_date_float = new Date().getTime();
		long meetStarttime_long = meetStarttime.getTime();
		long meetEndtime_long = meetEndtime.getTime();
		if ((meetStarttime_long > meetEndtime_long)
				|| (meetStarttime_long < now_date_float)) {
			ac.put("error", "时间有问题，请仔细检查！！！");
			return "error";
		}
		//会议室判定
		List<Meeting> list_meetings = meetingService.selectByTypeMeeting(emp_id, "selectall", "all");
		for(Meeting me:list_meetings){
			boolean flag=me.getMeetingroom().getRoomId()==meetingroom_id;
			if(flag){
				if(me.getMeetEndtime().getTime()>meetStarttime.getTime()){
					ac.put("error", "会议室在改时间段已被占用，请选择其他会议室");
					return "error";
				}
			}
		}
		meetingService.addMeeting(meetingroom_id, emp_id, meetName,meetParticipants_ids, meetStarttime, meetEndtime);
		return "success";
	}

	public String update() {
		InputCheck check = new InputCheck();
		List<Meeting> list_meeting_update = meetingService.selectByTypeMeeting(emp_id,"meeting_status", "1");
		System.out.println(list_meeting_update);
		ActionContext ac = ActionContext.getContext();
		ac.put("list_select_update", list_meeting_update);
		//输入条件判定
		List<Object> list=new ArrayList<Object>();
		list.add(meetingroom_id);
		list.add(emp_id);
		list.add(meetParticipants_ids);
		list.add(meetStarttime);
		list.add(meetEndtime);
		if(!check.notNull(list)){
			ac.put("error", "输入不能为空！！！");
			return "error";
		}
		boolean temp=false;
		for(Meeting me:list_meeting_update){
			if(me.getMeetId().equals(meeting_id)){
				temp=true;
			}
		}
		if(!temp){
			ac.put("error", "请修改可修改的会议");
			return "error";
		}
		long now_date_float = new Date().getTime();
		long meetStarttime_long = meetStarttime.getTime();
		long meetEndtime_long = meetEndtime.getTime();
		if ((meetStarttime_long > meetEndtime_long)
				|| (meetStarttime_long < now_date_float)) {
			ac.put("error", "时间有问题，请仔细检查！！！");
			return "error";
		}
		//会议室判定
		List<Meeting> list_meetings = meetingService.selectByTypeMeeting(emp_id, "selectall", "all");
		for(Meeting me:list_meetings){
			boolean flag=me.getMeetingroom().getRoomId()==meetingroom_id;
			if(flag){
				if(me.getMeetEndtime().getTime()>meetStarttime.getTime()){
					ac.put("error", "会议室在改时间段已被占用，请选择其他会议室");
					return "error";
				}
			}
		}
		meetingService.updateMeeting(meeting_id, meetingroom_id, emp_id,meetName, meetParticipants_ids, meetStarttime, meetEndtime);
		return "success";

	}

}
