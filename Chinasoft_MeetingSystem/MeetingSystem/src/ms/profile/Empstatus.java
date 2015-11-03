package ms.profile;

import java.util.HashSet;
import java.util.Set;

/**
 * Empstatus entity. @author MyEclipse Persistence Tools
 */

public class Empstatus implements java.io.Serializable {

	// Fields

	private Integer empstatusId;
	private String empstatusName;
	private Set emps = new HashSet(0);

	// Constructors

	/** default constructor */
	public Empstatus() {
	}

	/** minimal constructor */
	public Empstatus(String empstatusName) {
		this.empstatusName = empstatusName;
	}

	/** full constructor */
	public Empstatus(String empstatusName, Set emps) {
		this.empstatusName = empstatusName;
		this.emps = emps;
	}

	// Property accessors

	public Integer getEmpstatusId() {
		return this.empstatusId;
	}

	public void setEmpstatusId(Integer empstatusId) {
		this.empstatusId = empstatusId;
	}

	public String getEmpstatusName() {
		return this.empstatusName;
	}

	public void setEmpstatusName(String empstatusName) {
		this.empstatusName = empstatusName;
	}

	public Set getEmps() {
		return this.emps;
	}

	public void setEmps(Set emps) {
		this.emps = emps;
	}

}