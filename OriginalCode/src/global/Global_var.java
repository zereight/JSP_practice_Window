package global;

public class Global_var {
	private static String myEmail = "���۾��̵�"; 
	private static String myPassword = "���ۺ�й�ȣ";
	private static String AdminEmail= "������ �̸���"; //�Ű��̸����� ���� �� ���Դϴ�.
	
	
	
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
