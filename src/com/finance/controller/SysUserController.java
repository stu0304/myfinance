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
import com.finance.model.TPerson;
import com.finance.model.TSysUser;
import com.finance.service.IPersonService;
import com.finance.service.ISysUserService;
import com.google.gson.Gson;

@Controller
public class SysUserController {

	@Resource
	private ISysUserService sysUserService;
	@Resource
	private IPersonService personService;
	

	@RequestMapping(value = "/checkOriginalPwd.do")
	@ResponseBody
	public void checkOriginalPwd(TSysUser tSysUser,HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter  pw = response.getWriter();
		if(sysUserService.checkOriginalPwd(tSysUser))
		{
			pw.write("allok");
		}else{
			pw.write("myfail");
		}
		pw.flush();
		pw.close();
	}
	
	@RequestMapping(value = "/addSysUser.do")
	@ResponseBody
	public void addSysUser(TSysUser tSysUser,TPerson person,HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter  pw = response.getWriter();
		tSysUser.settStatus("-1");
		tSysUser.settUserId(UUID.randomUUID().toString());
		if(sysUserService.addUser(tSysUser))
		{
			person.settPresonId(UUID.randomUUID().toString());
			person.settUserId(tSysUser.gettUserId());
			personService.insertSelective(person);
			pw.write("allok");
		}else{
			pw.write("myfail");
		}
		pw.flush();
		pw.close();
	}

	@RequestMapping(value = "/deleteSysUser.do")
	@ResponseBody
	public boolean deleteSysUser(TSysUser tSysUser) {
		return sysUserService.deleteUser(tSysUser);
	}

	@RequestMapping(value = "/updateSysUser.do")
	@ResponseBody
	public boolean updateSysUser(TSysUser tSysUser) {
		return sysUserService.updateUser(tSysUser);
	}

	@RequestMapping(value = "/getAllSysUser.do")
	@ResponseBody
	public void getAllSysUser(TSysUser sysUser,HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = response.getWriter();
		
		String currentPage = request.getParameter("curpage")==null?"0":request.getParameter("curpage");
		String rows = request.getParameter("page_Size")==null?"10":request.getParameter("page_Size");
		
		Page pager = new Page(currentPage,rows);
		pw.write(sysUserService.selectUserPerson(sysUser.gettUserName(),pager));
		pw.flush();
		pw.close();
	}
	
}
