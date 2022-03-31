package icia.escape.rental;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import icia.escape.beans.Camping;
import icia.escape.beans.Stores;
import icia.escape.db.AuthenticationMapper;
import icia.escape.db.RentalMapper;
import icia.escape.utils.Encryption;
import icia.escape.utils.ProjectUtils;

@Service
public class RentalStores {
	private ModelAndView mav;

	@Autowired
	private RentalMapper rm;
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

	public RentalStores() {
		mav = new ModelAndView();
	}

	public ModelAndView backController(String serviceCode, Model model) {
		if(model == null) {

		}else {
			switch(serviceCode) {
//			case "S0":
//				clickStoreInfo(model);
//				break;
			case "S1":
				getFishingStoreList(model);
				break;
			case "S2":
				getFishingStorePage(model);
				break;
			case "S4":
				findStoreInfo(model);
				break;
			}
		}return mav;
	}
	
	public ModelAndView backController(String serviceCode, Stores...sr) {
		if(sr[0]== null) {
			
		}else {
			switch(serviceCode) {
			case "S3":
				storeInfo(sr[0]);
			}
		}return mav;
	}
	
	/*렌탈업체 상세정보 가져오기*/
	public void findStoreInfo(Model model) {
		model.addAttribute("rentalStoreInfo", rm.chooseStoreInfo((Stores)model.getAttribute("rentalStore")));
	}
	
	
	/*렌탈업체 상세정보 페이지 이동*/
	public void storeInfo(Stores sr) {
	
		String page = "chooseStoreInfoPage";
		mav.setViewName(page);
	}
	
	
//	/*캠핑장 리스트 불러오기*/
//	public void clickStoreInfo(Model model) {
//		model.addAttribute("storeList", rm.getRentalStores((Stores)model.getAttribute("store")));
//	
//	}
	
	/*낚시*/
	public void getFishingStoreList(Model model) {
		model.addAttribute("fishingStoreList", rm.getFishingStoreList((Stores)model.getAttribute("fishingStore")));
	
	}
	
	/*낚시 렌탈업체 페이지 개수 불러오기*/
	   public void getFishingStorePage(Model model) {
	      /* 시작 페이지 */
	       int startPage; 
	       /* 끝 페이지 */
	       int endPage;
	       /* 이전 페이지, 다음 페이지 존재유무 */
	       boolean prev, next;
	       
	       /*전체 게시물 수*/
	       int total = this.rm.getFishingStoreListCount((Stores)model.getAttribute("FishingStorePage"));
	       
	       
	      /* 마지막 페이지 */
	        endPage = (int)(Math.ceil(((Stores)model.getAttribute("FishingStorePage")).getPageNumber()/10.0))*10;
	        
	        /* 시작 페이지 */
	        startPage = endPage - 9;
	        
	        /* 전체 마지막 페이지 */
	        int realEnd = (int)(Math.ceil(total * 1.0/((Stores)model.getAttribute("FishingStorePage")).getAmount()));
	        
	        /* 전체 마지막 페이지(realend)가 화면에 보이는 마지막페이지(endPage)보다 작은 경우, 보이는 페이지(endPage) 값 조정 */
	        if(realEnd < endPage) {
	           endPage = realEnd;
	        }
	        
	        /* 시작 페이지(startPage)값이 1보다 큰 경우 true */
	        prev = startPage > 1;
	        
	        /* 마지막 페이지(endPage)값이 1보다 큰 경우 true */
	        next = endPage < realEnd;
	        ((Stores)model.getAttribute("FishingStorePage")).setEndPage(endPage);
	        ((Stores)model.getAttribute("FishingStorePage")).setStartPage(startPage);
	        ((Stores)model.getAttribute("FishingStorePage")).setRealEnd(realEnd);
	        ((Stores)model.getAttribute("FishingStorePage")).setPrev(prev);
	        ((Stores)model.getAttribute("FishingStorePage")).setNext(next);
	        
	        model.addAttribute("FishingStorePage", (Stores)model.getAttribute("FishingStorePage"));
	        
	   }
	
}
