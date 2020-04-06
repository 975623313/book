package com.an.service;

import com.an.pojo.Borrows;
import com.an.pojo.Readers;

import java.util.List;

public interface BorrowService {

	public void insertBorrow(Borrows borrow);
	public Readers findReaderById(int readerId);
	public void returnBook(String bookName);
	public List<Borrows> findAllBorrow();
	public void updateDate(Borrows borrow);
	public int findBookCount(int borrowId);
}
