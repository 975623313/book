package com.an.mapper;

import com.an.pojo.Books;
import com.an.pojo.SearchKey;

import java.util.List;


public interface BookMapper {

	public List<Books> findA();
	
	public void addBooks(Books book);
	
	public void deleteBook(int bookId);
	
	public Books findById(int bookId);
	
	public void deleteOneBook(int bookId);
	
	public void addOneBook(int bookId);
	
	public void deleteOneBookByBookName(String bookName);
	
	public List<Books> searchBook(String s);
	
}
