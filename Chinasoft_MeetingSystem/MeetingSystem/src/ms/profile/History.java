package ms.profile;

import java.sql.Timestamp;

/**
 * History entity. @author MyEclipse Persistence Tools
 */

public class History implements java.io.Serializable {

	// Fields

	private Integer historyId;
	private Integer historyEmpid;
	private String historyEmpinformation;
	private Timestamp historyDate;

	// Constructors

	/** default constructor */
	public History() {
	}

	/** full constructor */
	public History(Integer historyEmpid, String historyEmpinformation,
			Timestamp historyDate) {
		this.historyEmpid = historyEmpid;
		this.historyEmpinformation = historyEmpinformation;
		this.historyDate = historyDate;
	}

	// Property accessors

	public Integer getHistoryId() {
		return this.historyId;
	}

	public void setHistoryId(Integer historyId) {
		this.historyId = historyId;
	}

	public Integer getHistoryEmpid() {
		return this.historyEmpid;
	}

	public void setHistoryEmpid(Integer historyEmpid) {
		this.historyEmpid = historyEmpid;
	}

	public String getHistoryEmpinformation() {
		return this.historyEmpinformation;
	}

	public void setHistoryEmpinformation(String historyEmpinformation) {
		this.historyEmpinformation = historyEmpinformation;
	}

	public Timestamp getHistoryDate() {
		return this.historyDate;
	}

	public void setHistoryDate(Timestamp historyDate) {
		this.historyDate = historyDate;
	}

}