package ms.meetingroom.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import ms.meetingroom.dao.dao;
import ms.util.InputCheck;

@Controller
@Scope("protorype")
public class equipmentaction {
	@Resource
	dao daoImp;
	private int meetingroomId;
	private int equipmentNumber;
	private String equipmentName;
	private String meetingroomIds;
	private int equipmentId;
	private int empId;

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}
	
	public int getEquipmentId() {
		return equipmentId;
	}
	public void setEquipmentId(int equipmentId) {
		this.equipmentId = equipmentId;
	}
	public String getMeetingroomIds() {
		return meetingroomIds;
	}
	public void setMeetingroomIds(String meetingroomIds) {
		this.meetingroomIds = meetingroomIds;
	}
	public int getMeetingroomId() {
		return meetingroomId;
	}
	public void setMeetingroomId(int meetingroomId) {
		this.meetingroomId = meetingroomId;
	}
	public int getEquipmentNumber() {
		return equipmentNumber;
	}
	public void setEquipmentNumber(int equipmentNumber) {
		this.equipmentNumber = equipmentNumber;
	}
	public String getEquipmentName() {
		return equipmentName;
	}
	public void setEquipmentName(String equipmentName) {
		this.equipmentName = equipmentName;
	}
	
	public String equipmentAdd(){
		ActionContext ac=ActionContext.getContext();
		InputCheck check=new InputCheck();
		List<Object> list=new ArrayList<Object>();
		list.add(meetingroomIds);
		list.add(equipmentName);
		list.add(equipmentNumber);
		if(!check.notNull(list)){
			ac.put("error", "输入信息不为空，请输入完整的信息！");
			return "equip_error";
		}
		daoImp.addEquipment(empId,meetingroomIds, equipmentName, equipmentNumber);
		return "equipadd";
	
	}
	public String equipmentUpdate(){
		ActionContext ac=ActionContext.getContext();
		InputCheck check=new InputCheck();
		List<Object> list=new ArrayList<Object>(); 
		list.add(equipmentId);
		list.add(meetingroomIds);
		list.add(equipmentName);
		list.add(equipmentNumber);
		if(!check.notNull(list)){
			ac.put("error", "输入信息不为空，请输入完整的信息！");
			return "equip_error";
		}
		daoImp.updateEquipment(empId, equipmentId,meetingroomIds, equipmentName, equipmentNumber);
		return "updateequipment";
	}
	public String equipmentdelete(){
		System.out.println("equipmentid:"+equipmentId);
		daoImp.deleteEquipment(empId,equipmentId);
		return "deleteEquipment";
	}

}
