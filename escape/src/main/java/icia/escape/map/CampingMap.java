package icia.escape.map;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import icia.escape.beans.Camping;
import icia.escape.beans.Maps;
import icia.escape.beans.Members;
import icia.escape.db.MapMapper;
import icia.escape.utils.Encryption;
import icia.escape.utils.ProjectUtils;

@Component
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


	/*Model을 이용*/
	public ModelAndView  backController(String serviceCode, Model model) {
		
		switch(serviceCode) {
		case "C0":
			getCampingList(model);
			break;	
		case "C1":
			getCampingPage(model);
			break;	
		case "C2":
			chooseCampingList(model);
			break;		
			
		}
		return mav;
	}
	
	public void chooseCampingList(Model model) {
		model.addAttribute("campingList",this.mm.getCampingRecord((Camping)model.getAttribute("camping")));
	}
	/*캠핑장 페이지 개수 불러오기*/
	public void getCampingPage(Model model) {
		/* 시작 페이지 */
	    int startPage; 
	    /* 끝 페이지 */
	    int endPage;
	    /* 이전 페이지, 다음 페이지 존재유무 */
	    boolean prev, next;
	    
	    /*전체 게시물 수*/
	    int total = this.mm.countCampingList((Camping)model.getAttribute("camping"));
	    
	    
		/* 마지막 페이지 */
        endPage = (int)(Math.ceil(((Camping)model.getAttribute("camping")).getPageNumber()/10.0))*10;
        
        /* 시작 페이지 */
        startPage = endPage - 9;
        
        /* 전체 마지막 페이지 */
        int realEnd = (int)(Math.ceil(total * 1.0/((Camping)model.getAttribute("camping")).getAmount()));
        
        /* 전체 마지막 페이지(realend)가 화면에 보이는 마지막페이지(endPage)보다 작은 경우, 보이는 페이지(endPage) 값 조정 */
        if(realEnd < endPage) {
        	endPage = realEnd;
        }
        
        /* 시작 페이지(startPage)값이 1보다 큰 경우 true */
        prev = startPage > 1;
        
        /* 마지막 페이지(endPage)값이 1보다 큰 경우 true */
        next = endPage < realEnd;
        ((Camping)model.getAttribute("camping")).setEndPage(endPage);
        ((Camping)model.getAttribute("camping")).setStartPage(startPage);
        ((Camping)model.getAttribute("camping")).setRealEnd(realEnd);
        ((Camping)model.getAttribute("camping")).setPrev(prev);
        ((Camping)model.getAttribute("camping")).setNext(next);
        model.addAttribute("campingPage", (Camping)model.getAttribute("camping"));
        
	}
	
	/*캠핑장 리스트 불러오기*/
	public void getCampingList(Model model) {
		model.addAttribute("campingList", mm.getCampingList((Camping)model.getAttribute("camping")));
	
	}
}
