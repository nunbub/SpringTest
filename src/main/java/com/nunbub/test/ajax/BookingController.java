package com.nunbub.test.ajax;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nunbub.test.ajax.bo.BookingBO;
import com.nunbub.test.ajax.model.Booking;

@Controller
@RequestMapping("/ajax/booking")
public class BookingController {

	@Autowired
	private BookingBO bookingBO;
	
	@GetMapping("/homepage")
	public String bookingHomePage() {
		
		return "ajax/bookingPage";
	}
	
	@GetMapping("/list")
	public String bookingList(Model model) {
		
		List<Booking> bookingList = new ArrayList<>();
		
		model.addAttribute("bookingList", bookingList);
		
		return "ajax/bookingList";
	}
}
