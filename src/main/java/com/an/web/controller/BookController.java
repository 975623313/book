package com.an.web.controller;

import com.an.pojo.Books;
import com.an.pojo.SearchKey;
import com.an.service.BookService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
@RequestMapping("/book")
public class BookController {
	@Autowired
	private BookService bookService;
	
	
	
	@RequestMapping("/findAllBooks")
	public String findAll(@RequestParam(defaultValue = "1") int pageNo, Model model){
		PageHelper.startPage(pageNo, 3);
		List<Books> list = this.bookService.findAllBooks();

		PageInfo<Books> pageInfo=new PageInfo<Books>(list);

		System.out.println("查书----");
		for (Books l:pageInfo.getList()
			 ) {
			System.out.println(l);

		}
		model.addAttribute("pageInfo",pageInfo);
		
		return "book";
		
	}
	
	
	
	@RequestMapping(value="/addBook",method= RequestMethod.POST)
	public String addBooks(Books book){
		System.out.println("11111111111111111");
		this.bookService.add(book);
		System.out.println("22222222222222222");
		return "redirect:/book/findAllBooks";
	}
//	@RequestMapping(value="/deleteOneBook/{bookId}",method=RequestMethod.GET)
//	public String delBook(@PathVariable int bookId){
//		
//		
//		
//		Books book = this.bookService.findBookById(bookId);
//		if(book.getBookNumber()==0){
//			System.out.println("已经没有了");
//		}else{
//			this.bookService.deleteOneBook(bookId);
//		}
//		return "redirect:/book/findAllBooks";
//	}
	@ResponseBody
	@RequestMapping(value="/deleteOneBook")
	public String employeeDelete(int bookId) {
		System.out.println("111111111111111111111");
		Books book = this.bookService.findBookById(bookId);
		if(book.getBookNumber()==0){
			System.out.println("已经没有了");
			return "no";
		}
		else{
			this.bookService.deleteOneBook(bookId);
			System.out.println("成功删除");
			return "success";
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value="/addOneBook")
	public String addOneBook(int bookId) {
		System.out.println("111111111111111111111");
		Books book = this.bookService.findBookById(bookId);
		if(book.getBookNumber()==999){
			System.out.println("圖書館放不下了");
			return "no";
		}
		else{
			this.bookService.addOnebook(bookId);
			System.out.println("成功增加");
			return "success";
		}
	}
	
	
	@RequestMapping(value = "/searchBook",produces = "text/plain;charset=utf-8")
	public String searchBook(@RequestParam(defaultValue = "1") int pageNo,SearchKey searchKey, Model model){
		String s=null;
		try {
			 s = new String(searchKey.toString().getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		PageHelper.startPage(pageNo,3);
		System.out.println(s);
		List<Books> list = this.bookService.searchBook(s);
		PageInfo<Books> pageInfo = new PageInfo<Books>(list);
		System.out.println(pageInfo);
		for (Books books : pageInfo.getList()) {
			System.out.println(books);
		}
		model.addAttribute("pageInfo", pageInfo);
		
		return "book";
		
		
		
	}
	
	@RequestMapping("/searchUserBook")
	public String searchUserBook(SearchKey searchKey, Model model){
        String s=null;
        try {
            s = new String(searchKey.toString().getBytes("ISO-8859-1"), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
		List<Books> list = this.bookService.searchBook(s);
		for (Books books : list) {
			System.out.println(books);
		}
		model.addAttribute("list", list);
		
		return "userBook";
		
		
		
	}
	
	
	

}
