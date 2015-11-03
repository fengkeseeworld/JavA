package ms.person.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;








import ms.person.service.ManageService;
import ms.profile.Emp;
import ms.profile.History;
import ms.profile.Meeting;
import ms.profile.Participants;
@Service
@Transactional
public class ManageImpl implements ManageService{

	@Resource SessionFactory factory;
	@Transactional (propagation=Propagation.NOT_SUPPORTED)
	public Emp find(int empId) {
	
		return (Emp)factory.getCurrentSession().get(Emp.class, empId);
	}

	@Override
	public void update(int empId,Emp emp) {
			String historyEmpinformation=String.valueOf(empId)+"修改了一条员工记录： empId="+String.valueOf(emp.getEmpId());
			Timestamp historyDate=new Timestamp(System.currentTimeMillis());
		 	History history=new History(empId, historyEmpinformation, historyDate);
		 	factory.getCurrentSession().save(history);
		factory.getCurrentSession().update(emp);
		
	}
	@Transactional (propagation=Propagation.NOT_SUPPORTED)
	public void delete(int empId,int reempId) {
		Emp emp = (Emp)factory.getCurrentSession().load(Emp.class,reempId);
		List<Participants> list=factory.getCurrentSession().createQuery("from Participants").list();
		List<Meeting>	list_meeting=factory.getCurrentSession().createQuery("from Meeting").list();
		List<Participants> list_temp=new ArrayList<Participants>();
		List<Meeting> list_temp_m=new ArrayList<Meeting>();
		for(Participants pas:list){
			if(pas.getEmp().getEmpId()==reempId){
				list_temp.add(pas);
				for(Meeting me:list_meeting){
					if(me.getMeetId()==pas.getMeeting().getMeetId()){
						list_temp_m.add(me);
					}
				}
			}
		}
		System.out.println(list_temp);
		System.out.println(list_temp_m);
		for(Participants pas:list_temp){
			factory.getCurrentSession().delete(pas);
		}
		for(Meeting me:list_temp_m){
			factory.getCurrentSession().delete(me);
		}
		
		factory.getCurrentSession().delete(emp);
		String historyEmpinformation=empId+"删除了一条员工记录： empId="+String.valueOf(emp.getEmpId());
		 Timestamp historyDate=new Timestamp(System.currentTimeMillis());
		 History history=new History(empId, historyEmpinformation, historyDate);
		 factory.getCurrentSession().save(history);
	}
}
