package ms.person.service;

import java.util.List;

import ms.profile.Emp;

public interface PersonalService {

	public Emp login(String empEmail, String empPassword);

	public void register(Emp emp);

	public List<Emp> list(int empId);

	public Emp update(int empId,Emp emp);

	public Emp find(int empId);
}
