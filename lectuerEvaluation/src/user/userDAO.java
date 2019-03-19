package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class userDAO {

	
	
	//�α����Լ�
	public int login( String userId, String userPassword ) {
		
		Connection conn= null;
		ResultSet res = null;
		PreparedStatement p = null;
		
		String sql = "SELECT userPassword FROM USER WHERE userId= ? ";
		
		try {
			conn = DatabaseUtil.getConnection(); //DB�� ����� �� �ִ� ��ü�� �����
			p = conn.prepareStatement(sql); //DB��ɹ��� ������ ������ �����, ���� �������� �ʴ� ��ɹ��� �Ҵ�.
			p.setString(1, userId); //�������� �ʴ� ? �κп� ���� �Ҵ�.
			res = p.executeQuery(); //SELECT�������� DB���� �ҷ����� �װ��� ���ڵ� �� ����.
			
			if(res.next()) { //���� ����  �ִ°� (ó������� ù���� ��)
				if(res.getString(1).equals(userPassword)) { //�ִٸ� �� 1���� ���� ���� String������ ��ȯ��,  userPassword�� �� (java������ ���ڿ� ���Ҷ� equals��� ==�� ���ڿ��� �ּҰ� ��)
					return 1; //�α����� ����
				} else {
					return 0; //��й�ȣ�� Ʋ��.
				}
			
			} else {
				return -1; //�ش��ϴ� user�� ����.
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try { if(conn != null) { conn.close(); } } catch (Exception e) { e.printStackTrace(); } //�޸� ������ ���ش� gc�� ���� �͸����� ������ ������!
			try { if(res != null) { res.close(); } } catch (Exception e) { e.printStackTrace(); }
			try { if(p != null) { p.close(); } } catch (Exception e) { e.printStackTrace(); }
		}
		
		return -2; //DB��ü ����
		
	}
	
	//ȸ������ �Լ�.
	public int userRegister( userDTO user ) {
		Connection conn = null;
		PreparedStatement p = null;
		
		String sql = "INSERT INTO USER VALUES (?, ?, ?, ?, false)";
		
		try {
			
			conn = DatabaseUtil.getConnection();
			p = conn.prepareStatement(sql);
			p.setString(1, user.getUserID());
			p.setString(2, user.getUserPassword());
			p.setString(3, user.getUserEmail());
			p.setString(4, user.getUserEmailHash());
			
			return p.executeUpdate(); //������Ʈ ������ ���� ��ȯ ���⼭�� 1�̸� ����
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try { if(conn != null) { conn.close(); } } catch (Exception e) { e.printStackTrace(); } //�޸� ������ ���ش� gc�� ���� �͸����� ������ ������!
			try { if(p != null) { p.close(); } } catch (Exception e) { e.printStackTrace(); }
		}
		
		return -1; //ȸ������ ����
	}
	
	//userId�� userEmail�� ã�Ƽ� ��ȯ�ϴ� �Լ� �̸��Ϻ����� ����
	public String getUserEmail(String userId) {
		Connection conn = null;
		ResultSet res = null;
		PreparedStatement p= null;
		
		String sql = "SELECT userEmail FROM USER WHERE userId = ? ";
		
		try {
			
			conn = DatabaseUtil.getConnection();
			p = conn.prepareStatement(sql);
			p.setString(1, userId);
			res = p.executeQuery();
			
			if(res.next()) {
				return res.getString(1); //String������ ��ȯ
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try { if(conn != null) { conn.close(); } } catch (Exception e) { e.printStackTrace(); } //�޸� ������ ���ش� gc�� ���� �͸����� ������ ������!
			try { if(res != null) { res.close(); } } catch (Exception e) { e.printStackTrace(); }
			try { if(p != null) { p.close(); } } catch (Exception e) { e.printStackTrace(); }
		}
		return null;
	}
	
	
	//userId�� �� ���̵� EmailChecked �Ǿ����� ��ȯ�ϴ� �Լ�
	public boolean getUserEmailChecked(String userId) {
		
		Connection conn = null;
		ResultSet res = null;
		PreparedStatement p = null;
		
		String sql = "SELECT userEmailChecked FROM USER WHERE userId = ?";
		
		
		try {
		
			conn = DatabaseUtil.getConnection();
			p = conn.prepareStatement(sql);
			p.setString(1, userId);
			
			res = p.executeQuery();
			
			if(res.next()) {
				return res.getBoolean(1);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try { if(conn != null) { conn.close(); } } catch (Exception e) { e.printStackTrace(); } //�޸� ������ ���ش� gc�� ���� �͸����� ������ ������!
			try { if(res != null) { res.close(); } } catch (Exception e) { e.printStackTrace(); }
			try { if(p != null) { p.close(); } } catch (Exception e) { e.printStackTrace(); }
		}
		
		
		return false;
	}
	
	
	//userid�� �� ���̵��� EmailChecked�� true�� �ٲ��ִ� �Լ�
	public int setUserEmailChecked(String userId) {
		Connection conn = null;
		PreparedStatement p = null;
		
		String sql = "UPDATE USER SET userEmailChecked = true WHERE userId = ? ";
		
		try {
			
			conn = DatabaseUtil.getConnection();
			p = conn.prepareStatement(sql);
			p.setString(1, userId);
			
			return p.executeUpdate(); //������Ʈ �����ϸ� �������� ��ȯ
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try { if(conn != null) { conn.close(); } } catch (Exception e) { e.printStackTrace(); } //�޸� ������ ���ش� gc�� ���� �͸����� ������ ������!
			try { if(p != null) { p.close(); } } catch (Exception e) { e.printStackTrace(); }
		}
		return -1; //������Ʈ ����
	}
	
	
	
}
