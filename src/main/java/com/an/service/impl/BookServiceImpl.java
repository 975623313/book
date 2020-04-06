package com.an.service.impl;

import com.an.mapper.BookMapper;
import com.an.pojo.Books;
import com.an.pojo.SearchKey;
import com.an.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookServiceImpl implements BookService {

	@Autowired
	private BookMapper bookMapper;
	
	@Override
	public List<Books> findAllBooks() {
		
		return this.bookMapper.findA();
	}
	@Override
	public void add(Books book) {
		this.bookMapper.addBooks(book);
		
	}
	@Override
	public void deleteBooks(int bookId) {
		this.bookMapper.deleteBook(bookId);
		
	}
	@Override
	public Books findBookById(int bookId) {
		// TODO Auto-generated method stub
		return this.bookMapper.findById(bookId);}
	@Override
	public void deleteOneBook(int bookId) {
		this.bookMapper.deleteOneBook(bookId);
		
	}
	@Override
	public void addOnebook(int bookId) {
		this.bookMapper.addOneBook(bookId);
		
	}
	@Override
	public void deleteOneBookByBookName(String bookName) {
		this.bookMapper.deleteOneBookByBookName(bookName);
		
	}
	@Override
	public List<Books> searchBook(String s) {
		System.out.println("aaaaaaaaaaa");
		List<Books> books = this.bookMapper.searchBook(s);
		for (Books b:books
			 ) {
			System.out.println(b);
		}
		return books;
	}
	
	
	

	

}
