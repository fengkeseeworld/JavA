package ms.meeting.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import ms.meeting.service.MeetingService;
import ms.profile.Meeting;

import org.apache.struts2.ServletActionContext;
import org.jboss.weld.context.ApplicationContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

@Controller
@Scope("propertype")
public class MeetingAction {
	
	private Meeting meeting;
	//确定查询会议是单个查询还是所有查询
	private String type;
	//查询会议的要求
	private String requests;
	//取消会议id
	private int meeting_id;
	//会议成员
	private String meetParticipants_id;
	//登录员工Id
	private int empId;
	
	
	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public String getMeetParticipants_id() {
		return meetParticipants_id;
	}

	public void setMeetParticipants_id(String meetParticipants_id) {
		this.meetParticipants_id = meetParticipants_id;
	}

	public int getMeeting_id() {
		return meeting_id;
	}

	public void setMeeting_id(int meeting_id) {
		this.meeting_id = meeting_id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getRequests() {
		return requests;
	}

	public void setRequests(String requests) {
		this.requests = requests;
	}

	@Resource
	MeetingService meetingService;
	


	public String list(){
		System.out.println(type);
		System.out.println(requests);
		if(requests.equals("")){
			requests="all";
		}
		if((!type.equals("selectall"))&&requests.equals("")){
			requests="all";
		}
		List<Meeting> list = meetingService.selectByTypeMeeting(empId,type, requests);
		HttpServletRequest request=ServletActionContext.getRequest();
		request.setAttribute("list_select", list);
		return "success";
	}
	
	public String cancel(){
		meetingService.cancelMeeting(empId,meeting_id);
		
		return "success";
	}
	
	public String listAllCancel(){
		List<Meeting> list = meetingService.selectByTypeMeeting(empId,"meeting_status", "1");
		ActionContext ac = ActionContext.getContext();
		ac.put("list_select_cancel", list);
		return "success";
	}
	
	public String listAllUpdate(){
		List<Meeting> list = meetingService.selectByTypeMeeting(empId,"meeting_status", "1");
		ActionContext ac = ActionContext.getContext();
		ac.put("list_select_update", list);
		return "success";
	}
	
}
