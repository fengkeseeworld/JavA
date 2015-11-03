package ms.meetingroom.action;

import java.util.List;

import javax.annotation.Resource;

import ms.meetingroom.dao.dao;
import ms.profile.Meetingroom;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.config.entities.ActionConfig;

@Controller
@Scope("prototype")
public class SelectAction {
	@Resource
	dao daoImp;
	private String type;
	private String requests;
	private int roomId;
	private int empId;

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
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
	public String selectAll(){
		List<Meetingroom> list = daoImp.selectMeetingroomByType(empId,type, requests);
		ActionContext ac=ActionContext.getContext();
		ac.put("list_all", list);
		return "all";
	}
	public String selectAllMeetingroom(){
		List<Meetingroom> list = daoImp.selectMeetingroomByType(empId,"select all", "aa");
		ActionContext ac=ActionContext.getContext();
		System.out.println(list);
		ac.put("list_all", list);
		return "result";
	}
	public String delete(){
		daoImp.deleteMeetingRoom(empId,roomId);
		return "delete";
	}

}
