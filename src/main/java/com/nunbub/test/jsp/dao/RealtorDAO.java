package com.nunbub.test.jsp.dao;

import org.springframework.stereotype.Repository;

import com.nunbub.test.jsp.model.Realtor;

@Repository
public interface RealtorDAO {
	
	public int insertRealtor(Realtor realtor);

}
