package com.finance.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.finance.model.TAttenchment;

public class AttenmentDao extends SqlSessionDaoSupport implements TAttenchmentDao  {

	@Override
	public List getAllAttByTid(String tid) {
		List tempList = super.getSqlSession().selectList("com.finance.dao.TAttenchmentDao.getAllAttByTid");
		return null;
	}

	@Override
	public TAttenchment getAttByTid(String tid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteByPrimaryKey(String tAttid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(TAttenchment record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(TAttenchment record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public TAttenchment selectByPrimaryKey(String tAttid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByPrimaryKeySelective(TAttenchment record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(TAttenchment record) {
		// TODO Auto-generated method stub
		return 0;
	}

}
