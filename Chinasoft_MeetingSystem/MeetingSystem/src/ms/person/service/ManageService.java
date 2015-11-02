package ms.person.service;

import ms.profile.Emp;

public interface ManageService {

	public Emp find(int empId);

	public void update(int empId,Emp emp);

	public void delete(int empId,int reempId);


}
