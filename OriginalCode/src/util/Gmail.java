package util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

import global.Global_var;

public class Gmail extends Authenticator{

	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		//���� �������� �����ǿ���, ���� ������ ���� �� ���: ������� ����
		return new PasswordAuthentication(Global_var.getMyEmail(), Global_var.getMyPassword());
	}
	
}
