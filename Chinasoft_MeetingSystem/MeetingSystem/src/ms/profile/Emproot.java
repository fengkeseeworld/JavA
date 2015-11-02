package ms.profile;

import java.util.HashSet;
import java.util.Set;

/**
 * Emproot entity. @author MyEclipse Persistence Tools
 */

public class Emproot implements java.io.Serializable {

	// Fields

	private Integer emprootId;
	private String emprootName;
	private Set emps = new HashSet(0);

	// Constructors

	/** default constructor */
	public Emproot() {
	}

	/** minimal constructor */
	public Emproot(String emprootName) {
		this.emprootName = emprootName;
	}

	/** full constructor */
	public Emproot(String emprootName, Set emps) {
		this.emprootName = emprootName;
		this.emps = emps;
	}

	// Property accessors

	public Integer getEmprootId() {
		return this.emprootId;
	}

	public void setEmprootId(Integer emprootId) {
		this.emprootId = emprootId;
	}

	public String getEmprootName() {
		return this.emprootName;
	}

	public void setEmprootName(String emprootName) {
		this.emprootName = emprootName;
	}

	public Set getEmps() {
		return this.emps;
	}

	public void setEmps(Set emps) {
		this.emps = emps;
	}

}