package global;

public class Global_var {
	private static String myEmail = "구글아이디"; 
	private static String myPassword = "구글비밀번호";
	private static String AdminEmail= "관리자 이메일"; //신고이메일을 받을 때 쓰입니다.
	
	
	
	public static String getAdminEmail() {
		return AdminEmail;
	}
	public static void setAdminEmail(String adminEmail) {
		AdminEmail = adminEmail;
	}
	public static String getMyEmail() {
		return myEmail;
	}
	public  static void setMyEmail(String myEmail2) {
		myEmail = myEmail2;
	}
	public static String getMyPassword() {
		return myPassword;
	}
	public static void setMyPassword(String myPassword2) {
		myPassword = myPassword2;
	}
	
	
	
}
