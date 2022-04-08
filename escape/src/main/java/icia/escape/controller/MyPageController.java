package icia.escape.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import icia.escape.beans.Camping;
import icia.escape.beans.Goods;
import icia.escape.beans.Members;
import icia.escape.beans.Stores;
import icia.escape.mypage.Cart;
import icia.escape.rental.FishGoods;
import icia.escape.rental.RentalStores;


@RestController
public class MyPageController {
	
	@Autowired
	RentalStores rs;
	@Autowired
	FishGoods fg;
	@Autowired
	Cart ca;
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	
	
	/*******************장바구니***********************/
	/*장바구니에 insert*/
	@PostMapping(value= "/InsCart", produces="application/json; charset=UTF-8")
	   public Goods insCart(Model model, @RequestBody List<Goods> go) { 
		 System.out.println(go);
		 ca.backController("C1", model.addAttribute("cart",go));
		return (Goods)model.getAttribute("mmInfo");
		
	   }
	/*장바구니 정보 불러오기*/
	@PostMapping(value= "/GetCartInfo", produces="application/json; charset=UTF-8")
	   public List<Goods> getCartInfo(Model model, @RequestBody List<Goods> go) {
		
		 ca.backController("C2", model.addAttribute("mmInfo",go.get(0)));
		return (List<Goods>) model.getAttribute("cartInfo");
		
	   }
	
	/*장바구니 정보 불러오기*/
	@PostMapping("/UpdCartInfo")
	   public ModelAndView getCartInfo(@ModelAttribute Goods go) {
	
		return ca.backController1("C3", go);
		
	   }
	/*장바구니 정보 불러오기*/
	@PostMapping("/DelCart")
	   public ModelAndView delCart(@ModelAttribute Goods go) {
		System.out.println(go);
		return ca.backController1("C4", go);
		
	   }
}

