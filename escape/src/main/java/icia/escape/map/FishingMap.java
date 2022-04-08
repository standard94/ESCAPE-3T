package icia.escape.map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import icia.escape.beans.Camping;
import icia.escape.beans.Fishing;
import icia.escape.beans.Goods;
import icia.escape.db.MapMapper;
import icia.escape.utils.ProjectUtils;

@Service
public class FishingMap {
	private ModelAndView mav;

	@Autowired
	private MapMapper mm;
	@Autowired
	private ProjectUtils pu;
	@Autowired
	private DataSourceTransactionManager dtm;
	private DefaultTransactionDefinition dtmdf;
	private TransactionStatus dtmStatus;


	public FishingMap() {
		this.mav = new ModelAndView();
	}

	public ModelAndView backController(String serviceCode, Model model) {
		if(model == null) {

		}else {
			switch(serviceCode) {
			case "F0":
				getFishingList(model);
				break;
			case "F1":
				insFishing(model);
				break;
			case "F2":
				getFishingPage(model);
				break;	
			case "F3":
				chooseFishingList(model);
				break;
			case "F4":
		         findFishingDetail(model);
		         break;
		         
			}
		}return mav;
	}
	public ModelAndView backController1(String serviceCode, Fishing... fi) {
		if(fi[0]== null) {

		}else {
			switch(serviceCode) {
			
			case "F5":
				insFishing1(fi[0]);
				break;
			
		         
			}
		}return mav;
	}
	/*낚시 리스트 불러오기*/
	public void getFishingList(Model model) {
		model.addAttribute("fishingPoints", mm.getFishingPoint((Fishing)model.getAttribute("fishingPoint")));
	}


	private void insFishing(Model model) {

		boolean check = false;
		String fpCode = "";
		int i = 1;
		this.setTransactionConf(TransactionDefinition.PROPAGATION_REQUIRED, TransactionDefinition.ISOLATION_READ_COMMITTED, false);


		if(this.convertToBoolean(mm.insMap((Fishing)model.getAttribute("fishing")))) {

			if((fpCode = this.mm.checkFishingCode((Fishing)model.getAttribute("fishing"))) != null) {

				String codeNumber = Integer.toString(Integer.parseInt(fpCode.substring(2, 4)) + i);
				if(codeNumber.length() == 1) {
					fpCode = "F" + "00" + codeNumber;
				}else if(codeNumber.length() == 2){
					fpCode = "F" + "0" + codeNumber;
				}else {
					fpCode = "F" + codeNumber;
				}
				
				((Fishing)model.getAttribute("fishing")).setFpCode(fpCode);

				if(this.convertToBoolean(this.mm.insFishing((Fishing)model.getAttribute("fishing")))) {
					check = true;

					this.mav.addObject("fishingList", (Fishing)model.getAttribute("fishing"));
					

				}

			}

		}
	}
		private void insFishing1(Fishing fi) {

			boolean check = false;
			String fpCode = "";
			int i = 1;
			this.setTransactionConf(TransactionDefinition.PROPAGATION_REQUIRED, TransactionDefinition.ISOLATION_READ_COMMITTED, false);


			if(this.convertToBoolean(mm.insMap(fi))) {

				if((fpCode = this.mm.checkFishingCode(fi)) != null) {

					String codeNumber = Integer.toString(Integer.parseInt(fpCode.substring(2, 4)) + i);
					if(codeNumber.length() == 1) {
						fpCode = "F" + "00" + codeNumber;
					}else if(codeNumber.length() == 2){
						fpCode = "F" + "0" + codeNumber;
					}else {
						fpCode = "F" + codeNumber;
					}
					
					fi.setFpCode(fpCode);

					if(this.convertToBoolean(this.mm.insFishing(fi))) {
						check = true;
						try {
							fi.setStCode("1111");
							if(((Fishing)pu.getAttribute("accessInfo")) != null) {
								this.mav.addObject("sessionInfo", this.mm.getMemberAccessInfo(fi));
								
							}
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
						
						

					}

				}

			}

		this.mav.setViewName("fishingMap_member");

		//Transation End
		this.setTransationEnd(check);

	}
	
	/*낚시포인트 페이지 개수 불러오기*/
	public void getFishingPage(Model model) {
		
		/* 시작 페이지 */
	    int startPage; 
	    /* 끝 페이지 */
	    int endPage;
	    /* 이전 페이지, 다음 페이지 존재유무 */
	    boolean prev, next;
	    
	    /*전체 게시물 수*/
	    int total = this.mm.countFishingPage((Fishing)model.getAttribute("fishingPage"));
	    
	    
		/* 마지막 페이지 */
        endPage = (int)(Math.ceil(((Fishing)model.getAttribute("fishingPage")).getPageNumber()/10.0))*10;
        
        /* 시작 페이지 */
        startPage = endPage - 9;
        
        /* 전체 마지막 페이지 */
        int realEnd = (int)(Math.ceil(total * 1.0/((Fishing)model.getAttribute("fishingPage")).getAmount()));
        
        /* 전체 마지막 페이지(realend)가 화면에 보이는 마지막페이지(endPage)보다 작은 경우, 보이는 페이지(endPage) 값 조정 */
        if(realEnd < endPage) {
        	endPage = realEnd;
        }
        
        /* 시작 페이지(startPage)값이 1보다 큰 경우 true */
        prev = startPage > 1;
        
        /* 마지막 페이지(endPage)값이 1보다 큰 경우 true */
        next = endPage < realEnd;
        ((Fishing)model.getAttribute("fishingPage")).setEndPage(endPage);
        ((Fishing)model.getAttribute("fishingPage")).setStartPage(startPage);
        ((Fishing)model.getAttribute("fishingPage")).setRealEnd(realEnd);
        ((Fishing)model.getAttribute("fishingPage")).setPrev(prev);
        ((Fishing)model.getAttribute("fishingPage")).setNext(next);
        model.addAttribute("fishingPages", (Fishing)model.getAttribute("fishingPage"));
        
	}
	
	/*낚시포인트 좌측 리스트 불러오기*/
	public void chooseFishingList(Model model) {
		model.addAttribute("fishingLefts",this.mm.getFishingLeft((Fishing)model.getAttribute("fishingLeft")));
}
	
	/*낚시포인트 상세정보 불러오기*/
	public void findFishingDetail(Model model) {
	      model.addAttribute("fishingRights",this.mm.findFishingRight((Fishing)model.getAttribute("fishingRight")));
	   }



	//Tranasaction PROPAGATION
	private void setTransactionConf(int propa, int iso, boolean isRead) {
		this.dtmdf = new DefaultTransactionDefinition();
		this.dtmdf.setPropagationBehavior(propa);
		this.dtmdf.setIsolationLevel(iso);
		this.dtmdf.setReadOnly(isRead);
		this.dtmStatus = this.dtm.getTransaction(dtmdf);
	}

	//Transaction End
	private void setTransationEnd(boolean tran) {
		if(tran) this.dtm.commit(dtmStatus);
		else this.dtm.rollback(dtmStatus);
	}

	private boolean convertToBoolean(int value) {
		return (value > 0)? true : false;
	}
}
