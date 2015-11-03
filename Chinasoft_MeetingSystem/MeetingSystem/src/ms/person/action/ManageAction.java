package ms.person.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import ms.person.service.ManageService;
import ms.profile.Emp;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

@Controller
@Scope("prototype")
public class ManageAction {
	@Resource
	ManageService manageservice;
	private Emp emp;
	private int empId;
	private int reempId;
	
	public int getReempId() {
		return reempId;
	}

	public void setReempId(int reempId) {
		this.reempId = reempId;
	}

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

	public String managefind() {
		HttpServletRequest request = ServletActionContext.getRequest();
		reempId = Integer.parseInt(request.getParameter("reempId"));
		Emp emp = manageservice.find(reempId);
		ActionContext.getContext().put("emp", emp);
		ActionContext.getContext().put("empId", empId);
		return "managefindsuccess";

	}

	public String manageupdate() {
		System.out.println(empId+"aaaa"+emp);
		manageservice.update(empId,emp);
		return "manageupdatesuccess";
	}

	public String managedelete() {
		HttpServletRequest request = ServletActionContext.getRequest();
		reempId = Integer.parseInt(request.getParameter("reempId"));
		manageservice.delete(empId,reempId);
		return "managedeletesuccess";
	}
}
