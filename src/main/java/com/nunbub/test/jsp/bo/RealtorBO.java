package com.nunbub.test.jsp.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nunbub.test.jsp.dao.RealtorDAO;
import com.nunbub.test.jsp.model.Realtor;

@Service
public class RealtorBO {
	
	@Autowired
	private RealtorDAO realtorDAO;

	public int addRealtor(Realtor realtor) {
		return realtorDAO.insertRealtor(realtor);
	}
	
}
