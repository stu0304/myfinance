package com.finance.service.impl;

import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finance.dao.TLoadDetailsDao;
import com.finance.dao.TZiChanFuZhaiDao;
import com.finance.model.Page;
import com.finance.model.TLoadDetails;
import com.finance.model.TZiChanFuZhai;
import com.finance.model.VOPersonAtt;
import com.finance.service.ILoanDetailsService;
import com.google.gson.Gson;
@Service
public class LoanDetailsService implements ILoanDetailsService {

	@Resource
	private TZiChanFuZhaiDao zcfjDao;
	@Resource
	private TLoadDetailsDao loadDetailsDao;
	@Override
	public boolean deleteByPrimaryKey(String tLoanId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean insertSelective(TLoadDetails record) {
		
		record.settLoanId(UUID.randomUUID().toString());
		record.settStatus("债务方已提交");
		return loadDetailsDao.insertSelective(record)>0?true:false;
	}

	@Override
	public String selectByPrimaryKey(String tLoanId) {
		return new Gson().toJson(loadDetailsDao.selectByPrimaryKey(tLoanId));
	}

	@Override
	public boolean updateByPrimaryKeySelective(TLoadDetails record) {
		record.settStatus("债权方已审核");
		return loadDetailsDao.updateByPrimaryKeySelective(record)>0?true:false;
	}

	@Override
	public String selectLoanOutDetails(TLoadDetails record, Page pager) {
		return new Gson().toJson(loadDetailsDao.selectLoanOutDetails(record.gettLoanoutComid(), record.gettChanghuanTotal(), pager.getNextStartPage(), pager.getV_pageSize()));
		
	}

	@Override
	public String selectCountLoanDetails(String comid) {
	return loadDetailsDao.selectCountLoanDetails(comid);
	}

	@Override
	public String selectLoanInHistory(TLoadDetails record, Page pager) {
		return new Gson().toJson(loadDetailsDao.selectLoanInHistory(record.gettLoaninComid(), record.gettLoanoutComid(),record.gettLoanStartTime(),record.gettLoanEndTime(), pager.getNextStartPage(), pager.getV_pageSize()));
	}

	@Override
	public String selectCountLoanInHistory(String comid) {
		return loadDetailsDao.selectCountLoanInHistory(comid);
	}

	@Override
	public boolean confirmStartLoanIn(TLoadDetails record) {
		
		TZiChanFuZhai zcfzOut = new TZiChanFuZhai();
		zcfzOut.settComId(record.gettLoanoutComid());
		
		TZiChanFuZhai Out = zcfjDao.selectByCompanyID(record.gettLoanoutComid());
		
		String minusResult = String.valueOf(Double.valueOf(Out.gettHuobizijin())-Double.valueOf(record.gettLoanNum()));
		zcfzOut.settHuobizijin(minusResult);
		
		zcfjDao.updateByCompanyId(zcfzOut);
		
		TZiChanFuZhai zcfzIn = new TZiChanFuZhai();
		zcfzIn.settComId(record.gettLoaninComid());
		TZiChanFuZhai in = zcfjDao.selectByCompanyID(record.gettLoaninComid());
		
		
		String plusStr = String.valueOf(Double.valueOf(in.gettHuobizijin())+Double.valueOf(record.gettLoanNum()));
		zcfzIn.settHuobizijin(plusStr);
		
		zcfjDao.updateByCompanyId(zcfzIn);
		
		return loadDetailsDao.updateByPrimaryKeySelective(record)>0?true:false;
	
	}

	@Override
	public String selectLoanOutHistory(TLoadDetails record,Page pager) {
		return new Gson().toJson(loadDetailsDao.selectLoanOutHistory(record.gettLoanoutComid(), record.gettLoaninComid(), record.gettLoanStartTime(),record.gettLoanEndTime(),pager.getNextStartPage(),pager.getV_pageSize()));
	}

	@Override
	public String selectCountLoanOutHistory(String comid) {
	    return loadDetailsDao.selectCountLoanOutHistory(comid);
	}

	@Override
	public boolean payBack(TLoadDetails record) {
		
		// 债务方 减少货币资金
		TZiChanFuZhai zcfzIn = new TZiChanFuZhai();
		zcfzIn.settComId(record.gettLoaninComid());
		TZiChanFuZhai in = zcfjDao.selectByCompanyID(record.gettLoaninComid());
		
		String plusStr = String.valueOf(Double.valueOf(in.gettHuobizijin())-Double.valueOf(record.gettChanghuanTotal()));
		zcfzIn.settHuobizijin(plusStr);
		
		zcfjDao.updateByCompanyId(zcfzIn);
		
		
		// 债权方 增加货币资金
		TZiChanFuZhai zcfzOut = new TZiChanFuZhai();
		zcfzOut.settComId(record.gettLoanoutComid());
		
		TZiChanFuZhai Out = zcfjDao.selectByCompanyID(record.gettLoanoutComid());
		
		String plusResult = String.valueOf(Double.valueOf(Out.gettHuobizijin())+Double.valueOf(record.gettChanghuanTotal()));
		zcfzOut.settHuobizijin(plusResult);
		
		zcfjDao.updateByCompanyId(zcfzOut);
		record.settLoanNum(null);
		return loadDetailsDao.updateByPrimaryKeySelective(record)>0?true:false;
	}

}
