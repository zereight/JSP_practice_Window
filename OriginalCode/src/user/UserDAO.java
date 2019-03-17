package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;


public class UserDAO {
	

	public int login (String userID, String userPassword) {
		Connection conn=null; //Connection�� ����Ҷ����� ���Ӱ� �ʱ�ȭ���־� ����Ѵ�.
		ResultSet result=null;
		PreparedStatement pstmt=null;
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			result = pstmt.executeQuery();
			
			if(result.next()) {
				if(result.getString(1).equals(userPassword)) {
					return 1; //�α��μ���
				} else {
					return 0; //��й�ȣ Ʋ��
				}
			}
			return -1; //���̵� ����.
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try { if(conn!=null)conn.close();} catch (Exception e) {e.printStackTrace();}
			try { if(pstmt!=null)pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try { if(result!=null)result.close();} catch (Exception e) {e.printStackTrace();}
		}
		
		return -2; //������ ���̽� ����.
	}
	

	public int join(UserDTO user) {
		Connection conn = null; //Connection�� ����Ҷ����� ���Ӱ� �ʱ�ȭ���־� ����Ѵ�.
		ResultSet result = null;
		PreparedStatement pstmt = null;
		String SQL = "INSERT INTO USER VALUES (?,?,?,?,false)";
	
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserEmail());
			pstmt.setString(4, user.getUserEmailHash());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try { if(conn!=null)conn.close();} catch (Exception e) {e.printStackTrace();}
			try { if(pstmt!=null)pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try { if(result!=null)result.close();} catch (Exception e) {e.printStackTrace();}
		}
		
		return -1; //ȸ������ ����
		
	}
	

	public String getUserEmail(String userID) {
		Connection conn=null; //Connection�� ����Ҷ����� ���Ӱ� �ʱ�ȭ���־� ����Ѵ�.
		ResultSet result=null;
		PreparedStatement pstmt=null;
		String SQL = "SELECT userEmail FROM USER WHERE userID = ?";
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, userID);
			
			result = pstmt.executeQuery();
			
			if(result.next()) {
				return result.getString(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try { if(conn!=null)conn.close();} catch (Exception e) {e.printStackTrace();}
			try { if(pstmt!=null)pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try { if(result!=null)result.close();} catch (Exception e) {e.printStackTrace();}
		}
		return null; //db����
	}
	

	public boolean getUserEmailChecked(String userID) {
		Connection conn=null; //Connection�� ����Ҷ����� ���Ӱ� �ʱ�ȭ���־� ����Ѵ�.
		ResultSet result=null;
		PreparedStatement pstmt=null;
		String SQL = "SELECT userEmailChecked FROM USER WHERE userID = ?";
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			result = pstmt.executeQuery();
			if(result.next()) {
				return result.getBoolean(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try { if(conn!=null)conn.close();} catch (Exception e) {e.printStackTrace();}
			try { if(pstmt!=null)pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try {
				if (result != null)
					result.close();
			} catch (Exception e) {e.printStackTrace();}
		}
		
		return false; //db����
	}
	
	public boolean setUserEmailChecked(String userID) {
		Connection conn=null; //Connection�� ����Ҷ����� ���Ӱ� �ʱ�ȭ���־� ����Ѵ�.
		PreparedStatement pstmt=null;
		String SQL = "UPDATE USER SET userEmailChecked=true WHERE userID = ?";
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try { if(conn!=null)conn.close();} catch (Exception e) {e.printStackTrace();}
			try { if(pstmt!=null)pstmt.close();} catch (Exception e) {e.printStackTrace();}
		}
		return false;
	}
	
}