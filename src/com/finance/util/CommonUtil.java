package com.finance.util;

import java.util.UUID;

public class CommonUtil {

	public static String getShortUUID(){
		return UUID.randomUUID().toString().replace("-", "");
	}
}
