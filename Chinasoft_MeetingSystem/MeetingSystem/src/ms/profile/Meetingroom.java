package ms.profile;

import java.util.HashSet;
import java.util.Set;

/**
 * Meetingroom entity. @author MyEclipse Persistence Tools
 */

public class Meetingroom implements java.io.Serializable {

	// Fields

	private Integer roomId;
	private Roomstatus roomstatus;
	private String roomName;
	private Integer roomSpace;
	private Set equipments = new HashSet(0);
	private Set meetings = new HashSet(0);

	// Constructors

	/** default constructor */
	public Meetingroom() {
	}

	/** minimal constructor */
	public Meetingroom(Roomstatus roomstatus, String roomName, Integer roomSpace) {
		this.roomstatus = roomstatus;
		this.roomName = roomName;
		this.roomSpace = roomSpace;
	}

	/** full constructor */
	public Meetingroom(Roomstatus roomstatus, String roomName,
			Integer roomSpace, Set equipments, Set meetings) {
		this.roomstatus = roomstatus;
		this.roomName = roomName;
		this.roomSpace = roomSpace;
		this.equipments = equipments;
		this.meetings = meetings;
	}

	// Property accessors

	public Integer getRoomId() {
		return this.roomId;
	}

	public void setRoomId(Integer roomId) {
		this.roomId = roomId;
	}

	public Roomstatus getRoomstatus() {
		return this.roomstatus;
	}

	public void setRoomstatus(Roomstatus roomstatus) {
		this.roomstatus = roomstatus;
	}

	public String getRoomName() {
		return this.roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public Integer getRoomSpace() {
		return this.roomSpace;
	}

	public void setRoomSpace(Integer roomSpace) {
		this.roomSpace = roomSpace;
	}

	public Set getEquipments() {
		return this.equipments;
	}

	public void setEquipments(Set equipments) {
		this.equipments = equipments;
	}

	public Set getMeetings() {
		return this.meetings;
	}

	public void setMeetings(Set meetings) {
		this.meetings = meetings;
	}

}