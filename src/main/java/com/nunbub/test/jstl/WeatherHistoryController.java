package com.nunbub.test.jstl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nunbub.test.jstl.bo.WeatherHistoryBO;
import com.nunbub.test.jstl.model.Weather;

@Controller
@RequestMapping("/jstl/weather")
public class WeatherHistoryController {

	@Autowired
	private WeatherHistoryBO weatherBO;
	
	@GetMapping("/list")
	public String weatherHistory(Model model) {
		
		List<Weather> weatherHistory = weatherBO.getWeatherHistory();
		
		model.addAttribute("weatherHistory", weatherHistory);
		
		return "jstl/weather/list";
	}
	
	@GetMapping("/input")
	public String weatherInput() {
		return "jstl/weather/input";
	}
	
	@GetMapping("/add")
	public String addWeather(
			@DateTimeFormat(pattern="yyyy년 MM월 dd일")
			@RequestParam("date") Date date
			, @RequestParam("weather") String weather
			, @RequestParam("temperatures") double temperatures
			, @RequestParam("precipitation") double precipitation
			, @RequestParam("microDust") String microDust
			, @RequestParam("windSpeed") double windSpeed) {
		
		int count = weatherBO.addWeather(date, weather, temperatures, precipitation, microDust, windSpeed);
		
		return "redirect:/jstl/weather/list";
		
	}
}
