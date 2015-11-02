package ms.util;

import java.util.List;

public interface FormCheckInterface {
	
	public  boolean  Email(String email);
	public  boolean  IdCard(String idcard);
	public  boolean  notNull(List<Object> list);
	public 	boolean  isTel(String tel);
	public  boolean	 isIp(String ip);

}
