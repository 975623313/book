package com.an.web.controller;

import com.an.pojo.*;
import com.an.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private RuleService ruleService;
	
	@Autowired
	private InfoService infoService;
	
	@Autowired
	private OverdueService overdueService;
	
	@Autowired
	private BorrowService borrowService;
	
	@RequestMapping("/findAllNotice")
	public String findAllNotice(Model model){


		List<Rules> listR = this.ruleService.findAllRule();
		List<Infos> listI = this.infoService.findAllInfo();

		model.addAttribute("listR", listR);
		model.addAttribute("listI", listI);

		return "notice";
		
	}
	@RequestMapping("/insertNotice")
	public String insertNotice(Notices notice){
		this.noticeService.addNotices(notice);
		
		
		
		return "redirect:/notice/findAllNotice";
	}
}
