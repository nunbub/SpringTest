package com.nunbub.test.jsp.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.nunbub.test.jsp.model.Seller;

@Repository
public interface SellerDAO {

	public int insertSeller(
			@Param("nickname") String nickname
			, @Param("imageUrl") String imageUrl
			, @Param("temperature") double temperature);
	
	public Seller selectLastSeller();
}
