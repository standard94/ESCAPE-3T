package icia.escape.beans;

import lombok.Data;

@Data

public class Goods {
	private String srCode;
	private String mmId;
	private String mmCode;
	private String srName;
	private String cfCode;
	private String caCode;
	private String ctCode;
	private String goCode;
	private String goName;
	private String month;
	private String stCode;
	private String day;
	private int discount;
	private String rentPrice;
	private String image;
	private String contents;
	private int pageNumber;
	private int amount;
    private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int realEnd;
	private String notice;
	private String btnType;
	private int qty;
	private String rentDay;
	private String publicIp;
	private String modQty;
}
