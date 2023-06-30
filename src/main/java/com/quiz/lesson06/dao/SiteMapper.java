package com.quiz.lesson06.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson06.domain.Site;

@Repository
public interface SiteMapper {

	public List<Site> selectSiteList();
	
	public void insertSite(
			@Param("name") String name,
			@Param("url") String url);
	
	public Site selectSiteByUrl(String url);
	
	public int deleteSiteById(int id);
}
