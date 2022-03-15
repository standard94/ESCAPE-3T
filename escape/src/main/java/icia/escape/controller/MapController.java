package icia.escape.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import icia.escape.authentication.FindInformation;
import icia.escape.authentication.Login;
import icia.escape.beans.Maps;
import icia.escape.beans.Members;
import icia.escape.beans.Stores;
import icia.escape.map.CampingMap;

@RestController
public class MapController {
	

	@Autowired
	Login log;
	@Autowired
	CampingMap cm;
	@Autowired
	FindInformation fi;
	
	private static final Logger logger = LoggerFactory.getLogger(MapController.class);
	
	
	/*새로운 페이지 이동*/
	@PostMapping(value= "/GetCampingList", produces="application/json; charset=UTF-8")
	public List<Maps> getCampingList(Model model, @RequestBody List<Maps> map) {
		cm.backController("0", model.addAttribute("map", ""));
		return (List<Maps>)model.getAttribute("campingList");
	}
	
}
