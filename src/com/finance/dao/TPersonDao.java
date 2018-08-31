package com.finance.dao;

import org.springframework.stereotype.Repository;

import com.finance.model.TPerson;
import com.finance.model.VOPersonAtt;

@Repository
public interface TPersonDao {
    int deleteByPrimaryKey(String tId);

    int insert(TPerson record);

    int insertSelective(TPerson record);

    TPerson selectByPrimaryKey(String tId);
    
    VOPersonAtt selectByUserId(String userId);

    int updateByPrimaryKeySelective(TPerson record);

    int updateByPrimaryKey(TPerson record);
}