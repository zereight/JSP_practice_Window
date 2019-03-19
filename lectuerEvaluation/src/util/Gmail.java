package util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator{
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		//����� ���� ������ �����ǿ���, ���� ������ ���� ������ϱ�.
		
		AdminInfo temp = new AdminInfo();
		return new PasswordAuthentication(temp.getEmailId(), temp.getEmailPw());
	}
}
