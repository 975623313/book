package com.an.web.controller;

import com.an.pojo.Borrows;
import com.an.pojo.Overdues;
import com.an.service.BorrowService;
import com.an.service.OverdueService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/overdue")
public class OverdueController {
	
	@Autowired
	private OverdueService overdueService;
	@Autowired
	private BorrowService borrowService;
	@ResponseBody
	@RequestMapping("/deleteOverdue")
	public String deleteOverdue(int overdueId){
		
		this.overdueService.deleteOverdue(overdueId);
		
		return "success";
		
	}
	@RequestMapping("/findAllOverduce")
	public String findAllOverduce(@RequestParam(defaultValue = "1") int pageNo, Model model){

		Date nowDate = new Date();
		List<Borrows> lists = this.borrowService.findAllBorrow();
		for (Borrows borrows : lists) {
			int now = (int) (nowDate.getTime() / (24 * 60 * 60 * 1000));
			int re = (int) ((borrows.getReturnDate().getTime()) / (24 * 60 * 60 * 1000));
			if(now>=re){
				Overdues overdue = this.overdueService.findByBookName(borrows.getBookName());
				if(overdue==null){
					Overdues overdues = new Overdues();
					overdues.setBookName(borrows.getBookName());
					overdues.setReaderName(borrows.getReaderName());
					overdues.setOverdueDate(now-re);
					this.overdueService.addOverdue(overdues);
				}else{
					overdue.setOverdueDate(now-re);
					this.overdueService.updateOverdue(overdue);
				}
			}
			this.borrowService.updateDate(borrows);
		}
		PageHelper.startPage(pageNo,3);
		List<Overdues> listO = this.overdueService.findAllOverdue();
		PageInfo<Overdues> pageInfo = new PageInfo<>(listO);
		model.addAttribute("pageInfo", pageInfo);
		return "overdue";
	}
}
