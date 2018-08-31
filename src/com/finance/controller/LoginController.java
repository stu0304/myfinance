package com.finance.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.finance.model.TSysUser;
import com.finance.model.VOPersonAtt;
import com.finance.service.IPersonService;
import com.finance.service.ISysUserService;

@Controller
public class LoginController {

	@Resource
	private ISysUserService sysUserService;
	@Resource
	private IPersonService personService;

	@RequestMapping(value = "mylogin.do", method = RequestMethod.GET)
	public void login(HttpSession session,TSysUser user,HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("UTF-8");
		
		TSysUser mySysUser = sysUserService.loginUser(user);
		String result = "";
		if(mySysUser!=null)
		{
			VOPersonAtt myperson = personService.selectByUserId(mySysUser.gettUserId());
			session.setAttribute("myuser", mySysUser);
			session.setAttribute("myperson", myperson);
			
			result="allok";
		}else{
			result="myfail";
		}
		
		response.getWriter().write(result);
	}
	
	@RequestMapping(value = "myregister.do", method = RequestMethod.GET)
	public void myregister(TSysUser user,HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter out = this.getWriter(response);
		user.settUserId(UUID.randomUUID().toString());
		user.settRole("财务主管");
		if(sysUserService.addUser(user))
		{
			out.print("allok");
		}else{
			out.print("myfail");
		}
		out.flush();
		out.close();
	}

	public PrintWriter getWriter(HttpServletResponse response) throws IOException
	{
		response.setContentType("application/json;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		return response.getWriter();
		
	}

}
