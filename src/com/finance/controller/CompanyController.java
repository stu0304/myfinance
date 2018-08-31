package com.finance.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finance.model.Page;
import com.finance.model.TCompany;
import com.finance.model.TZiChanFuZhai;
import com.finance.service.ICompanyService;
import com.finance.service.IZiChanFuZhaiService;
import com.google.gson.Gson;

@Controller
public class CompanyController {

	@Resource
	private ICompanyService companyService;
	@Resource
	private IZiChanFuZhaiService zcfcService;
	
	@RequestMapping(value = "/deleteOneCompany.do")
	@ResponseBody
	public void deleteOneCompany(TCompany company,HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter  pw = response.getWriter();
		pw.write(companyService.deleteByPrimaryKey(company.gettComId())==true?"allok":"myfail");
		pw.flush();
		pw.close();
	}
	
	@RequestMapping(value = "/selectComTreeRoot.do")
	@ResponseBody
	public void selectComTreeRoot(TCompany company,HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter  pw = response.getWriter();
		
		String comid=request.getParameter("id")==null?"-1":request.getParameter("id");
		pw.write(companyService.selectComTreeRoot(comid));
		pw.flush();
		pw.close();
	}
	
	@RequestMapping(value = "/getAllCompanyJSON.do")
	@ResponseBody
	public void getAllCompanyJSON(TCompany company,HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		
		String currentPage = request.getParameter("curpage")==null?"0":request.getParameter("curpage");
		String rows = request.getParameter("page_Size")==null?"10":request.getParameter("page_Size");
		
		Page pager = new Page(currentPage,rows);
		
		PrintWriter  pw = response.getWriter();
		pw.write(companyService.selectAllCompany(company, pager));
		pw.flush();
		pw.close();
	}
	
	@RequestMapping(value = "/addOrUpdateComJSON.do")
	@ResponseBody
	public void addOrUpdateComJSON(TCompany company,HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter  pw = response.getWriter();
		if(!"".equals(company.gettComId())&&company.gettComId()!=null)
		{
			pw.write(companyService.updateByPrimaryKeySelective(company)==true?"allok":"myfail");
		}else{
			
			company.settComId(UUID.randomUUID().toString());
			
			TZiChanFuZhai zcfz = new TZiChanFuZhai();
			zcfz.settZcfzId(UUID.randomUUID().toString());
			zcfz.settComId(company.gettComId());
			
			if(companyService.insertSelective(company))
			{
				if(zcfcService.insertSelective(zcfz))
				{
					pw.write("allok");
				}else {
					pw.write("myfail");
				}
				
			}else {
				pw.write("myfail");
			}
		
		}
		pw.flush();
		pw.close();
	}
	
	@RequestMapping(value = "/getOneCompanyJSON.do")
	@ResponseBody
	public void getOneCompanyJSON(TCompany company,HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter  pw = response.getWriter();
		pw.write(new Gson().toJson(companyService.selectOneComForUpdate(company.gettComId())));
		pw.flush();
		pw.close();
	}
	
}
