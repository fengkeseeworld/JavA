package ms.profile;

import java.util.HashSet;
import java.util.Set;

/**
 * Roomstatus entity. @author MyEclipse Persistence Tools
 */

public class Roomstatus implements java.io.Serializable {

	// Fields

	private Integer roomstatusId;
	private String roomstatusName;
	private Set meetingrooms = new HashSet(0);

	// Constructors

	/** default constructor */
	public Roomstatus() {
	}

	/** minimal constructor */
	public Roomstatus(String roomstatusName) {
		this.roomstatusName = roomstatusName;
	}

	/** full constructor */
	public Roomstatus(String roomstatusName, Set meetingrooms) {
		this.roomstatusName = roomstatusName;
		this.meetingrooms = meetingrooms;
	}

	// Property accessors

	public Integer getRoomstatusId() {
		return this.roomstatusId;
	}

	public void setRoomstatusId(Integer roomstatusId) {
		this.roomstatusId = roomstatusId;
	}

	public String getRoomstatusName() {
		return this.roomstatusName;
	}

	public void setRoomstatusName(String roomstatusName) {
		this.roomstatusName = roomstatusName;
	}

	public Set getMeetingrooms() {
		return this.meetingrooms;
	}

	public void setMeetingrooms(Set meetingrooms) {
		this.meetingrooms = meetingrooms;
	}

}