package icia.escape.controller;

import java.io.File;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import icia.escape.authentication.Login;
import icia.escape.beans.Members;
import icia.escape.beans.Stores;

@Controller
public class AuthenticationController {
	
	@Autowired
	Login log;
	
	private static final Logger logger = LoggerFactory.getLogger(AuthenticationController.class);
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView accessform() {
		return log.backController(0);
	}
	
	@PostMapping("/GetNewPage")
	public ModelAndView getNewPage(@ModelAttribute Members mem) {
		System.out.println("야야야");
		return log.backController(1, mem);
	}
	
	@PostMapping("/LogInMember")
	public ModelAndView logInMember(@ModelAttribute Members mem) {
		
		return log.backController(2, mem);
	}
	@PostMapping("/LogInStore")
	public ModelAndView logInStore(@ModelAttribute Stores sr) {
		return log.backController1(1, sr);
	}
//	@RequestMapping(value = "/Access", method = RequestMethod.POST)
//	public ModelAndView access(@ModelAttribute Employee emp) {
//		return auth.BackController(2, emp);
//	}
//	
//	@RequestMapping(value = "/Refresh", method = {RequestMethod.POST})
//	public ModelAndView accessRefresh(@ModelAttribute Employee emp) {
//		return auth.BackController(4, emp);
//	}
//
//	@RequestMapping(value = "/AccessOut", method = RequestMethod.GET
//			)
//	public ModelAndView accessOut(@ModelAttribute Employee emp) {
//		
//		return auth.BackController(3, emp);
//	}
//	
//	@RequestMapping(value = "/PasswordForm", method = {RequestMethod.GET})
//	public String passwordForm() {
//		return "password";
//	}
//	
//	@RequestMapping(value = "/uploadForm", method = {RequestMethod.GET})
//	public String uploadForm() {
//		return "upload";
//	}
//	
//	@PostMapping("/MultiPart2")
//	@ResponseBody
//	public String fileUpload(@RequestParam("files") MultipartFile[] uploadfiles, @ModelAttribute UploadFiles uf) {
//		
//		for(MultipartFile mf : uploadfiles) {
//			File saveFile = new File("D:\\", mf.getOriginalFilename());
//			try {
//				mf.transferTo(saveFile);
//			}catch(Exception e) {e.printStackTrace();}
//		}
//		return "upload";
//	}
//	
//	
//	@RequestMapping(value = "/FindPassword", method = {RequestMethod.POST})
//	public ModelAndView sendEmail(@ModelAttribute Employee emp) {
//		return auth.BackController(5, emp);
//	}
//	
//	@RequestMapping(value = "/Management", method = RequestMethod.POST
//			)
//	public ModelAndView accessMgm(@ModelAttribute Employee emp) {
//		return mgm.BackController(1, emp);
//	}
//	
//	@RequestMapping(value = "/EmailAuth", method = RequestMethod.GET
//			)
//	public ModelAndView emailAuth(@ModelAttribute Employee emp) {
//		return auth.BackController(6, emp);
//	}
//	
//	@RequestMapping(value = "/ModPassword", method = RequestMethod.POST
//			)
//	public ModelAndView modPassword(@ModelAttribute Employee emp) {
//		return auth.BackController(7, emp);
//	}
//	
//	@RequestMapping(value = "/Sales", method = RequestMethod.POST
//			)
//	public ModelAndView accessSales(@ModelAttribute Employee emp) {
//		return sls.BackController(0, emp);
//	}
	
}