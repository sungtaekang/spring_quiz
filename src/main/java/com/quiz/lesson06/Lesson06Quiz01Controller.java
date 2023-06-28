package com.quiz.lesson06;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.SiteBO;
import com.quiz.lesson06.domain.Site;

@RequestMapping("/lesson06/quiz01")
@Controller
public class Lesson06Quiz01Controller {

	@Autowired
	private SiteBO siteBO;
	
	@GetMapping("/add_site_view")
	public String addSiteView() {
		return "lesson06/addSite";
	}
	
	
	@PostMapping("/add_site")
	@ResponseBody
	public String addSite(
			@RequestParam("name") String name,
			@RequestParam("url") String url) {
		
		// insert
		siteBO.addSite(name, url);
		
		return "성공";
	}
	
	@GetMapping("/site_list_view")
	public String afterAddSiteView(Model model) {
		List<Site> siteList = siteBO.getSiteList();
		model.addAttribute("siteList", siteList);
		return "lesson06/siteList";
	}
}
