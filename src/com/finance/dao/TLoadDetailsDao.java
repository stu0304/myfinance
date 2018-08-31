package com.finance.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.finance.model.TLoadDetails;

public interface TLoadDetailsDao {
	
	String selectCountLoanOutHistory(@Param("tComId")String comId);
	
	List selectLoanOutHistory(@Param("tComId")String comId,@Param("tComName")String comName,@Param("tLoanStartTime")String startTime,@Param("tLoanEndTime")String endTime,@Param("nextStartPage") int nextStartPage,@Param("v_pageSize") int v_pageSize);
	
	String selectCountLoanInHistory(@Param("tComId")String comId);
	
	List selectLoanInHistory(@Param("tComId")String comId,@Param("tComName")String comName,@Param("tLoanStartTime")String startTime,@Param("tLoanEndTime")String endTime,@Param("nextStartPage") int nextStartPage,@Param("v_pageSize") int v_pageSize);
	
	String selectCountLoanDetails(@Param("tComId")String comId);
	
	List selectLoanOutDetails(@Param("tComId")String comId,@Param("tComName")String comName,@Param("nextStartPage") int nextStartPage,@Param("v_pageSize") int v_pageSize);
	
    int deleteByPrimaryKey(String tLoanId);

    int insert(TLoadDetails record);

    int insertSelective(TLoadDetails record);

    TLoadDetails selectByPrimaryKey(String tLoanId);

    int updateByPrimaryKeySelective(TLoadDetails record);

    int updateByPrimaryKey(TLoadDetails record);
}