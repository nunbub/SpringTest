package com.nunbub.test.ajax.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.nunbub.test.ajax.model.Website;

@Repository
public interface WebsiteDAO {

	public List<Website> selectWebsiteList();
	
	public int insertWebsite(
			@Param("name") String name
			, @Param("url") String url);
	
	public int selectCountUrl(@Param("url") String url);
}
