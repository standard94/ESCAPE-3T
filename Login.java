package icia.escape.authentication;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.servlet.ModelAndView;

import icia.escape.beans.Members;
import icia.escape.beans.Stores;
import icia.escape.db.Mapping;
import icia.escape.utils.Encryption;
import icia.escape.utils.ProjectUtils;

@Service
public class Login {
	private ModelAndView mav;

	@Autowired
	private Mapping om;
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
	
	
	public Login() {
		mav = new ModelAndView();

	}

	public ModelAndView backController(int serviceCode, Members... mem) {

		if (mem.length == 0) {
			switch (serviceCode) {
			case 0:
				basicPage();
				break;
			}

		} else {
			switch(serviceCode) {
			case 1:
				getNewPage(mem[0]);
			}
		}
		return mav;
	}
    
	/*페이지 이동*/
	public void getNewPage(Members mem) {
		String page = mem.getPageName();
		this.mav.setViewName(page);
	}
	
	/*첫 메인화면*/
	private void basicPage() {
		this.mav.setViewName("basic");
	
	}


	private void accessOut(Stores emp) {
		String page = "redirect:/";
		this.mav.getModel().remove("msg");
		this.mav.getModel().remove("AccessInfo");

		/*
		 * DB Log-in :: myBatis 로그아웃 : AccessHistory - Insert - Commit --> isAccessCheck
		 * = true;
		 */

		try {

			emp.setStCode(-9);
//			emp.setPublicIp(enc.aesEncode(emp.getPublicIp(), emp.getSeCode() + ":" + emp.getEmName()));

			this.om.insAccessHistory(emp);
//		} catch (InvalidKeyException | UnsupportedEncodingException | NoSuchAlgorithmException | NoSuchPaddingException
//				| InvalidAlgorithmParameterException | IllegalBlockSizeException | BadPaddingException e) {
//			e.printStackTrace();
		} finally {
			try {
				pu.removeAttribute("AccessInfo");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		mav.setViewName(page);
	}

	public boolean convertToBool(int value) {
		return (value > 0) ? true : false;
	}
	
	private void setTransactionEND(boolean tran) {
		if(tran) this.dtm.commit(dtmStatus);
		else this.dtm.rollback(dtmStatus);
	}
	
	
	private void setTransactionConf(int propa, int iso, boolean isRead) {
		this.dtmdf = new DefaultTransactionDefinition();
		this.dtmdf.setPropagationBehavior(propa);
		this.dtmdf.setIsolationLevel(iso);
		this.dtmdf.setReadOnly(isRead);
		this.dtmStatus = this.dtm.getTransaction(dtmdf);
	}
}
