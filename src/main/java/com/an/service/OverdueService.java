package com.an.service;

import com.an.pojo.Overdues;

import java.util.List;

public interface OverdueService {

	public List<Overdues> findAllOverdue();
	public Overdues findByBookName(String bookName);
	public void addOverdue(Overdues overdue);
	public void updateOverdue(Overdues overdue);
	public void deleteOverdue(int overdueId);
}
