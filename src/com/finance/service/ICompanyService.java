package com.finance.service;

import java.util.List;

import com.finance.model.Page;
import com.finance.model.TCompany;

public interface ICompanyService {

	boolean checkChildCompany(String comid);
	
	String selectAllCompany(TCompany com,Page pager);
	
	String selectComTreeRoot(String pid);
	
    TCompany selectByPrimaryKey(String tComId);
    
    boolean updateByPrimaryKeySelective(TCompany record);
    
    boolean insertSelective(TCompany record);
    
    boolean deleteByPrimaryKey(String tComId);
    
    String selectCountCompany();
    
    TCompany selectOneComForUpdate(String comId);
}
