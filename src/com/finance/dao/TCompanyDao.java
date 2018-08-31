package com.finance.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.finance.model.TCompany;

public interface TCompanyDao {
	
	List selectAllCompany(@Param("tComName")String comName,@Param("nextStartPage") int nextStartPage,@Param("v_pageSize") int v_pageSize);
	
	List selectComTreeList(String pid);
	
    int deleteByPrimaryKey(String tComId);

    int insert(TCompany record);

    int insertSelective(TCompany record);

    TCompany selectByPrimaryKey(String tComId);

    int updateByPrimaryKeySelective(TCompany record);

    int updateByPrimaryKey(TCompany record);
    
    String selectCountCompany();
    
    TCompany selectOneComForUpdate(String comId);
}