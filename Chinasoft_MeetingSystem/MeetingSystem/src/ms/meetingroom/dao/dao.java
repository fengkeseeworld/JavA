package ms.meetingroom.dao;

import java.util.List;

import ms.profile.Equipment;
import ms.profile.Meetingroom;
import ms.profile.Roomstatus;

public interface dao {
	public void addMeetingRoom(int empId, int roomstatusId, String roomName,
			int roomSpace);

	public void deleteMeetingRoom(int empId, int roomId);

	public void updateMeetingRoom(int empId, int roomId, int roomstatusId,
			String roomName, int roomSpace, String equipmentIds);

	public List<Meetingroom> selectMeetingroomByType(int empId, String type,
			String request);

	public void addEquipment(int empId, String meetingroomIds,
			String equipmentName, int equipmentNumber);

	public void deleteEquipment(int empId, int quipmentId);

	public void updateEquipment(int empId, int equipmentId,
			String meetingroomIds, String equipmentName, int equipmentNumber);

	public List<Equipment> selectEquipmentByType(int empId, String type,
			String request);
}
