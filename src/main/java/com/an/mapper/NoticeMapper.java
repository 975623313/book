package com.an.mapper;

import com.an.pojo.Notices;

import java.util.List;

public interface NoticeMapper {
	
	
	public List<Notices> findAllNotices();
	//public void addNotice(Notices notice);
	void addNotices(Notices notices);
	

}
