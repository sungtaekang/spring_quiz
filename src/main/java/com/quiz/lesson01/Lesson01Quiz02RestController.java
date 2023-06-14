package com.quiz.lesson01;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/lesson01/quiz02")
@RestController
public class Lesson01Quiz02RestController {
	
	@RequestMapping("/1")
	public List<Map<String, Object>> quiz02_1() {
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> map = new HashMap<String, Object>() {{ put("rate", 15); put("director", "봉준호");put("time", 131); put("title", "기생충"); } };
		list.add(map);
		map = new HashMap<String, Object>() {{ put("rate", 0); put("director", "로베르토 베니니");put("time", 116); put("title", "인생은 아름다워"); } };
		list.add(map);
		map = new HashMap<String, Object>() {{ put("rate", 12); put("director", "크리스토퍼 놀란");put("time", 147); put("title", "인셉션"); } };
		list.add(map);
		map = new HashMap<String, Object>() {{ put("rate", 19); put("director", "윤종빈");put("time", 133); put("title", "범죄와의 전쟁 : 나쁜놈들 전성시대"); } };
		list.add(map);
		map = new HashMap<String, Object>() {{ put("rate", 15); put("director", "프란시스 로렌스");put("time", 137); put("title", "헝거게임"); } };
		list.add(map);
		
//		for(int i = 0; i < list.size(); i++) {
//			list.get(i);
//		}
		return list;
	}
	
	@RequestMapping("/2")
	public List<Board> quiz02_2() {
		// @ResponseBody + return String => HttpMessageConverter	HTML
		// @ResponseBody + return 객체 => HttpMessageConverter	jackson 라이브러리 => JSON
		
		List<Board> resultList = new ArrayList<>();
		Board board = new Board(); // 일반 자바 bean
		board.setTitle("안녕하세요 가입인사 드립니다.");
		board.setUser("hagulu");
		board.setContent("안녕하세요. 가입했어요. 앞으로 잘 부탁드립니다. 활동 열심히 하겠습니다.");
		resultList.add(board);
		
		board = new Board(); // 일반 자바 bean
		board.setTitle("헐 대박");
		board.setUser("bada");
		board.setContent("오늘 목요일이 었어.. 금요일인줄");
		resultList.add(board);
		
		board = new Board(); // 일반 자바 bean
		board.setTitle("오늘 데이트 한 이야기 들려드릴게요");
		board.setUser("dulumary");
		board.setContent("....");
		resultList.add(board);
		
		return resultList;
	}
	
	@RequestMapping("/3")
	public ResponseEntity<Board> quiz02_3() {
		Board board = new Board();
		board.setTitle("안녕하세요 가입인사 드립니다.");
		board.setUser("hagulu");
		board.setContent("안녕하세요. 가입했어요. 앞으로 잘 부탁드립니다. 활동 열심히 하겠습니다.");
		
		return new ResponseEntity<>(board, HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
