package ms.meetingroom.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import ms.profile.Equipment;
import ms.profile.History;
import ms.profile.Meeting;
import ms.profile.Meetingroom;
import ms.profile.Participants;
import ms.profile.Roomstatus;

@Service
@Transactional
public class daoImp implements dao {
	@Resource
	SessionFactory sessionFactory;

	@Override
	public void addMeetingRoom(int empId,int roomstatusId, String roomName, int roomSpace) {
		// TODO Auto-generated method stub
		Roomstatus roomstatus = (Roomstatus) sessionFactory.getCurrentSession()
				.get(Roomstatus.class, roomstatusId);
		Meetingroom room = new Meetingroom(roomstatus, roomName, roomSpace);
		sessionFactory.getCurrentSession().persist(room);
		//添加记录信息
		String historyEmpinformation=String.valueOf(empId)+"添加了一条会议室记录:  会议室状态："+roomstatus.getRoomstatusName()+"  会议室名字："+roomName+"  容量："+roomSpace;
		Timestamp historyDate=new Timestamp(System.currentTimeMillis());
		History history=new History(empId, historyEmpinformation, historyDate);
		sessionFactory.getCurrentSession().save(history);		

	}

	@Override
	public void deleteMeetingRoom(int empId,int roomId) {
		// TODO Auto-generated method stub
		Meetingroom meetingroom = (Meetingroom) sessionFactory
				.getCurrentSession().get(Meetingroom.class, roomId);
		List<Equipment> list_equipment = sessionFactory.getCurrentSession()
				.createQuery("from Equipment").list();
		List<Equipment> list_delete_equipment = new ArrayList<Equipment>();
		List<Meeting> list_meeitng = sessionFactory.getCurrentSession()
				.createQuery("from Meeting").list();
		List<Meeting> list_delete_meeting = new ArrayList<Meeting>();
		List<Participants> list_Participants = sessionFactory
				.getCurrentSession().createQuery("from Participants").list();
		List<Participants> list_delete_Participants = new ArrayList<Participants>();
		for (Equipment eq : list_equipment) {
			if (eq.getMeetingroom().getRoomId() == roomId) {
				list_delete_equipment.add(eq);

			}
		}
		for (Meeting me : list_meeitng) {
			if (me.getMeetingroom().getRoomId() == roomId) {
				list_delete_meeting.add(me);
				for (Participants pas : list_Participants) {
					if (pas.getMeeting().getMeetId() == me.getMeetId()) {
						list_delete_Participants.add(pas);
					}
				}
			}
		}
		for (Participants pas : list_delete_Participants) {
			sessionFactory.getCurrentSession().delete(pas);
		}
		for (Meeting me : list_delete_meeting) {
			sessionFactory.getCurrentSession().delete(me);
		}
		for (Equipment eq : list_delete_equipment) {
			sessionFactory.getCurrentSession().delete(eq);
		}
		sessionFactory.getCurrentSession().delete(meetingroom);
		
		//添加记录信息
		String historyEmpinformation=String.valueOf(empId)+"删除了一条会议室记录:  会议室ID："+roomId;
		Timestamp historyDate=new Timestamp(System.currentTimeMillis());
		History history=new History(empId, historyEmpinformation, historyDate);
		sessionFactory.getCurrentSession().save(history);	
	}

	@Override
	public void updateMeetingRoom(int empId,int roomId, int roomstatusId,
			String roomName, int roomSpace, String equipmentIds) {

		Roomstatus status = (Roomstatus) sessionFactory.getCurrentSession()
				.get(Roomstatus.class, roomstatusId);
		Meetingroom temp = (Meetingroom) sessionFactory.getCurrentSession()
				.get(Meetingroom.class, roomId);
		temp.setRoomName(roomName);
		temp.setRoomSpace(roomSpace);
		sessionFactory.getCurrentSession().update(temp);
		if (!equipmentIds.equals("")) {
			String[] eqs = equipmentIds.split(",");
			for (int i = 0; i < eqs.length; i++) {
				Equipment eq = (Equipment) sessionFactory.getCurrentSession()
						.get(Equipment.class, Integer.parseInt(eqs[i]));
				eq.setMeetingroom(temp);
				sessionFactory.getCurrentSession().update(eq);
			}
		}
		//添加记录信息
		String historyEmpinformation=String.valueOf(empId)+"更新了一条会议室记录:  会议室ID："+roomId+"  会议室名字："+roomName+"  容量："+roomSpace;
		Timestamp historyDate=new Timestamp(System.currentTimeMillis());
		History history=new History(empId, historyEmpinformation, historyDate);
		sessionFactory.getCurrentSession().save(history);	

	}

	@SuppressWarnings("unchecked")
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	@Override
	public List<Meetingroom> selectMeetingroomByType(int empId,String type, String request) {
		List<Meetingroom> rooms = sessionFactory.getCurrentSession()
				.createQuery("from Meetingroom").list();
		List<Meetingroom> save_rooms = new ArrayList<Meetingroom>();
		
		//添加记录信息
		String historyEmpinformation=String.valueOf(empId)+"查询了会议室记录:  type="+type+"  request="+request;
		Timestamp historyDate=new Timestamp(System.currentTimeMillis());
		History history=new History(empId, historyEmpinformation, historyDate);
		sessionFactory.getCurrentSession().save(history);	
		
		if (type.equals("select all")) {
			return rooms;
		}

		if (type.equals("roomId")) {
			String[] re = request.split(",");
			for (Meetingroom room : rooms) {
				for (int i = 0; i < re.length; i++) {
					if (room.getRoomId() == Integer.parseInt(re[i])) {
						save_rooms.add(room);
					}
				}
			}
			return save_rooms;
		}

		if (type.equals("roomName")) {
			String[] re = request.split(",");
			for (Meetingroom room : rooms) {
				for (int i = 0; i < re.length; i++) {
					if (room.getRoomName() == re[i]) {
						save_rooms.add(room);
					}
				}
			}
			return save_rooms;
		}

		return rooms;

	}


	@Override
	public void deleteEquipment(int empId,int equipmentId) {
		Equipment equipment = (Equipment) sessionFactory.getCurrentSession()
				.get(Equipment.class, equipmentId);
		sessionFactory.getCurrentSession().delete(equipment);
		//添加记录信息
		String historyEmpinformation=String.valueOf(empId)+"删除了器械记录:  器械Id："+equipment.getEquipmentId()+"  器械名字:"+equipment.getEquipmentName();
		Timestamp historyDate=new Timestamp(System.currentTimeMillis());
		History history=new History(empId, historyEmpinformation, historyDate);
		sessionFactory.getCurrentSession().save(history);	
	}

	@Override
	public void updateEquipment(int empId,int equipmentId, String meetingroomIds,
			String equipmentName, int equipmentNumber) {
		// TODO Auto-generated method stub
		Equipment equipment = (Equipment) sessionFactory.getCurrentSession()
				.get(Equipment.class, equipmentId);
		equipment.setEquipmentName(equipmentName);
		equipment.setEquipmentNumber(equipmentNumber);
		sessionFactory.getCurrentSession().update(equipment);
		if (!meetingroomIds.equals("")) {
			String[] meetingroomId = meetingroomIds.split(",");
			int length = meetingroomId.length;
			for (int i = 0; i < length; i++) {
				Meetingroom room = (Meetingroom) sessionFactory
						.getCurrentSession().get(Meetingroom.class,
								meetingroomId[i]);
				equipment.setMeetingroom(room);
				sessionFactory.getCurrentSession().merge(equipment);
			}
		}
		//添加记录信息
		String historyEmpinformation=String.valueOf(empId)+"更新了器械记录:  id="+String.valueOf(equipmentId)+"  roomId="+meetingroomIds+"  numbers="+String.valueOf(equipmentNumber);
		Timestamp historyDate=new Timestamp(System.currentTimeMillis());
		History history=new History(empId, historyEmpinformation, historyDate);
		sessionFactory.getCurrentSession().save(history);	

	}

	@SuppressWarnings("unchecked")
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	@Override
	public List<Equipment> selectEquipmentByType(int empId,String type, String request) {
		List<Equipment> equipment = new ArrayList<Equipment>();
		List<Equipment> queryofEquipment = new ArrayList<Equipment>();
		
		equipment = sessionFactory.getCurrentSession()
				.createQuery("from Equipment").list();
		//添加记录信息
		String historyEmpinformation=String.valueOf(empId)+"查询器械记录:  type="+type+"  requests="+request;
		Timestamp historyDate=new Timestamp(System.currentTimeMillis());
		History history=new History(empId, historyEmpinformation, historyDate);
		sessionFactory.getCurrentSession().save(history);
				
		if (type.equals("select all")) {
			return equipment;
		}
		if (type.equals("equipmentId")) {

			String[] id = request.split(",");
			int length = id.length;
			if (!request.equals("")) {
				for (Equipment equip : equipment) {
					for (int i = 0; i < length; i++) {
						if (equip.getEquipmentId() == Integer.parseInt(id[i])) {
							queryofEquipment.add(equip);
						}
					}
				}
				return queryofEquipment;
			}
		}
		if (type.equals("equipmentName")) {

			String[] name = request.split(",");
			int length = name.length;
			if (!request.equals("")) {
				for (Equipment equip : equipment) {
					for (int i = 0; i < length; i++) {
						System.out.println("name[i]:"+name[i]);
						if (equip.getEquipmentName().equals(name[i])) {
							queryofEquipment.add(equip);
						}
					}
				}
				return queryofEquipment;
			}
		}
		if (type.equals("equipmentNumber")) {

			String[] num = request.split(",");
			int length = num.length;
			if (!request.equals("")) {
				for (Equipment equip : equipment) {
					for (int i = 0; i < length; i++) {
						if (equip.getEquipmentNumber() == Integer.parseInt(num[i])) {
							queryofEquipment.add(equip);
						}
					}
				}
				return queryofEquipment;
			}
		}
	

		return equipment;
	}
	

	@Override
	public void addEquipment(int empId,String meetingroomIds, String equipmentName,
			int equipmentNumber) {
		Equipment equipment = new Equipment(null, equipmentName, equipmentNumber);
		if (!meetingroomIds.equals("")) {
			String[] meetingroomId = meetingroomIds.split(",");
			int length = meetingroomId.length;
			for (int i = 0; i < length; i++) {
				Meetingroom room = (Meetingroom) sessionFactory
						.getCurrentSession().get(Meetingroom.class,
								Integer.parseInt(meetingroomId[i]));
				equipment.setMeetingroom(room);
				sessionFactory.getCurrentSession().persist(equipment);
			}
		}
		//添加记录信息
		String historyEmpinformation=String.valueOf(empId)+"添加器械记录:  房间号="+meetingroomIds+"  设备名="+equipmentName+"  设备数量="+String.valueOf(equipmentNumber);
		Timestamp historyDate=new Timestamp(System.currentTimeMillis());
		History history=new History(empId, historyEmpinformation, historyDate);
		sessionFactory.getCurrentSession().save(history);
		
	}
	
	
	

}
