package com.nunbub.test.ajax.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nunbub.test.ajax.dao.WebsiteDAO;
import com.nunbub.test.ajax.model.Website;

@Service
public class WebsiteBO {

	@Autowired
	private WebsiteDAO websiteDAO;
	
	public List<Website> getWebsiteList(){
		
		return websiteDAO.selectWebsiteList();
		
	}
	
	public int addWebsite(String name, String url) {
		
		return websiteDAO.insertWebsite(name, url);
	}
}
