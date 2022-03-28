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
import icia.escape.rental.FishGoods;
import icia.escape.rental.RentalStores;


@RestController
public class RentalController {
	
	@Autowired
	RentalStores rs;
	@Autowired
	FishGoods fg;
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
	      return(Goods)model.getAttribute("goodsPage");
	   }
	
	/*특정 상품 상세정보 불러오기*/
	@PostMapping("/GetThatStoreThatGoods")
	public ModelAndView getNewPage(@ModelAttribute Goods go) {
		return fg.backController1("R3", go);
	}
}
