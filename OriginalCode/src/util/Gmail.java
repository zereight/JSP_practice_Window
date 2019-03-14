package util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

import global.Global_var;

public class Gmail extends Authenticator{

	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		//구글 계정에서 보안탭에서, 보안 수준이 낮은 앱 허용: 사용으로 변경
		return new PasswordAuthentication(Global_var.getMyEmail(), Global_var.getMyPassword());
	}
	
}
