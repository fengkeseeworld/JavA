package ms.profile;

import java.util.HashSet;
import java.util.Set;

/**
 * Emp entity. @author MyEclipse Persistence Tools
 */

public class Emp implements java.io.Serializable {

	// Fields

	private Integer empId;
	private Emproot emproot;
	private Empstatus empstatus;
	private Department department;
	private String empName;
	private String empGender;
	private String empTel;
	private String empAddress;
	private String empCard;
	private Integer empSalary;
	private String empPassword;
	private String empEmail;
	private String empIp;
	private Set participantses = new HashSet(0);
	private Set meetings = new HashSet(0);

	// Constructors

	/** default constructor */
	public Emp() {
	}

	/** minimal constructor */
	public Emp(Emproot emproot, Empstatus empstatus, Department department,
			String empName, String empGender, String empTel, String empAddress,
			String empCard, Integer empSalary, String empPassword,
			String empEmail, String empIp) {
		this.emproot = emproot;
		this.empstatus = empstatus;
		this.department = department;
		this.empName = empName;
		this.empGender = empGender;
		this.empTel = empTel;
		this.empAddress = empAddress;
		this.empCard = empCard;
		this.empSalary = empSalary;
		this.empPassword = empPassword;
		this.empEmail = empEmail;
		this.empIp = empIp;
	}

	/** full constructor */
	public Emp(Emproot emproot, Empstatus empstatus, Department department,
			String empName, String empGender, String empTel, String empAddress,
			String empCard, Integer empSalary, String empPassword,
			String empEmail, String empIp, Set participantses, Set meetings) {
		this.emproot = emproot;
		this.empstatus = empstatus;
		this.department = department;
		this.empName = empName;
		this.empGender = empGender;
		this.empTel = empTel;
		this.empAddress = empAddress;
		this.empCard = empCard;
		this.empSalary = empSalary;
		this.empPassword = empPassword;
		this.empEmail = empEmail;
		this.empIp = empIp;
		this.participantses = participantses;
		this.meetings = meetings;
	}

	// Property accessors

	public Integer getEmpId() {
		return this.empId;
	}

	public void setEmpId(Integer empId) {
		this.empId = empId;
	}

	public Emproot getEmproot() {
		return this.emproot;
	}

	public void setEmproot(Emproot emproot) {
		this.emproot = emproot;
	}

	public Empstatus getEmpstatus() {
		return this.empstatus;
	}

	public void setEmpstatus(Empstatus empstatus) {
		this.empstatus = empstatus;
	}

	public Department getDepartment() {
		return this.department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public String getEmpName() {
		return this.empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getEmpGender() {
		return this.empGender;
	}

	public void setEmpGender(String empGender) {
		this.empGender = empGender;
	}

	public String getEmpTel() {
		return this.empTel;
	}

	public void setEmpTel(String empTel) {
		this.empTel = empTel;
	}

	public String getEmpAddress() {
		return this.empAddress;
	}

	public void setEmpAddress(String empAddress) {
		this.empAddress = empAddress;
	}

	public String getEmpCard() {
		return this.empCard;
	}

	public void setEmpCard(String empCard) {
		this.empCard = empCard;
	}

	public Integer getEmpSalary() {
		return this.empSalary;
	}

	public void setEmpSalary(Integer empSalary) {
		this.empSalary = empSalary;
	}

	public String getEmpPassword() {
		return this.empPassword;
	}

	public void setEmpPassword(String empPassword) {
		this.empPassword = empPassword;
	}

	public String getEmpEmail() {
		return this.empEmail;
	}

	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}

	public String getEmpIp() {
		return this.empIp;
	}

	public void setEmpIp(String empIp) {
		this.empIp = empIp;
	}

	public Set getParticipantses() {
		return this.participantses;
	}

	public void setParticipantses(Set participantses) {
		this.participantses = participantses;
	}

	public Set getMeetings() {
		return this.meetings;
	}

	public void setMeetings(Set meetings) {
		this.meetings = meetings;
	}

}