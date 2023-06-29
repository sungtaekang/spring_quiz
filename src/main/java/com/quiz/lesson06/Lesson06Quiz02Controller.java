package com.quiz.lesson06;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.SiteBO;

@RequestMapping("/lesson06/quiz02")
@Controller
public class Lesson06Quiz02Controller {

	@Autowired
	private SiteBO siteBO;
	
	@ResponseBody
	@RequestMapping("/is_duplication")
	public Map<String, Boolean> isDuplication(
			@RequestParam("url") String url) {
		
		siteBO;
		
		return;
	}
}
