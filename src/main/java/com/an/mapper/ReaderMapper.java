package com.an.mapper;

import com.an.pojo.Readers;

import java.util.List;

public interface ReaderMapper {
	public List<Readers> findAllReader();
	public void addReader(Readers reader);
	public Readers findReaderByName(String readerName);
	public void updateOtherId(Readers readerOther);
	public void deleteReader(int readerId);
	public Readers findReaderById(int readerId);
	public Readers loginFind(String account, String password);
}
