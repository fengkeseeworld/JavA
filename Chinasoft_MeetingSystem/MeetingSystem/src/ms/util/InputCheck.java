package ms.util;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class InputCheck implements FormCheckInterface {


	@Override
	public boolean Email(String email) {

		Pattern pattern = Pattern
				.compile("^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$");

		Matcher matcher = pattern.matcher(email);

		return matcher.matches();
	}

	@Override
	public boolean IdCard(String idcard) {
		
		return true;
	}

	@Override
	public boolean notNull(List<Object> list) {
		for (Object ob : list) {
			if ((ob == null)||ob.equals("")) {
				return false;
			}
		}
		return true;
	}

	@Override
	public boolean isTel(String tel) {
		Pattern p = Pattern
				.compile("^((13[0-9])|(15[^4,\\D])|(18[0,1-9]))\\d{8}$");
		Matcher m = p.matcher(tel);
		return m.matches();

	}

	@Override
	public boolean isIp(String ip) {
		Pattern pattern = Pattern.compile("\\b((?!\\d\\d\\d)\\d+|1\\d\\d|2[0-4]\\d|25[0-5])\\.((?!\\d\\d\\d)\\d+|1\\d\\d|2[0-4]\\d|25[0-5])\\.((?!\\d\\d\\d)\\d+|1\\d\\d|2[0-4]\\d|25[0-5])\\.((?!\\d\\d\\d)\\d+|1\\d\\d|2[0-4]\\d|25[0-5])\\b");

		Matcher matcher = pattern.matcher(ip); 

		return matcher.matches();

	}
	
	

}
