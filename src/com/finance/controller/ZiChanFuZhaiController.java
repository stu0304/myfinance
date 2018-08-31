package com.finance.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finance.model.TZiChanFuZhai;
import com.finance.service.IZiChanFuZhaiService;

@Controller
public class ZiChanFuZhaiController {

	@Resource
	private IZiChanFuZhaiService zcfcService;

	
	@RequestMapping(value = "/addOrUpdateZiChanFuZhai.do")
	@ResponseBody
	public void addOrUpdate(TZiChanFuZhai record,HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter  pw = response.getWriter();
		pw.write(zcfcService.updateByCompanyId(record)==true?"allok":"myfail");
		pw.flush();
		pw.close();
	}
	
	@RequestMapping(value = "/getChartPieZcfzJSON.do")
	@ResponseBody
	public void getChartPieZcfzJSON(TZiChanFuZhai record,HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter  pw = response.getWriter();
		pw.write(zcfcService.getChartPieZcfzByComID(record.gettComId()));
		pw.flush();
		pw.close();
	}

}
