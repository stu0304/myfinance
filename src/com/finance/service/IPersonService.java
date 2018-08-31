package com.finance.service;

import org.springframework.stereotype.Service;

import com.finance.model.TPerson;
import com.finance.model.VOPersonAtt;


public interface IPersonService {
    int deleteByPrimaryKey(String tId);

    int insert(TPerson record);

    int insertSelective(TPerson record);

    TPerson selectByPrimaryKey(String tId);
    
    VOPersonAtt selectByUserId(String userId);

    int updateByPrimaryKeySelective(TPerson record);

    int updateByPrimaryKey(TPerson record);
}