package com.nunbub.test.jsp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nunbub.test.jsp.bo.SellerBO;
import com.nunbub.test.jsp.model.Seller;

@Controller
@RequestMapping("/jsp/seller")
public class SellerController {

	@Autowired
	private SellerBO sellerBO;
	
	@PostMapping("/add")
	@ResponseBody
	public String addSeller(
			@RequestParam("nickname") String nickname
			, @RequestParam("imageUrl") String imageUrl
			, @RequestParam("temperature") double temperature) {
		
		int count = sellerBO.addSeller(nickname, imageUrl, temperature);
		
		return "삽입 결과 : " + count;
	}
	
	@GetMapping("/input")
	public String sellerInput() {
		return "jsp/sellerInput";
	}
	
	@GetMapping("/lastSeller")
	public String sellerInfo(Model model) {
		Seller seller = sellerBO.getLastSeller();
		
		model.addAttribute("seller", seller);
		
		return "jsp/sellerInfo";
	}
	
	@GetMapping("/info")
	public String sellerInfoById(
			@RequestParam(value="id", required=false) Integer id
			, Model model) {
		
		Seller seller = null;
		// id가 null일 경우 가장 최근 사용자 가져오기
		if(id == null) {
			seller = sellerBO.getLastSeller();
		}else {
			// null이 아닐경우 id 기반으로 조회
			seller = sellerBO.getSeller(id);
		}
		model.addAttribute("seller", seller);
		
		return "jsp/sellerInfo";
		
	}
	
}
