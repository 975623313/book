package com.an.web.controller;

import com.an.pojo.Books;
import com.an.pojo.Borrows;
import com.an.pojo.Readers;
import com.an.service.BorrowService;
import com.an.service.ReaderService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/reader")
public class ReaderController {

	@Autowired
	private ReaderService readerService;
	@Autowired
	private BorrowService borrowService;
	
	@RequestMapping("/findReader")
	public String findReader(@RequestParam(defaultValue = "1") int pageNo, Model model){

		Date nowDate = new Date();
		List<Borrows> lists = this.borrowService.findAllBorrow();
		for (Borrows borrows : lists) {
			int now = (int) (nowDate.getTime() / (24 * 60 * 60 * 1000));
			int bo = (int) ((borrows.getBorrowDate().getTime()) / (24 * 60 * 60 * 1000));
			//
			// System.out.println(q);
			// System.out.println(w);
			borrows.setExpireDate(now-bo);
			
			this.borrowService.updateDate(borrows);
		}




		PageHelper.startPage(pageNo, 3);
		
		List<Readers> list = this.readerService.findAllReaders();
		PageInfo<Readers> pageInfo=new PageInfo<Readers>(list);
		System.out.println("茶人");
		for (Readers r: pageInfo.getList()
			 ) {
			System.out.println(r);
		}
		model.addAttribute("pageInfo", pageInfo);
		return "reader";

	}
	@RequestMapping("/addReader")
	public String addReader(Readers reader){
		this.readerService.addReader(reader);
		return "redirect:/reader/findReader";
		
	}
	@ResponseBody
	@RequestMapping("/deleteReader")
	public String deleteReader(int readerId){
		this.readerService.deleteReader(readerId);
		
		return "success";
	}
	
	@RequestMapping("/findBorrowBook/{readerId}")
	public String findBorrowBook(@PathVariable int readerId, Model model){
		
		
		
		List<Borrows> list = this.readerService.findBorrowBook(readerId);
		
		
		model.addAttribute("list", list);
		return "borrow";
	}
	
	
	
	
	
}
