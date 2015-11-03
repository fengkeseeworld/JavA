package ms.person.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;





import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import ms.person.service.PersonalService;
import ms.profile.Emp;
import ms.profile.History;
@Service
@Transactional
public class PersonalImpl implements PersonalService{
	@Resource SessionFactory factory;
	@Transactional (propagation=Propagation.NOT_SUPPORTED)
	//登录
	 public Emp login(String empEmail,String empPassword){
		String hql="from Emp where empEmail='"+empEmail+"' and empPassword='"+empPassword+"'";
		Emp emp=(Emp) factory.getCurrentSession().createQuery(hql).list().get(0);
		//添加记录信息
		String historyEmpinformation="登录失败";
		if(emp!=null){
		   historyEmpinformation=emp.getEmpId()+"登录成功";
		}
		Timestamp historyDate=new Timestamp(System.currentTimeMillis());
		History history=new History(emp.getEmpId(), historyEmpinformation, historyDate);
		factory.getCurrentSession().save(history);
		return (Emp) factory.getCurrentSession().createQuery(hql).list().get(0);	
	 }	
	//注册
	 public void register(Emp emp){
		 factory.getCurrentSession().persist(emp);
		 String historyEmpinformation=emp.getEmpId()+"注册";
		 Timestamp historyDate=new Timestamp(System.currentTimeMillis());
		 History history=new History(emp.getEmpId(), historyEmpinformation, historyDate);
		 factory.getCurrentSession().save(history);
	 }
	 //列表查询
	 @SuppressWarnings("unchecked")
	@Transactional (propagation=Propagation.NOT_SUPPORTED)
	 public List<Emp> list(int empId) {
			 String historyEmpinformation="查询所有员工信息";
			 Timestamp historyDate=new Timestamp(System.currentTimeMillis());
			 History history=new History(empId, historyEmpinformation, historyDate);
			 factory.getCurrentSession().save(history);
			return factory.getCurrentSession().createQuery("from Emp").list();
		}
	 //个人信息修改
	public Emp update(int empId,Emp emp){
		String historyEmpinformation=emp.getEmpId()+"个人信息修改";
		 Timestamp historyDate=new Timestamp(System.currentTimeMillis());
		 History history=new History(emp.getEmpId(), historyEmpinformation, historyDate);
		 factory.getCurrentSession().save(history);
		return (Emp) factory.getCurrentSession().merge(emp);
	}
	@Override
	public Emp find(int empId) {
		return (Emp)factory.getCurrentSession().get(Emp.class, empId);
		
	}
	
}
