package com.finance.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MyUtil {

	public static String getDate() {
		Date now = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");// ���Է�����޸����ڸ�ʽ
		return dateFormat.format(now);
	}

	public static boolean checkResult(int i) {
		return i > 0;
	}

}
