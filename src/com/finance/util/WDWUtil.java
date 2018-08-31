package com.finance.util;

public class WDWUtil {
	// @描述：是否是2003的excel，返回true�?2003 
    public static boolean isExcel2003(String filePath)  {  
         return filePath.matches("^.+\\.(?i)(xls)$");  
     }  
   
    //@描述：是否是2007的excel，返回true�?2007 
    public static boolean isExcel2007(String filePath)  {  
         return filePath.matches("^.+\\.(?i)(xlsx)$");  
     }  
}
