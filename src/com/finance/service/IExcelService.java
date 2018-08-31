package com.finance.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;


public interface IExcelService {

	public void exportExcel(HttpServletRequest request,HttpServletResponse resp,List listContent) throws UnsupportedEncodingException, IOException;

	public List importExcel(MultipartFile mfile) throws IOException;

}
