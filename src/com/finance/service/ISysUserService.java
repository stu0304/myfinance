package com.finance.service;

import java.util.List;

import com.finance.model.Page;
import com.finance.model.TSysUser;

public interface ISysUserService {
	
	public String selectCountSysUser();
	
	public boolean addUser(TSysUser user);

	public boolean updateUser(TSysUser user);
	
	public boolean deleteUser(TSysUser user);
	
	public List<TSysUser> getAllSysUser(TSysUser user);
	
	public TSysUser loginUser(TSysUser user);
	
	public int userReview(String userId,String personId);
	
	public TSysUser getSysUserById(String userId);

	public boolean checkOriginalPwd(TSysUser user);
	
	public  String selectUserPerson(String userName,Page pager);
	
}
