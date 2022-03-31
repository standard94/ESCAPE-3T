package icia.escape.beans;

import lombok.Data;

@Data

public class Stores {
	String srCode;
	String srId;
	String srPassword;
	String srName;
	String srPost;
	String srDetails;
	String srImage;
	String srNumber;
	String srEmail;
	String srCfCode;
	String publicIp;
	String stCode;
	String srAddress;
	String authCode;
	String pageName;
    
	String haName;
	int rowNumber;
	int pageNumber;
	int amount;
	int startPage;
	int endPage;
	boolean prev;
	boolean next;
	int realEnd;
}
