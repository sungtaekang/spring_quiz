package com.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.dao.SiteMapper;
import com.quiz.lesson06.domain.Site;

@Service
public class SiteBO {

	@Autowired
	private SiteMapper siteMapper;
	
	public List<Site> getSiteList() {
		return siteMapper.selectSiteList();
	}
	
	public void addSite(String name, String url) {
		siteMapper.insertSite(name, url);;
	}
}
