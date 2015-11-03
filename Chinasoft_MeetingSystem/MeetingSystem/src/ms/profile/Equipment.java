package ms.profile;

/**
 * Equipment entity. @author MyEclipse Persistence Tools
 */

public class Equipment implements java.io.Serializable {

	// Fields

	private Integer equipmentId;
	private Meetingroom meetingroom;
	private String equipmentName;
	private Integer equipmentNumber;

	// Constructors

	/** default constructor */
	public Equipment() {
	}

	/** full constructor */
	public Equipment(Meetingroom meetingroom, String equipmentName,
			Integer equipmentNumber) {
		this.meetingroom = meetingroom;
		this.equipmentName = equipmentName;
		this.equipmentNumber = equipmentNumber;
	}

	// Property accessors

	public Integer getEquipmentId() {
		return this.equipmentId;
	}

	public void setEquipmentId(Integer equipmentId) {
		this.equipmentId = equipmentId;
	}

	public Meetingroom getMeetingroom() {
		return this.meetingroom;
	}

	public void setMeetingroom(Meetingroom meetingroom) {
		this.meetingroom = meetingroom;
	}

	public String getEquipmentName() {
		return this.equipmentName;
	}

	public void setEquipmentName(String equipmentName) {
		this.equipmentName = equipmentName;
	}

	public Integer getEquipmentNumber() {
		return this.equipmentNumber;
	}

	public void setEquipmentNumber(Integer equipmentNumber) {
		this.equipmentNumber = equipmentNumber;
	}

}