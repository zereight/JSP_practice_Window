package user; //user�� tutorial�̶�� db�� user��� table�� ������־��� �����̴�.

public class UserDTO {
	//DTO �� database transfer object�� ���ڷ� db�� ������ ��ȯ�ϱ� ���� ��ü�����̴�.

	String userID;
	String userPassword;
	
	
	//��Ŭ�� > Source > generate getter & setter
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	
}
