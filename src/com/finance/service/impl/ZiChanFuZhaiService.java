package com.finance.service.impl;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finance.dao.TZiChanFuZhaiDao;
import com.finance.model.Page;
import com.finance.model.TZiChanFuZhai;
import com.finance.model.VOComZcfz;
import com.finance.service.IZiChanFuZhaiService;
import com.google.gson.Gson;

@Service
public class ZiChanFuZhaiService implements IZiChanFuZhaiService {

	@Resource
	private TZiChanFuZhaiDao zcfjDao;
	
	@Override
	public boolean insertSelective(TZiChanFuZhai record) {
		return zcfjDao.insertSelective(record)>0?true:false;
	}

	@Override
	public TZiChanFuZhai selectByCompanyID(String comid) {
		return zcfjDao.selectByCompanyID(comid);
	}

	@Override
	public boolean updateByPrimaryKeySelective(TZiChanFuZhai record) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateByCompanyId(TZiChanFuZhai record) {
	
		return zcfjDao.updateByCompanyId(record)>0?true:false;
	}

	@Override
	public String selectCompanyCapital(VOComZcfz record, Page pager) {
		  return new Gson().toJson(
				  zcfjDao.selectCompanyCapital(record.gettComId(),record.gettComName(),
						  pager.getNextStartPage(), pager.getV_pageSize()));
	}

	@Override
	public String selectCountComCapital(String comid) {
	     return zcfjDao.selectCountComCapital(comid);
	}

	@Override   
	public String getChartPieZcfzByComID(String comId) {
		StringBuffer buffer = new StringBuffer("[{type: 'pie',name: '公司资产负债表占比',data: [");
		
		TZiChanFuZhai zcfz = zcfjDao.getZcfzByComId(comId);
			buffer.append("['货币资金',"+zcfz.gettHuobizijin()+"],");
			buffer.append("['应收账款',"+zcfz.gettYingshouzhangkuan()+"],");
			buffer.append("['固定资产合计',"+zcfz.gettGudingzichanheji()+"],");

		String result = buffer.substring(0,buffer.length()-1)+"] }]";
		return result;
	}

}
