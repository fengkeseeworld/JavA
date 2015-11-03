package ms.meetingroom.action;

import java.util.List;

import javax.annotation.Resource;

import ms.meetingroom.dao.dao;
import ms.profile.Equipment;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

@Controller
@Scope("prototype")
public class equipmentselectaction {

	@Resource dao daoImp;
	private String type;
	private String request;
	private int empId;

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	public String selectEquipment(){
		List<Equipment> list=daoImp.selectEquipmentByType(empId,type, request);
		System.out.println("list:"+list);
		ActionContext ac=ActionContext.getContext();
		ac.put("list_all", list);
		return "selectEquip";
	}
	public String delselectEquipment(){
		List<Equipment> list=daoImp.selectEquipmentByType(empId,"select all", "");
		System.out.println("list:"+list);
		ActionContext ac=ActionContext.getContext();
		ac.put("list_all", list);
		return "delselectEquip";
	}
	
}
