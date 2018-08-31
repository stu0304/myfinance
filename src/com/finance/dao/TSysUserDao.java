package com.finance.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.finance.model.TSysUser;

// mapper 代理方式
public interface TSysUserDao {
	
	String selectCountSysUser();
	
    TSysUser loginUser(TSysUser user);
    
    int deleteByPrimaryKey(String tUserId);

    int insert(TSysUser record);

    int insertSelective(TSysUser record);

    TSysUser selectByPrimaryKey(String tUserId);
    
    TSysUser checkOriginalPwd(TSysUser user);
    
    List selectAllSysUser(TSysUser user);

    int updateByPrimaryKeySelective(TSysUser record);

    int updateByPrimaryKey(TSysUser record);
    
    List selectUserPerson(@Param("tUserName")String tUserName,@Param("nextStartPage") int nextStartPage,@Param("v_pageSize") int v_pageSize);
}