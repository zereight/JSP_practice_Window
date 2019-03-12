package user; //user는 tutorial이라는 db에 user라는 table을 만들어주었기 때문이다.

public class UserDTO {
	//DTO 는 database transfer object의 약자로 db와 정보를 교환하기 위한 객체형식이다.

	String userID;
	String userPassword;
	
	
	//우클릭 > Source > generate getter & setter
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
