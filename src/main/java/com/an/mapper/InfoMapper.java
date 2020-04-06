package com.an.mapper;

import com.an.pojo.Infos;

import java.util.List;

public interface InfoMapper {
	
	public List<Infos> findAllInfo();
	public void addInfos(Infos infos);
	public void deleteInfos(int infoId);
	public Infos findById(int infoId);
	
	public void updateInfo(Infos info);

}
