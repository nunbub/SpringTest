package com.nunbub.test.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nunbub.test.mybatis.bo.RealEstateBO;
import com.nunbub.test.mybatis.model.RealEstate;

@Controller
@RequestMapping("/mybatis")
public class RealEstateController {

	@Autowired
	private RealEstateBO realEstateBO;
	
	@RequestMapping("/test01/1")
	@ResponseBody
	public RealEstate realEstate(@RequestParam("id") int id) {
		
		RealEstate realEstate = realEstateBO.getRealEstate(id);
		
		return realEstate;
	}
	
	@RequestMapping("/test01/2")
	@ResponseBody
	public List<RealEstate> getRealEstateAsRent(@RequestParam("rent") int rent) {
		
		List<RealEstate> realEstateList = realEstateBO.getRealEstateAsRent(rent);
	
		return realEstateList;
	}
	
	@RequestMapping("/test01/3")
	@ResponseBody
	public List<RealEstate> getRealEstateAsAreaPrice(
			@RequestParam("area") int area
			, @RequestParam("price") int price){
		List<RealEstate> realEstateList = realEstateBO.getRealEstateAsAreaPrice(area, price);
		
		return realEstateList;
		
	}
	
	@RequestMapping("/test02/1")
	@ResponseBody
	public String addRealEstate() {
		RealEstate realEstate = new RealEstate();
		realEstate.setRealtorId(3);
		realEstate.setAddress("푸르지용 리버 303동 1104호");
		realEstate.setArea(89);
		realEstate.setType("매매");
		realEstate.setPrice(100000);
		int count = realEstateBO.addRealEstateByObject(realEstate);
		
		return "입력 성공 : " + count;
		
	}
	
	@RequestMapping("/test02/2")
	public String addRealEstate() {
		
	}
	
}
