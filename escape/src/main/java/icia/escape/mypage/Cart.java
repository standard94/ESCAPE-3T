package icia.escape.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import icia.escape.beans.Goods;
import icia.escape.beans.Members;
import icia.escape.beans.Stores;
import icia.escape.db.RentalMapper;
import icia.escape.utils.ProjectUtils;

@Service
public class Cart {
	private ModelAndView mav;
	@Autowired
	private DataSourceTransactionManager dtm;
	@Autowired
	private ProjectUtils pu;
	private DefaultTransactionDefinition dtmdf;
	private TransactionStatus dtmStatus;
	@Autowired
	private RentalMapper rm;
	
	public Cart() {
		mav = new ModelAndView();
	}
	
	public ModelAndView backController(String serviceCode, Model model) {
		if(model == null) {

		}else {
			switch(serviceCode) {
			case "C1":
				 insCart(model);
				break;
			case "C2":
				 getCartInfo(model);
				break;
			
			}
		}return mav;
	}
	
	public ModelAndView backController1(String serviceCode, Goods... go) {
		if (go.length == 0) {
			

		} else {
			switch(serviceCode) {
			case "C3":
				updCartInfo(go[0]);
				break;
			case "C4":
				delCart(go[0]);
				break;
		}
		}
		return mav;
	}
	/*장바구니 정보 삭제하기*/
	private void delCart(Goods go) {
		boolean check = false;
		String page = "cart_member";
		//Transaction
		this.setTransactionConf(TransactionDefinition.PROPAGATION_REQUIRED,TransactionDefinition.ISOLATION_READ_COMMITTED, false);
		
		if(this.convertToBoolean(this.rm.delCart(go))) {
			check = true;
			page = "cart_member";
		}
		try {
			go.setStCode("1111");
			if(((Goods)pu.getAttribute("accessInfo")) != null) {
				this.mav.addObject("sessionInfo", this.rm.getMemberAccessInfo(go));
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//Transaction End
		this.setTransactionEnd(check);
		
		this.mav.setViewName(page);
	}
	/*장바구니 정보 업데이트 하기*/
	private void updCartInfo(Goods go) {
		boolean check = false;
		String page = "cart_member";
		//Transaction
		this.setTransactionConf(TransactionDefinition.PROPAGATION_REQUIRED,TransactionDefinition.ISOLATION_READ_COMMITTED, false);
		
		if(this.convertToBoolean(this.rm.updCartInfo(go))) {
			check = true;
			page = "cart_member";
			
		}
		try {
			go.setStCode("1111");
			if(((Goods)pu.getAttribute("accessInfo")) != null) {
				this.mav.addObject("sessionInfo", this.rm.getMemberAccessInfo(go));
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//Transaction End
		this.setTransactionEnd(check);
		
		this.mav.setViewName(page);
		
	}
	/*장바구니 정보 가져오기*/
	private void getCartInfo(Model model) {
		model.addAttribute("cartInfo", rm.getCartInfo((Goods)model.getAttribute("mmInfo")));
	}
	
	/*장바구니 insert*/
	@SuppressWarnings("unchecked")
	private void insCart(Model model) {
		String ctCode;
		int i = 1;
		boolean check = false;
		//Transaction
		this.setTransactionConf(TransactionDefinition.PROPAGATION_REQUIRED,TransactionDefinition.ISOLATION_READ_COMMITTED, false);
		
	   int x = 0;
	  
	   //가져온 record만큼 while문 실행
		while( x < ((List<Goods>)model.getAttribute("cart")).size()) {
			
			
			
			//가져온 mmId로 mmCode 출력
			((List<Goods>)model.getAttribute("cart")).get(x).setMmCode((rm.getMemberCode(((List<Goods>)model.getAttribute("cart")).get(x))));
			
			
			
			//while문 돌아갈때 max의 ctCode에 + 1해주기
			if((ctCode = this.rm.getMaxCtCode((List<Goods>)model.getAttribute("cart"))) != null) {
			
				String codeNumber = Integer.toString((Integer.parseInt(ctCode.substring(2, 4)) + i));
				
				if(codeNumber.length() ==1) {
					ctCode = "C" + "00"+ codeNumber;
				}else if(codeNumber.length() ==2) {
					ctCode = "C" + "0"+ codeNumber;
				}else {
					ctCode = "C" +  codeNumber;
				}
				//ctCode 저장
				((List<Goods>)model.getAttribute("cart")).get(x).setCtCode(ctCode);
				
			}
			if(((List<Goods>)model.getAttribute("cart"))!=null) {
				
				if(this.convertToBoolean(this.rm.insCart(((List<Goods>)model.getAttribute("cart")).get(x)))){
					check=true;
					x++;
					
				}
			}
			
		}
		((List<Goods>)model.getAttribute("cart")).get(0).setStCode("1111");
		model.addAttribute("mmInfo", ((List<Goods>)model.getAttribute("cart")).get(0));
		System.out.println(model.getAttribute("mmInfo"));
		//Transaction End
		this.setTransactionEnd(check);
		
		
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
