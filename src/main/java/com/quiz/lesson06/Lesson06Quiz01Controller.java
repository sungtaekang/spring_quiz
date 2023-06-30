package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
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
	public Map<String, Object> addSite(
			@RequestParam("name") String name,
			@RequestParam("url") String url) {
		
		// insert
		siteBO.addSite(name, url);
		
		// 응답 
		// {"code":1, "result":"성공"}	JSON String
		Map<String, Object> result = new HashMap<>();
		result.put("code", 1);
		result.put("result", "성공");
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/is_duplication")
	public Map<String, Object> isDuplication(
			@RequestParam("url") String url) {
		
		Map<String, Object> result = new HashMap<>();
		result.put("code", 1);
		result.put("isDuplication", false);
		
		// DB select by url
		Site site = siteBO.getSiteByUrl(url);	// site or null
		if (site != null) { // 중복
		result.put("isDuplication", true);
		}
		
		return result;
	}
	
	@GetMapping("/site_list_view")
	public String afterAddSiteView(Model model) {
		List<Site> siteList = siteBO.getSiteList();
		model.addAttribute("siteList", siteList);
		return "lesson06/siteList";
	}
	
	// AJAX가 하는 요청 - 즐겨찾기 삭제
	@ResponseBody
	@DeleteMapping("/delete_site")
	public Map<String, Object> deleteSite(
			@RequestParam("id") int id) {
	
		// DB delete
		int row = siteBO.deleteSiteById(id);
		
		Map<String, Object> result = new HashMap<>();
		
		if (row == 1) {
			// 성공
			result.put("code", 1);
			result.put("result", "성공");
		} else {
			// 삭제 된 행 없음 - 실패
			result.put("code", 500);
			result.put("errorMessage", "삭제될 데이터가 없습니다.");
		}
		
		return result;
	}
	
}
