package com.nunbub.test.ajax.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.nunbub.test.ajax.model.Booking;

@Repository
public interface BookingDAO {

	public List<Booking> selectBookingList();
}
