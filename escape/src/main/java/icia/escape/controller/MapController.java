package icia.escape.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import icia.escape.authentication.FindInformation;
import icia.escape.authentication.Login;
import icia.escape.beans.Camping;
import icia.escape.beans.Fishing;
import icia.escape.beans.Maps;
import icia.escape.map.CampingMap;
import icia.escape.map.FishingMap;

@RestController
public class MapController {
	

	@Autowired
	Login log;
	@Autowired
	CampingMap cm;
	@Autowired
	FindInformation fi;
	@Autowired
	FishingMap fsm;
	
	private static final Logger logger = LoggerFactory.getLogger(MapController.class);
	
	
	/*새로운 페이지 이동*/
	@PostMapping(value= "/GetCampingList", produces="application/json; charset=UTF-8")
	   public List<Camping> getCampingList(Model model, @RequestBody List<Camping> cp) {
	      cm.backController("C0", model.addAttribute("camping", cp.get(0)));
	      return (List<Camping>)model.getAttribute("campingList");
	   }
	
	/*캠핑장 페이지 개수*/
	@PostMapping(value="/GetCampingPage", produces="application/json; charset=UTF-8")
	public Camping getCampingPage(Model model, @RequestBody List<Camping> cp) {
		cm.backController("C1",model.addAttribute("camping", cp.get(0)));
		return (Camping)model.getAttribute("campingPage");
		
	}
	
	/*캠핑장 페이지 개수*/
	@PostMapping(value="/ChooseCampingList", produces="application/json; charset=UTF-8")
	public List<Camping> chooseCampingList(Model model, @RequestBody List<Camping> cp) {
		cm.backController("C2",model.addAttribute("camping", cp.get(0)));
		return (List<Camping>)model.getAttribute("campingList");
		
	}
	
	/*새로운 페이지 이동*/
	@PostMapping(value= "/findCampingDetail", produces="application/json; charset=UTF-8")
	   public List<Camping> findCampingList(Model model, @RequestBody List<Camping> cp) {
	      cm.backController("C3", model.addAttribute("camping", cp.get(0)));     
	      return (List<Camping>)model.getAttribute("campingList");
	   }
	
	
	/*낚시터 정보 등록*/
	@PostMapping(value="/InsFishing", produces="application/json; charset=UTF-8")
	public Fishing insFishing(Model model, @RequestBody List<Fishing> fs) {
		 fsm.backController("F1",model.addAttribute("fishing", fs.get(0)));
		 System.out.println((Fishing)model.getAttribute("fishingList"));
		return (Fishing)model.getAttribute("fishingList");
	}
	
}
