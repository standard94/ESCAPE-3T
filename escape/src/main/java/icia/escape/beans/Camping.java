package icia.escape.beans;

import lombok.Data;

@Data
public class Camping {
	private String cpMaMmCode;
	private String cpMaCfCode;
	private String cpCaCode;
	private String cpCode;
	private String cpHaCode;
	private String cpThCode;
	private String cpMaPost;
	private String cpName;
	private String cpNumber;
	private String cpContents;
	private String cpFacility;
	private String maAddress;
	private String cfCode;
	private String haName;
	private String thName;
	private String cpImage;
	private int rowNumber;
	private int pageNumber;
	private int amount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int realEnd;
}
