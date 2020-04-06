package com.an.service;

import com.an.pojo.Borrows;
import com.an.pojo.Readers;

import java.util.List;

public interface ReaderService {

	public List<Readers> findAllReaders();
	
	
	public void addReader(Readers readers);
	
	public void deleteReader(int readerId);
	
	public List<Borrows> findBorrowBook(int readerId);
	
	public Readers loginFind(String account, String password);
	
}
