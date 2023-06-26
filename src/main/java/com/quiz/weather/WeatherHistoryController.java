package com.quiz.weather;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.weather.bo.WeatherBO;
import com.quiz.weather.domain.Weather;

@RequestMapping("/weather")
@Controller
public class WeatherHistoryController {

	@Autowired
	private WeatherBO weatherBO;
	
	@GetMapping("weather_history_view")
	public String weatherView() {
		return "weather/weatherHistory";
	}
	
	// 추가 화면
		@GetMapping("/add_weather_view")
		public String addWeatherView() {
			return "weather/addWeather";
		}
}
