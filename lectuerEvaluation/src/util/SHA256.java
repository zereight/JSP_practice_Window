package util;

import java.security.MessageDigest;

public class SHA256 { //이메일 해시를 생성하기 위한 class입니다.
	
	public static String getSHA256(String input) {
		StringBuffer result = new StringBuffer(); //StringBuffer는 문자열을 추가하거나 변경할 때 주로 사용하는 자료형이다.
		
		try {
			
			MessageDigest digest = MessageDigest.getInstance("SHA-256"); //java에서 SHA나 MD5를 이용한 암호화 알고리즘을 사용하기 위해서는 MessageDigest 클래스를 이용. "SHA-512"도 가능하다.
			
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
		
		
		return result.toString(); //StringBuffer를 String형으로 변환하여 반환.
		
	}

}
