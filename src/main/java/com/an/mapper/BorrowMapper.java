package com.an.mapper;

import com.an.pojo.Borrows;

import java.util.List;

public interface BorrowMapper {
	
	
	public void insertBorrow(Borrows borrow);
	public List<Borrows> findBorrowById(int borrowId);
	public void returnBook(String bookName);
	public List<Borrows> findAllBorrow();
	public void updateDate(Borrows borrows);
	public int findBookCount(int borrowId);

}
