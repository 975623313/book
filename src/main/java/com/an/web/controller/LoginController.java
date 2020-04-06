package com.an.web.controller;

import com.an.pojo.Readers;
import com.an.service.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/ll")
public class LoginController {
	
	@Autowired
	private ReaderService readerService;
	
	@RequestMapping(value="/toLogin",method= RequestMethod.POST)
	public String loginToJudge(Readers reader, HttpSession session){
		
		
		
		Readers readers = this.readerService.loginFind(reader.getAccount(),reader.getPassword());
		System.out.println(readers);
		if(readers.getStatusCode()==100){
			
			session.setAttribute("readers", readers);
			
			
			
			return "redirect:/user/findUserBorrow/"+readers.getReaderId();
		}if(readers.getStatusCode()==200){
			return "redirect:/index";
		}else{
			return "redirect:/login";
		}
		
		
		
		
		
		

	}

}
