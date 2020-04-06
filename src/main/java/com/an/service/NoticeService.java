package com.an.service;

import com.an.pojo.Notices;

import java.util.List;

public interface NoticeService {

	public List<Notices> findAllNotice();
	public void addNotices(Notices notice);
}
