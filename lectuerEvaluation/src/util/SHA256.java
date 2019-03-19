package util;

import java.security.MessageDigest;

public class SHA256 { //�̸��� �ؽø� �����ϱ� ���� class�Դϴ�.
	
	public static String getSHA256(String input) {
		StringBuffer result = new StringBuffer(); //StringBuffer�� ���ڿ��� �߰��ϰų� ������ �� �ַ� ����ϴ� �ڷ����̴�.
		
		try {
			
			MessageDigest digest = MessageDigest.getInstance("SHA-256"); //java���� SHA�� MD5�� �̿��� ��ȣȭ �˰����� ����ϱ� ���ؼ��� MessageDigest Ŭ������ �̿�. "SHA-512"�� �����ϴ�.
			
			byte[] salt = "Donald Trump is my idol.".getBytes();
			digest.reset();
			digest.update(salt);
			
			
			byte[] chars = digest.digest(input.getBytes("utf-8"));
			
			for(int i =0; i<chars.length; i++) {
				String hex = Integer.toHexString(0xFF & chars[i]);
				
				if( hex.length() == 1 ) {
					result.append('0');
				}
				
				result.append(hex);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return result.toString(); //StringBuffer�� String������ ��ȯ�Ͽ� ��ȯ.
		
	}

}
