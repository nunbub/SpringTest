package com.nunbub.test.ajax;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nunbub.test.ajax.bo.WebsiteBO;
import com.nunbub.test.ajax.model.Website;

@Controller
@RequestMapping("/ajax/website")
public class WebsiteController {
	
	@Autowired
	private WebsiteBO websiteBO;
	
	@GetMapping("/list")
	public String websiteList(Model model) {
		
		List<Website> websiteList = websiteBO.getWebsiteList();
		
		model.addAttribute("websiteList", websiteList);
		
		return "ajax/websiteList";
	}
	
	@GetMapping("/input")
	public String websiteInput() {
		
		return "ajax/websiteInput";
	}
	
	@PostMapping("/add")
	@ResponseBody
	public Map<String, String> addWebsite(
			@RequestParam("name") String name
			, @RequestParam("url") String url) {
		
		int count = websiteBO.addWebsite(name, url);
		
		Map<String, String> map = new HashMap<>();
		
		if(count == 1) {
			map.put("result", "success");
		}else {
			map.put("result", "fail");
		}
		
		return map;
		
	}
	
	@PostMapping("/is_duplicate")
	@ResponseBody
	public Map<String, Boolean> isDuplicate(@RequestParam("url") String url) {
		
		boolean isDuplicate = websiteBO.isDuplicateUrl(url);
		
		Map<String, Boolean> map = new HashMap<>();
		
		if(isDuplicate) {
			map.put("is_duplicate", true);
		}else {
			map.put("is_duplicate", false);
		}
		
		return map;
	}

}
