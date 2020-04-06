package com.an.service.impl;

import com.an.mapper.NoticeMapper;
import com.an.pojo.Notices;
import com.an.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper noticeMapper;
	
	
	
	@Override
	public List<Notices> findAllNotice() {
		return this.noticeMapper.findAllNotices();
	}
	@Override
	public void addNotices(Notices notice) {
		this.noticeMapper.addNotices(notice);
		
	}

	
}
