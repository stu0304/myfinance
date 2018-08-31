package com.finance.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finance.dao.TCodeDicDao;
import com.finance.dao.TCompanyDao;
import com.finance.model.Page;
import com.finance.model.TCompany;
import com.finance.service.ICompanyService;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
@Service
public class CompanyService implements ICompanyService {

	@Resource
	private TCompanyDao companyDao;
	
	@Resource
	private TCodeDicDao dicDao;
	@Override
	public String selectAllCompany(TCompany com, Page pager) {
	   return new Gson().toJson(companyDao.selectAllCompany(com.gettComName(), pager.getNextStartPage(), pager.getV_pageSize()));
	}

	@Override
	public String selectComTreeRoot(String pid) {
	
		List<TCompany> treeList = companyDao.selectComTreeList(pid);
		StringBuffer buffer = new StringBuffer("[");
		JsonArray comArray = new JsonArray();
		for(TCompany com : treeList)
		{
			JsonObject obj = new JsonObject();
			obj.addProperty("id", com.gettComId());
			obj.addProperty("text", com.gettComName());
			if(checkChildCompany(com.gettComId()))
			{
				obj.addProperty("state","closed");
			}

			comArray.add(obj);
			
		}
		
		return comArray.toString();
	}

	@Override
	public TCompany selectByPrimaryKey(String tComId) {
		return companyDao.selectByPrimaryKey(tComId);
	}

	@Override
	public boolean updateByPrimaryKeySelective(TCompany record) {
		return companyDao.updateByPrimaryKeySelective(record)>0?true:false;
	}

	@Override
	public boolean insertSelective(TCompany record) {
		return companyDao.insertSelective(record)>0?true:false;
	}

	@Override
	public boolean deleteByPrimaryKey(String tComId) {
		
		//no childnode, you can delete it 
		if(!this.checkChildCompany(tComId))
		{
			return companyDao.deleteByPrimaryKey(tComId)>0?true:false;
		}
       	// you can't delete it
		return false;
	}

	@Override
	public boolean checkChildCompany(String comid) {
		List<TCompany> treeList = companyDao.selectComTreeList(comid);
		// 无子节点
		if(treeList.size()==0)
		{
			return false;
		}
		return true;
		
	}

	@Override
	public String selectCountCompany() {
	return companyDao.selectCountCompany();
	}

	@Override
	public TCompany selectOneComForUpdate(String comId) {
	return companyDao.selectOneComForUpdate(comId);
	}


}
