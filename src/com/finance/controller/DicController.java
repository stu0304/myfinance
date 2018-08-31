package com.finance.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finance.model.Page;
import com.finance.model.TDicCode;
import com.finance.service.IDicCodeService;
import com.google.gson.Gson;

@Controller
public class DicController {

	@Resource
	private IDicCodeService codeService;

	
	@RequestMapping(value = "/addOrUpdateJSON.do")
	@ResponseBody
	public void addOrUpdate(TDicCode dicCode,HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter  pw = response.getWriter();
		if(!"".equals(dicCode.gettDicId()))
		{
			pw.write(codeService.updateByPrimaryKeySelective(dicCode)==true?"allok":"myfail");
		}else{
			dicCode.settDicId(UUID.randomUUID().toString());
			dicCode.settDicCode(UUID.randomUUID().toString());
			pw.write(codeService.insertSelective(dicCode)==true?"allok":"myfail");
		}
		pw.flush();
		pw.close();
	}
	
	@RequestMapping(value = "/getDropDownJSON.do")
	@ResponseBody
	public void checkOriginalPwd(TDicCode dicCode,HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter  pw = response.getWriter();
		pw.write(codeService.getDataByType(dicCode.gettType()));
		pw.flush();
		pw.close();
	}
	
	@RequestMapping(value = "/getAllDicJSON.do")
	@ResponseBody
	public void getAllDicJSON(TDicCode dicCode,HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		
		String currentPage = request.getParameter("curpage")==null?"0":request.getParameter("curpage");
		String rows = request.getParameter("page_Size")==null?"10":request.getParameter("page_Size");
		
		Page pager = new Page(currentPage,rows);
		
		PrintWriter  pw = response.getWriter();
		pw.write(new Gson().toJson(codeService.selectDicAll(dicCode,pager)));
		pw.flush();
		pw.close();
	}
	
	@RequestMapping(value = "/selectDicTypeJSON.do")
	@ResponseBody
	public void selectDicTypeJSON(TDicCode dicCode,HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter  pw = response.getWriter();
		pw.write(codeService.selectDicType());
		pw.flush();
		pw.close();
	}
	
	@RequestMapping(value = "/getOneDicCodeJSON.do")
	@ResponseBody
	public void getOneDicCode(TDicCode dicCode,HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter  pw = response.getWriter();
		pw.write(new Gson().toJson(codeService.selectByPrimaryKey(dicCode.gettDicId())));
		pw.flush();
		pw.close();
	}
	
	@RequestMapping(value = "/deleteOneDicCodeJSON.do")
	@ResponseBody
	public void deleteOneDicCode(TDicCode dicCode,HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter  pw = response.getWriter();
		pw.write(codeService.deleteByPrimaryKey(dicCode.gettDicId())==true?"allok":"myfail");
		pw.flush();
		pw.close();
	}

	



}
