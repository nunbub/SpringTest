package com.nunbub.test.jstl.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nunbub.test.jstl.dao.WeatherHistoryDAO;
import com.nunbub.test.jstl.model.Weather;

@Service
public class WeatherHistoryBO {

	@Autowired
	private WeatherHistoryDAO weatherDAO;
	
	public List<Weather> getWeatherHistory() {
		
		return weatherDAO.selectWeatherHistory();
	}
	
	public int addWeather(
			Date date
			, String weather
			, double temperatures
			, double precipitation
			, String microDust
			, double windSpeed) {
		
		return weatherDAO.insertWeather(date, weather, temperatures, precipitation, microDust, windSpeed);
	}
	
}
