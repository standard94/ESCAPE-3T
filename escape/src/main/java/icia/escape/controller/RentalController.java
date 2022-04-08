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
public class RentalController {
	
	@Autowired
	RentalStores rs;
	@Autowired
	FishGoods fg;
	@Autowired
	Cart ca;
	private static final Logger logger = LoggerFactory.getLogger(RentalController.class);
	
	/****업체****/
	@PostMapping(value= "/ClickStoreInfo", produces="application/json; charset=UTF-8")
	   public List<Stores> Stores(Model model, @RequestBody List<Stores> sr) {
	      rs.backController("S0", model.addAttribute("store", sr.get(0)));
	      return (List<Stores>)model.getAttribute("storeList");
	   }
	
	@PostMapping(value= "/GetFishingStoreList", produces="application/json; charset=UTF-8")
	   public List<Stores> getFishingStoreList(Model model, @RequestBody List<Stores> sr) {
	      rs.backController("S1", model.addAttribute("fishingStore", sr.get(0)));
	      return (List<Stores>)model.getAttribute("fishingStoreList");
	   }
	
	/*업체 페이지 개수*/
	@PostMapping(value="/GetFishingStorePage", produces="application/json; charset=UTF-8")
	public Stores getCampingPage(Model model, @RequestBody List<Stores> sr) {
		rs.backController("S2",model.addAttribute("FishingStorePage", sr.get(0)));
		return (Stores)model.getAttribute("FishingStorePage");
		
	}
	
	/*특정 렌탈 업체 상세정보 페이지 이동 */
	@PostMapping("/StoreInfo")
	public ModelAndView storeInfo(@ModelAttribute Stores sr) {
		return rs.backController("S3", sr);
	}
	/*********************basic hot deal****************************/	
	/*모든 업체의 상품 리스트 */
	@PostMapping(value= "/StoreList" , produces="application/json; charset=UTF-8")
	   public List<Goods> storeList(Model model, @RequestBody List<Goods> go) {
	      fg.backController("B0", model.addAttribute("basicGoods", go.get(0)));
	      return (List<Goods>)model.getAttribute("basicGoodsList");
	   }
	/*******************렌탈 ***********************/
	
	/*모든 업체의 상품 리스트 */
	@PostMapping(value= "/GetAllStoresGoods" , produces="application/json; charset=UTF-8")
	   public List<Goods> getAllStoreGoods(Model model, @RequestBody List<Goods> go) {
	      fg.backController("R1", model.addAttribute("goodsInfo", go.get(0)));
	      return (List<Goods>)model.getAttribute("goodsList");
	   }
	
	/*모든 업체의 상품 페이지 수*/
	@PostMapping(value= "/GetAllStoresPage", produces="application/json; charset=UTF-8")
	   public Goods getAllStoresPage(Model model, @RequestBody List<Goods> go) {
	      fg.backController("R2", model.addAttribute("goods", go.get(0)));
	      return(Goods)model.getAttribute("goods");
	   }
	
	/*특정 상품 상세정보 불러오기*/
	@PostMapping(value= "/GetThatStoreThatGoods", produces="application/json; charset=UTF-8")
	   public Goods getThatStoreThatGoods(Model model, @RequestBody List<Goods> go) {
	      fg.backController("R3", model.addAttribute("goods", go.get(0)));
	      return(Goods)model.getAttribute("goodsInfo");
	   }
	/*특정 업체의 다른 상품 정보 불러오기*/
	@PostMapping(value= "/GetThatStoreOtherGoods", produces="application/json; charset=UTF-8")
	   public Goods getThatStoreOtherGoods(Model model, @RequestBody List<Goods> go) {
	      fg.backController("R4", model.addAttribute("goods", go.get(0)));
	      return(Goods)model.getAttribute("otherGoods");
	   }
	
	
	/*특정 업체의 상품들 불러오기*/
	@PostMapping(value= "/GetStoreGoods", produces="application/json; charset=UTF-8")
	   public Goods getStoreGoods(Model model, @RequestBody List<Goods> go) {
	      fg.backController("R5", model.addAttribute("store", go.get(0)));
	      return(Goods)model.getAttribute("goodsInfo");
	   }
	/*같은 카테고리의 상품 불러오기*/
	@PostMapping(value= "/GetStorePage1", produces="application/json; charset=UTF-8")
	   public Goods getStorePage(Model model, @RequestBody List<Goods> go) {
	      fg.backController("R6", model.addAttribute("goods", go.get(0)));
	      return(Goods)model.getAttribute("goodsPage");
	   }
	
	
}
