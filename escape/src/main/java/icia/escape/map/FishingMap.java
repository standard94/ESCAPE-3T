package icia.escape.map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import icia.escape.beans.Fishing;

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

	}

	public ModelAndView backController(String serviceCode, Model model) {
		if(model == null) {

		}else {
			switch(serviceCode) {

			case "F1":
				insFishing(model);
				break;

			}
		}return mav;
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




		//Transation End
		this.setTransationEnd(check);

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
