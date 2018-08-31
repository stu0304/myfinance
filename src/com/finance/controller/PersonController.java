package com.finance.controller;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finance.model.TPerson;
import com.finance.model.VOPersonAtt;
import com.finance.service.IPersonService;


@Controller
public class PersonController {

	@Autowired
	private IPersonService personService;

	@RequestMapping(value = "/addPerson.do")
	@ResponseBody
	public String addPerson(TPerson person) {
		return "";
	}

	@RequestMapping(value = "/deletePerson.do")
	@ResponseBody
	public boolean deletePerson(String personId) {
		return personService.deleteByPrimaryKey(personId)>1?true:false;
	}

	@RequestMapping(value = "/updatePerson.do")
	@ResponseBody
	public boolean updatePersonInfo(TPerson person,HttpServletRequest request) {
		if(person.gettPresonId()==null||"".equals(person.gettPresonId()))
		{
			person.settPresonId(UUID.randomUUID().toString());
			return personService.insertSelective(person)>0?true:false;
		}
		
		return personService.updateByPrimaryKeySelective(person)>0?true:false;
	}

	@RequestMapping(value = "/getPersonByUserId.do")
	@ResponseBody
	public VOPersonAtt getPersonByUserId(String userId) {
		return personService.selectByUserId(userId);
	}

}
