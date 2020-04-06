package com.an.service;

import com.an.pojo.Infos;

import java.util.List;

public interface InfoService {

	public List<Infos> findAllInfo();
	public void addInfos(Infos infos);
	public void deleteInfos(int infoId);
	public Infos findById(int infoId);
	public void updateInfo(Infos info);
}
