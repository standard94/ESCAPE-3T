package icia.escape.map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import icia.escape.beans.Maps;
import icia.escape.db.MapMapper;
import icia.escape.utils.Encryption;
import icia.escape.utils.ProjectUtils;

@Service
public class CampingMap {
	private ModelAndView mav;
	
	@Autowired
	private MapMapper mm;
	@Autowired
	private ProjectUtils pu;
	@Autowired
	private Encryption enc;
	@Autowired
	JavaMailSenderImpl javaMail;

	@Autowired
	private DataSourceTransactionManager dtm;

	private DefaultTransactionDefinition dtmdf;
	private TransactionStatus dtmStatus;
	
	public CampingMap() {
		mav = new ModelAndView();
	}
	
	public ModelAndView  backController(String serviceCode, Model model) {
		
		switch(serviceCode) {
		case "0":
			getCampingList(model);
			break;			
		}
		return mav;
	}
	public void getCampingList(Model model) {
		System.out.println(model.addAttribute("campingList", mm.getCampingList((Maps)model.getAttribute(""))));
		model.addAttribute("campingList", mm.getCampingList((Maps)model.getAttribute("")));
	}
}
