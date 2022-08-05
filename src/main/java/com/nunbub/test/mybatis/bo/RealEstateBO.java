package com.nunbub.test.mybatis.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nunbub.test.mybatis.dao.RealEstateDAO;
import com.nunbub.test.mybatis.model.RealEstate;

@Service
public class RealEstateBO {

	@Autowired
	private RealEstateDAO realEstateDAO;
	
	public RealEstate getRealEstate(int id) {
		RealEstate realEstate = realEstateDAO.selectRealEstate(id);
		return realEstate;
	}
	
	public List<RealEstate> getRealEstateAsRent(int rent) {
		List<RealEstate> realEstateList = realEstateDAO.selectRealEstateAsRent(rent);
		return realEstateList;
		
	}
	
	public List<RealEstate> getRealEstateAsAreaPrice(int area, int price){
		return realEstateDAO.selectRealEstateAsAreaPrice(area, price);
	}
	
	public int addRealEstateByObject(RealEstate realEstate) {
		
		return realEstateDAO.insertRealEstateByObject(realEstate);
		
	}
	
	public int addRealEstate(int) {
	
}
