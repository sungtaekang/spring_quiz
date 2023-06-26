package com.quiz.weather.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.weather.dao.WeatherMapper;
import com.quiz.weather.domain.Weather;

@Service
public class WeatherBO {

	@Autowired
	private WeatherMapper weatherMapper;
	
	public void addWeather(Weather weather) {
		weatherMapper.insertWeather(weather);
	}
}
