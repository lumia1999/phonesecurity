package com.herry.relaxreader.util;

import java.io.File;
import java.io.FileInputStream;
import java.math.BigInteger;
import java.security.MessageDigest;

public class MD5Utils {
	public static String getFileMD5(File file) {
		if (file.exists()) {
			MessageDigest digest = null;
			FileInputStream fis = null;
			byte[] buffer = new byte[4096];
			int len = 0;
			try {
				digest = MessageDigest.getInstance("MD5");
				fis = new FileInputStream(file);
				while ((len = fis.read(buffer)) != -1) {
					digest.update(buffer, 0, len);
				}
				fis.close();
				BigInteger bigInt = new BigInteger(1, digest.digest());
				return bigInt.toString(16);
			} catch (Exception e) {
				return null;
			}
		} else {
			return null;
		}
	}

	private final static String[] hexDigits = { // 用来将字节转换成 16 进制表示的字符
	"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e",
			"f" };

	public static String getStringMD5(String saltKay, String uid,
			String version, String channel) {
		StringBuilder sb = new StringBuilder();
		sb.append(saltKay).append(uid).append(version).append(channel);
		return getStringMD5(sb.toString());
	}

	/**
	 * MD5加密算法的具体实现
	 * 
	 * @param src
	 *            需要加密的字符串
	 * @return 加密后的结果字符串,32位
	 */
	public static String getStringMD5(String src) {
		String result = null;
		try {
			result = new String(src);
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			result = byteArrayToHexString(md5.digest(result.getBytes()));
		} catch (Exception err) {
			err.printStackTrace();
		}
		return result.toUpperCase();
	}

	private static String byteArrayToHexString(byte[] digest) {
		StringBuffer result = new StringBuffer();
		for (int i = 0; i < digest.length; i++)
			result.append(byteToHexString(digest[i]));
		return result.toString();
	}

	private static String byteToHexString(byte b) {
		int n = b;
		if (n < 0)
			n = 256 + n;
		int d1 = n / 16;
		int d2 = n % 16;
		return hexDigits[d1] + hexDigits[d2];
	}
}
