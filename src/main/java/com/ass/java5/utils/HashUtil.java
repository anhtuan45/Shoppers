package com.ass.java5.utils;

import org.mindrot.jbcrypt.BCrypt;

public class HashUtil {
	public static String hash(String plain) {
		//gensalt : ma hoa
		String salt = BCrypt.gensalt();
		return BCrypt.hashpw(plain, salt);
	}
	
	//checkPW
	public static boolean verify(String plain  ,String hashed) {
		return BCrypt.checkpw(plain, hashed);
	}
}
