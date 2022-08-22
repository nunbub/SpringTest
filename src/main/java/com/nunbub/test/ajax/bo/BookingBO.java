package com.nunbub.test.ajax.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nunbub.test.ajax.dao.BookingDAO;
import com.nunbub.test.ajax.model.Booking;

@Service
public class BookingBO {

	@Autowired
	private BookingDAO bookingDAO;
	
	public List<Booking> getBookingList(){
		
		return bookingDAO.selectBookingList();
	}
}
