package util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator{
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		//사용할 구글 계정의 보안탭에서, 보안 수준이 낮은 앱허용하기.
		
		AdminInfo temp = new AdminInfo();
		return new PasswordAuthentication(temp.getEmailId(), temp.getEmailPw());
	}
}
