package com.nunbub.test.lifecycle;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.nunbub.test.lifecycle.movie.Movie;

@RestController
@RequestMapping("/lifecycle/test02")
public class Test02RestController {

	@RequestMapping("/1")
	public Movie objectResponse() {
		Movie movie = new Movie();
		
		List<String> movieList = new ArrayList<>();
		
		
		movie.setRate(15);
		movie.setDirector("봉준호");
		movie.setTime(131);
		movie.setTitle("기생충");
		
		movie.setRate(0);
		movie.setDirector("로베르토 베니니");
		movie.setTime(116);
		movie.setTitle("인생은 아름다워");
		
		return movie;
	}
}
