package com.finance.service;

import com.finance.model.Page;
import com.finance.model.TZiChanFuZhai;
import com.finance.model.VOComZcfz;

public interface IZiChanFuZhaiService {

    String getChartPieZcfzByComID(String comId);
	
	String  selectCountComCapital(String comid);
	
	String selectCompanyCapital(VOComZcfz record,Page pager);
	
    boolean insertSelective(TZiChanFuZhai record);

    TZiChanFuZhai selectByCompanyID(String comid);

    boolean updateByPrimaryKeySelective(TZiChanFuZhai record);
    
    boolean updateByCompanyId(TZiChanFuZhai record);
    
}