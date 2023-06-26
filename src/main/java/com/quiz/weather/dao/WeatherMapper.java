package com.quiz.weather.dao;

import org.springframework.stereotype.Repository;

import com.quiz.weather.domain.Weather;

@Repository
public interface WeatherMapper {

	public void insertWeather(Weather weather);
}
