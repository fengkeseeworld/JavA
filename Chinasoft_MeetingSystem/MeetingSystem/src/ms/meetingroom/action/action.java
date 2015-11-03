package ms.meetingroom.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import ms.meetingroom.dao.dao;
import ms.util.InputCheck;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

@Controller
@Scope("prototype")
public class action {
	@Resource
	dao daoImp;
	private int roomId;
	private String roomstatusId;
	private String roomName;
	private String roomSpace;
	private String equipmentIds;
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

	public String getEquipmentIds() {
		return equipmentIds;
	}

	public void setEquipmentIds(String equipmentIds) {
		this.equipmentIds = equipmentIds;
	}

	public String getRoomstatusId() {
		return roomstatusId;
	}

	public void setRoomstatusId(String roomstatusId) {
		this.roomstatusId = roomstatusId;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getRoomSpace() {
		return roomSpace;
	}

	public void setRoomSpace(String roomSpace) {
		this.roomSpace = roomSpace;
	}

	public String addMeetingroom() {
		ActionContext ac = ActionContext.getContext();
		InputCheck check = new InputCheck();
		List<Object> list = new ArrayList<Object>();
		list.add(roomstatusId);
		list.add(roomName);
		list.add(roomSpace);
		if (!check.notNull(list)) {
			ac.put("error", "输入信息不能为空！！！");
			return "add_error";
		}
		daoImp.addMeetingRoom(empId, Integer.parseInt(roomstatusId), roomName,
				Integer.parseInt(roomSpace));
		return "add";

	}

	public String updateMeetingroom() {
		ActionContext ac = ActionContext.getContext();
		InputCheck check = new InputCheck();
		List<Object> list = new ArrayList<Object>();
		list.add(roomstatusId);
		list.add(roomName);
		list.add(roomstatusId);
		list.add(equipmentIds);
		list.add(roomSpace);
		if (!check.notNull(list)) {
			ac.put("error", "输入信息不能为空！！！");
			return "update_error";
		}
		daoImp.updateMeetingRoom(empId, roomId, Integer.parseInt(roomstatusId),
				roomName, Integer.parseInt(roomSpace), equipmentIds);
		return "update";
	}
}
