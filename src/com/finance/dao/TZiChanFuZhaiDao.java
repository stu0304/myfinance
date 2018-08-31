package com.finance.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.finance.model.TZiChanFuZhai;

public interface TZiChanFuZhaiDao {
	
	TZiChanFuZhai getZcfzByComId(@Param("tComId")String comId);
	
    String selectCountComCapital(@Param("tComId")String comId);
	
    int deleteByPrimaryKey(String tZcfzId);

    int insert(TZiChanFuZhai record);

    int insertSelective(TZiChanFuZhai record);

    List selectCompanyCapital(@Param("tComId")String comId,@Param("tComName")String comName,@Param("nextStartPage") int nextStartPage,@Param("v_pageSize") int v_pageSize);
    
    TZiChanFuZhai selectByPrimaryKey(String tZcfzId);
    
    TZiChanFuZhai selectByCompanyID(String comid);

    int updateByCompanyId(TZiChanFuZhai record);
    
    int updateByPrimaryKeySelective(TZiChanFuZhai record);

    int updateByPrimaryKey(TZiChanFuZhai record);
}