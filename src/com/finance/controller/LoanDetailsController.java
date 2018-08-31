package com.finance.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finance.model.Page;
import com.finance.model.TLoadDetails;
import com.finance.model.VOComZcfz;
import com.finance.model.VOPersonAtt;
import com.finance.service.ILoanDetailsService;
import com.finance.service.IZiChanFuZhaiService;

@Controller
public class LoanDetailsController {

	@Resource
	private ILoanDetailsService loanDetailsService;
	
	@Resource
	private IZiChanFuZhaiService zcfcService;
	
	@RequestMapping(value = "/loadCompanyCapital.do")
	@ResponseBody
	public void loadCompanyCapital(VOComZcfz record,HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter  pw = response.getWriter();
		
		String currentPage = request.getParameter("curpage")==null?"0":request.getParameter("curpage");
		String rows = request.getParameter("page_Size")==null?"5":request.getParameter("page_Size");
		Page pager = new Page(currentPage,rows);
		
		pw.write(zcfcService.selectCompanyCapital(record, pager));
		pw.flush();
		pw.close();
	}
	
	@RequestMapping(value = "/selectLoanOutHistory.do")
	@ResponseBody
	public void selectLoanOutHistory(TLoadDetails loanDetails,HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		String currentPage = request.getParameter("curpage")==null?"0":request.getParameter("curpage");
		String rows = request.getParameter("page_Size")==null?"10":request.getParameter("page_Size");
		
		Page pager = new Page(currentPage,rows);
		
		VOPersonAtt myperson = (VOPersonAtt)request.getSession().getAttribute("myperson");
		loanDetails.settLoanoutComid(myperson.gettComId());
		
		PrintWriter  pw = response.getWriter();
		pw.write(loanDetailsService.selectLoanOutHistory(loanDetails, pager));
		pw.flush();
		pw.close();
	}
	
	@RequestMapping(value = "/selectLoanInHistory.do")
	@ResponseBody
	public void selectLoanInHistory(TLoadDetails loanDetails,HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		String currentPage = request.getParameter("curpage")==null?"0":request.getParameter("curpage");
		String rows = request.getParameter("page_Size")==null?"10":request.getParameter("page_Size");
		
		Page pager = new Page(currentPage,rows);
		
		VOPersonAtt myperson = (VOPersonAtt)request.getSession().getAttribute("myperson");
		loanDetails.settLoaninComid(myperson.gettComId());
		
		PrintWriter  pw = response.getWriter();
		pw.write(loanDetailsService.selectLoanInHistory(loanDetails, pager));
		pw.flush();
		pw.close();
	}
	
	
	
	@RequestMapping(value = "/addOrUpdateLoanDetails.do")
	@ResponseBody
	public void addOrUpdateLoanDetails(TLoadDetails loanDetails,HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter  pw = response.getWriter();
		if(!"".equals(loanDetails.gettLoanId())&&loanDetails.gettLoanId()!=null)
		{
			pw.write(loanDetailsService.updateByPrimaryKeySelective(loanDetails)==true?"allok":"myfail");
		}else{
		
			VOPersonAtt myperson = (VOPersonAtt)request.getSession().getAttribute("myperson");
			loanDetails.settLoaninComid(myperson.gettComId());
			
			pw.write(loanDetailsService.insertSelective(loanDetails)==true?"allok":"myfail");
		}
		pw.flush();
		pw.close();
	}

	@RequestMapping(value = "/selectLoanOutDetails.do")
	@ResponseBody
	public void selectLoanOutDetails(TLoadDetails loanDetails,HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		String currentPage = request.getParameter("curpage")==null?"0":request.getParameter("curpage");
		String rows = request.getParameter("page_Size")==null?"10":request.getParameter("page_Size");
		
		Page pager = new Page(currentPage,rows);
		
		VOPersonAtt myperson = (VOPersonAtt)request.getSession().getAttribute("myperson");
		loanDetails.settLoanoutComid(myperson.gettComId());
		
		PrintWriter  pw = response.getWriter();
		pw.write(loanDetailsService.selectLoanOutDetails(loanDetails, pager));
		pw.flush();
		pw.close();
	}
	
	@RequestMapping(value = "/selectOneLoanDetails.do")
	@ResponseBody
	public void selectOneLoanDetails(TLoadDetails loanDetails,HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter  pw = response.getWriter();
		pw.write(loanDetailsService.selectByPrimaryKey(loanDetails.gettLoanId()));
		pw.flush();
		pw.close();
	}
	
	@RequestMapping(value = "/updateLoanDetails.do")
	@ResponseBody
	public void updateLoanDetails(TLoadDetails record,HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter  pw = response.getWriter();
		pw.write(loanDetailsService.updateByPrimaryKeySelective(record)==true?"allok":"myfail");
		pw.flush();
		pw.close();
	}
	
	@RequestMapping(value = "/confirmStartLoanIn.do")
	@ResponseBody
	public void confirmStartLoanIn(TLoadDetails record,HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter  pw = response.getWriter();
		String myaction = request.getParameter("myaction");
		if(myaction.equals("loan"))
		{
			pw.write(loanDetailsService.confirmStartLoanIn(record)==true?"allok":"myfail");
		}
		if(myaction.equals("payback"))
		{
			pw.write(loanDetailsService.payBack(record)==true?"allok":"myfail");
		}
		
		pw.flush();
		pw.close();
	}
}
