package com.finance.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.finance.model.TAttenchment;

@Service
public interface IUploadService {
	
	public boolean uploadFile(TAttenchment att);
	
	public boolean updateFile(TAttenchment att);
	
	public boolean deleteFile(TAttenchment att);
	
	public boolean checkFile(String tid);
	
	public String getAllAttJSON(String tid);
}