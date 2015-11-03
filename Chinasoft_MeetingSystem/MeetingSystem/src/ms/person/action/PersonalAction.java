package ms.person.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import ms.meetingroom.action.action;
import ms.person.service.PersonalService;
import ms.profile.Emp;
import ms.util.InputCheck;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

@Controller
@Scope("prototype")
public class PersonalAction {
	@Resource
	PersonalService personalservice;
	private Emp emp;
	private String empEmail;
	private String empPassword;
	private int empId;

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public Emp getEmp() {
		return emp;
	}

	public void setEmp(Emp emp) {
		this.emp = emp;
	}

	public String getEmpEmail() {
		return empEmail;
	}

	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}

	public String getEmpPassword() {
		return empPassword;
	}

	public void setEmpPassword(String empPassword) {
		this.empPassword = empPassword;
	}

	public String login() {
		emp = personalservice.login(empEmail, empPassword);
		ActionContext.getContext().put("emp", emp);
		return "loginsuccess";
	}

	public String register() {
		ActionContext ac=ActionContext.getContext();
		InputCheck check=new InputCheck();
		List<Object> list=new ArrayList<Object>();
		list.add(emp.getEmpName());
		list.add(emp.getEmpTel());
		list.add(emp.getEmpAddress());
		list.add(emp.getEmpCard());
		list.add(emp.getEmpPassword());
		list.add(emp.getEmpIp());
		if(!check.notNull(list)){
			ac.put("error", "注册信息不能为空");
			return "registererror";
		}
		personalservice.register(emp);
		return "registersuccess";
	}

	public String listAll() {
		ActionContext.getContext().put("list", personalservice.list(empId));
		return "list";
	}

	public String update() {
		emp = personalservice.update(empId, emp);
		ActionContext.getContext().put("emp", emp);
		return "updatesuccess";
	}

	public String find() {
		int empId = 0;
		HttpServletRequest request = ServletActionContext.getRequest();
		empId = Integer.parseInt(request.getParameter("empId"));
		emp = personalservice.find(empId);
		ActionContext.getContext().put("emp", emp);
		ActionContext.getContext().put("empId", empId);
		return "findsuccess";
	}

	public String updatefirst() {
		int empId = 0;
		HttpServletRequest request = ServletActionContext.getRequest();
		empId = Integer.parseInt(request.getParameter("empId"));
		emp = personalservice.find(empId);
		ActionContext.getContext().put("emp", emp);
		return "updatefirst";
	}
}
