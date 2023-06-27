package com.quiz.weather;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.weather.bo.WeatherHistoryBO;
import com.quiz.weather.domain.WeatherHistory;

@RequestMapping("/weather")
@Controller
public class WeatherHistoryController {

	@Autowired
	private WeatherHistoryBO weatherHistoryBO;
	
	@GetMapping("/weather_history_view")
	public String weatherView(Model model) {
		List<WeatherHistory> weatherHistoryList = weatherHistoryBO.getWeatherHistoryList();
		model.addAttribute("weatherHistoryList", weatherHistoryList);
		return "weather/weatherHistory";
	}
	
	// 추가 화면
		@GetMapping("/add_weather_view")
		public String addWeatherView() {
			return "weather/addWeather";
		}
		
	// 날씨 인서트
		@PostMapping("/add_weather")
		public String addWeather(
				@RequestParam("date") @DateTimeFormat(pattern = "yyyy-MM-dd") Date date,
				@RequestParam("weather") String weather,
				@RequestParam("microDust") String microDust,
				@RequestParam("temperatures") double temperatures,
				@RequestParam("precipitation") double precipitation,
				@RequestParam("windSpeed") double windSpeed) {
			
			weatherHistoryBO.addWeatherHistory(date, weather, microDust, temperatures, precipitation, windSpeed);
			
			return "redirect:/weather/weather_history_view";	// 새 request 수행
		}
}
