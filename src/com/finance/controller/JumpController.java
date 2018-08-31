package com.finance.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.finance.model.TCompany;
import com.finance.model.TSysUser;
import com.finance.model.TZiChanFuZhai;
import com.finance.model.VOPersonAtt;
import com.finance.service.ICompanyService;
import com.finance.service.IDicCodeService;
import com.finance.service.ILoanDetailsService;
import com.finance.service.IPersonService;
import com.finance.service.ISysUserService;
import com.finance.service.IZiChanFuZhaiService;
import com.finance.service.impl.CompanyService;

@Controller
@Scope("prototype")
public class JumpController {

	@Resource
	private IZiChanFuZhaiService zcfzService;
	@Resource
	private IPersonService personService;
	@Resource
	private ISysUserService sysUserService;
	@Resource
	private ICompanyService companyService;
	@Resource
	private ILoanDetailsService loanDetailsService;
	
	@Resource
	private IDicCodeService codeService;
	
	@RequestMapping(value="goToNewLogin", method = RequestMethod.GET)
	public String goToNewLogin(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		return "newLogin";
	}
	
	@RequestMapping(value="gotonewPieChart", method = RequestMethod.GET)
	public String gotonewPieChart(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		return "newPieChart";
	}
	
	@RequestMapping(value="gogoZichanfuzhai", method = RequestMethod.GET)
	public String gogoZichanfuzhai(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		VOPersonAtt myPerson = (VOPersonAtt)request.getSession().getAttribute("myperson");
		TZiChanFuZhai zcfc = zcfzService.selectByCompanyID(myPerson.gettComId());
		request.setAttribute("zcfc", zcfc);
		return "zichanfuzhai";
	}
	
	// 资金借款分析
	@RequestMapping(value="loanOutHistory", method = RequestMethod.GET)
	public String loanOutHistory(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		VOPersonAtt myPerson = (VOPersonAtt)request.getSession().getAttribute("myperson");
		String loanOutHisCountNum = loanDetailsService.selectCountLoanOutHistory(myPerson.gettComId());
		request.setAttribute("loanOutHisCountNum", loanOutHisCountNum);
		
		return "loanOutHistory";
	}
	// 公司信息管理
	@RequestMapping(value="comsInfo", method = RequestMethod.GET)
	public String comsInfo(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		request.setAttribute("allCompanyNum",companyService.selectCountCompany());
		return "comsInfo";
	}
	@RequestMapping(value="companyInfo", method = RequestMethod.GET)
	public String companyInfo(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		VOPersonAtt myPerson = (VOPersonAtt)request.getSession().getAttribute("myperson");

		TCompany com = companyService.selectByPrimaryKey(myPerson.gettComId());
		  request.setAttribute("mycomInfo", com);
		return "companyInfo";
	}
	@RequestMapping(value="loanOutAnalysis", method = RequestMethod.GET)
	public String loanOutAnalysis(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		VOPersonAtt myPerson = (VOPersonAtt)request.getSession().getAttribute("myperson");
		String detailsCountNum = loanDetailsService.selectCountLoanDetails(myPerson.gettComId());
	    request.setAttribute("detailsCountNum", detailsCountNum);
		return "loanOutAnalysis";
	}
	
	@RequestMapping(value="goToLoanIn", method = RequestMethod.GET)
	public String goToLoadIn(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		VOPersonAtt myPerson = (VOPersonAtt)request.getSession().getAttribute("myperson");
		String comCapitalCounNum = zcfzService.selectCountComCapital(myPerson.gettComId());
		 request.setAttribute("comCapitalCounNum", comCapitalCounNum);
		return "loanInAnalysis";
	}
	
	@RequestMapping(value="goToLoanInHistory", method = RequestMethod.GET)
	public String goToLoanInHistory(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		VOPersonAtt myPerson = (VOPersonAtt)request.getSession().getAttribute("myperson");
		String countLoanInHistory = loanDetailsService.selectCountLoanInHistory(myPerson.gettComId());
		request.setAttribute("countLoanInHistory", countLoanInHistory);
		return "loanInHistory";
	}
	
	@RequestMapping(value="goToUpload", method = RequestMethod.GET)
	public String goToUpload(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		
		return "upload";
	}
	
	
	@RequestMapping(value="goToDateTime", method = RequestMethod.GET)
	public String goToDateTime(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		request.setAttribute("allCodeNum", codeService.selectCountDicCode());
		return "datetime";
	}
	
	@RequestMapping(value="goToDicList", method = RequestMethod.GET)
	public String goToDicList(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		request.setAttribute("allCodeNum", codeService.selectCountDicCode());
		return "dicList";
	}
	@RequestMapping(value="goToSysUser", method = RequestMethod.GET)
	public String goToSysUser(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		request.setAttribute("allSysUserNum", sysUserService.selectCountSysUser());
		return "sysUser";
	}
	
	@RequestMapping(value="goToChangePwd", method = RequestMethod.GET)
	public String goToChangePwd(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		return "password";
	}
	
	@RequestMapping(value="goToPersonInfo", method = RequestMethod.GET)
	public String goToPersonInfo(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		TSysUser sysUser = (TSysUser)request.getSession().getAttribute("myuser");
		VOPersonAtt person = personService.selectByUserId(sysUser.gettUserId());
		request.setAttribute("tperson", person);
		return "personInfo";
	}
	
	@RequestMapping(value="goToJump", method = RequestMethod.GET)
	public String goToJump(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		return "jump";
	}
	
	@RequestMapping(value="goToMainPage", method = RequestMethod.GET)
	public String goToMain(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		return "main";
	}
	
	
	@RequestMapping(value = "goToLoginPage", method = RequestMethod.GET)
	public String toIndex() {
		return "newLogin";
	}
	
	@RequestMapping(value = "mylogout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "newLogin";
	}
	
	@RequestMapping(value="gotoRegister")
	public String gotoRegister(){
		return "newReg";
	}
	
	
	@RequestMapping(value="gotocompanyTree")
	public String gotocompanyTree(HttpServletRequest request){
		String treeID = request.getParameter("treeID");
		String treeText = request.getParameter("treeText");
		request.setAttribute("treeID", treeID);
		request.setAttribute("treeText", treeText);
		
		return "companyTree";
	}
	@RequestMapping(value="gotodaijianceshebei")
	public String gotodaijianceshebei(){
		return "equipPreCharts";
	}
	
	
	
}
