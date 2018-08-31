package com.finance.service;

import com.finance.model.Page;
import com.finance.model.TLoadDetails;

public interface ILoanDetailsService {

	String selectCountLoanOutHistory(String comid);
	
	String selectLoanOutHistory(TLoadDetails record,Page pager);
	
	boolean confirmStartLoanIn(TLoadDetails record);
	
	boolean payBack(TLoadDetails record);
	
	String selectCountLoanInHistory(String comid);
	
	String selectLoanInHistory(TLoadDetails record,Page pager);
	
	String selectLoanOutDetails(TLoadDetails record,Page pager);
	
    boolean deleteByPrimaryKey(String tLoanId);

    boolean insertSelective(TLoadDetails record);

    String selectByPrimaryKey(String tLoanId);

    boolean updateByPrimaryKeySelective(TLoadDetails record);
    
    String selectCountLoanDetails(String comid);
}
