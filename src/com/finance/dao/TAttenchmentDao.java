package com.finance.dao;

import java.util.List;

import com.finance.model.TAttenchment;


public interface TAttenchmentDao {
	
    List getAllAttByTid(String tid);
    
	TAttenchment getAttByTid(String tid);
	
    int deleteByPrimaryKey(String tAttid);

    int insert(TAttenchment record);

    int insertSelective(TAttenchment record);

    TAttenchment selectByPrimaryKey(String tAttid);

    int updateByPrimaryKeySelective(TAttenchment record);

    int updateByPrimaryKey(TAttenchment record);
}