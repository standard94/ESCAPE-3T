package icia.escape.rental;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import icia.escape.beans.Camping;
import icia.escape.beans.Goods;
import icia.escape.beans.Members;
import icia.escape.db.AuthenticationMapper;
import icia.escape.db.RentalMapper;

@Service
public class FishGoods {
	private ModelAndView mav;
	@Autowired
	private DataSourceTransactionManager dtm;

	private DefaultTransactionDefinition dtmdf;
	private TransactionStatus dtmStatus;
	@Autowired
	private RentalMapper rm;
	@Autowired 
	private AuthenticationMapper am;
	public FishGoods() {
		mav = new ModelAndView();
	}
	
	public ModelAndView backController(String serviceCode, Model model) {
		if(model == null) {

		}else {
			switch(serviceCode) {
			case "R1":
				getAllStoreGoods(model);
				break;
			case "R2":
				getAllStorePage(model);
				break;
			case "R3":
				getThatStoreThatGoods(model);
				break;
			case "R4":
				getThatStoreOtherGoods(model);
				break;
			case "R5":
				 getStoreGoods(model);
				break;
			case "R6":
				 getStorePage(model);
				break;
			case "B0":
				storeList(model);
				break;
			}
		}return mav;
	}
	/*basic goodsList*/
	private void storeList(Model model) {
		model.addAttribute("basicGoodsList", this.rm.getThatStoreThatGoodsList((Goods)model.getAttribute("basicGoods")));
	
	}
	
	/*특정 업체의 모든 상품 불러오기*/
	private void getStoreGoods(Model model) {
		model.addAttribute("goodsInfo", this.rm.getStoreGoods((Goods)model.getAttribute("store")));
	}
	
	/*특정 업체의 모든 상품 페이지 개수 불러오기*/
	private void getStorePage(Model model) {
		/* 시작 페이지 */
	    int startPage; 
	    /* 끝 페이지 */
	    int endPage;
	    /* 이전 페이지, 다음 페이지 존재유무 */
	    boolean prev, next;
	    
	    /*전체 게시물 수*/
	    int total = this.rm.countStoreGoodsList((Goods)model.getAttribute("goods"));
	    
	    
		/* 마지막 페이지 */
        endPage = (int)(Math.ceil(((Goods)model.getAttribute("goods")).getPageNumber()/10.0))*10;
        
        /* 시작 페이지 */
        startPage = endPage - 9;
        
        /* 전체 마지막 페이지 */
        int realEnd = (int)(Math.ceil(total * 1.0/((Goods)model.getAttribute("goods")).getAmount()));
        
        /* 전체 마지막 페이지(realend)가 화면에 보이는 마지막페이지(endPage)보다 작은 경우, 보이는 페이지(endPage) 값 조정 */
        if(realEnd < endPage) {
        	endPage = realEnd;
        }
        
        /* 시작 페이지(startPage)값이 1보다 큰 경우 true */
        prev = startPage > 1;
        
        /* 마지막 페이지(endPage)값이 1보다 큰 경우 true */
        next = endPage < realEnd;
        ((Goods)model.getAttribute("goods")).setEndPage(endPage);
        ((Goods)model.getAttribute("goods")).setStartPage(startPage);
        ((Goods)model.getAttribute("goods")).setRealEnd(realEnd);
        ((Goods)model.getAttribute("goods")).setPrev(prev);
        ((Goods)model.getAttribute("goods")).setNext(next);
        
        model.addAttribute("goodsPage", (Goods)model.getAttribute("goods"));
	}
	
	/*특정 업체의 다른 상품 불러오기*/
	private void getThatStoreOtherGoods(Model model) {
		model.addAttribute("otherGoods", this.rm.getThatStoreOtherGoods((Goods)model.getAttribute("goods")));
	}
	/*특정 업체의 특정 상품 불러오기*/
	private void getThatStoreThatGoods(Model model) {
		
	 if(this.rm.countGoods((Goods)model.getAttribute("goods")) != 0) {
		 model.addAttribute("goodsInfo", this.rm.getThatStoreThatGoods((Goods)model.getAttribute("goods")));
		 ((Goods)model.getAttribute("goodsInfo")).setBtnType(((Goods)model.getAttribute("goods")).getBtnType());
		
	 }
	}
	/*모든 업체의 분류,카테고리 별 상품 불러오기*/
	private void getAllStoreGoods(Model model) {
		model.addAttribute("goodsList", this.rm.getAllStoreGoods((Goods)model.getAttribute("goodsInfo")));
	}
	
	/*상품 페이지 개수 불러오기*/
	private void getAllStorePage(Model model) {
		/* 시작 페이지 */
	    int startPage; 
	    /* 끝 페이지 */
	    int endPage;
	    /* 이전 페이지, 다음 페이지 존재유무 */
	    boolean prev, next;
	    
	    /*전체 게시물 수*/
	    int total = this.rm.countGoodsList((Goods)model.getAttribute("goods"));
	    
	    
		/* 마지막 페이지 */
        endPage = (int)(Math.ceil(((Goods)model.getAttribute("goods")).getPageNumber()/10.0))*10;
        
        /* 시작 페이지 */
        startPage = endPage - 9;
        
        /* 전체 마지막 페이지 */
        int realEnd = (int)(Math.ceil(total * 1.0/((Goods)model.getAttribute("goods")).getAmount()));
        
        /* 전체 마지막 페이지(realend)가 화면에 보이는 마지막페이지(endPage)보다 작은 경우, 보이는 페이지(endPage) 값 조정 */
        if(realEnd < endPage) {
        	endPage = realEnd;
        }
        
        /* 시작 페이지(startPage)값이 1보다 큰 경우 true */
        prev = startPage > 1;
        
        /* 마지막 페이지(endPage)값이 1보다 큰 경우 true */
        next = endPage < realEnd;
        ((Goods)model.getAttribute("goods")).setEndPage(endPage);
        ((Goods)model.getAttribute("goods")).setStartPage(startPage);
        ((Goods)model.getAttribute("goods")).setRealEnd(realEnd);
        ((Goods)model.getAttribute("goods")).setPrev(prev);
        ((Goods)model.getAttribute("goods")).setNext(next);
        
        model.addAttribute("goodsPage", (Goods)model.getAttribute("goods"));
	}
	//Transaction PROPAGATION
		private void setTransactionConf(int propa, int iso, boolean isRead) {
			this.dtmdf = new DefaultTransactionDefinition();
			this.dtmdf.setPropagationBehavior(propa);
			this.dtmdf.setIsolationLevel(iso);
			this.dtmdf.setReadOnly(false);
			this.dtmStatus = this.dtm.getTransaction(dtmdf);
		}
		//Transaction End
		private void setTransactionEnd(boolean tran) {
			if(tran) this.dtm.commit(dtmStatus);
			else this.dtm.rollback(dtmStatus);
		}

		private boolean convertToBoolean(int value) {
			return (value > 0)? true : false;
		}
}
