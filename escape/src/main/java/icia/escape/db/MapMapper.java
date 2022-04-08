package icia.escape.db;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import icia.escape.beans.Camping;
import icia.escape.beans.Fishing;
import icia.escape.beans.Maps;
import icia.escape.beans.Stores;

@Mapper
public interface MapMapper {


	/*지도 :: 캠핑리스트 불러오기*/
	public List<Camping> getCampingList(Camping cp);
	public List<Camping> getCampingRecord(Camping cp);
	public List<Camping>findCampingDetail(Camping cp);
	public int countCampingList(Camping cp);
	
	/*Fishing*/
	public int insFishing(Fishing fs);
	public String checkFishingCode(Fishing fs);
	public int insMap(Fishing fs);
	public List<Fishing> getFishingPoint(Fishing fs);
	public int countFishingPage(Fishing fs);
	public List<Fishing> getFishingLeft(Fishing fs);
	public List<Fishing> findFishingRight(Fishing fs);
	public List<Fishing> getFishingRecord(Fishing fs);
	public Fishing getMemberAccessInfo(Fishing fs);
	/*Store*/
	public List<Stores> getStoreList(Stores sr);
	public List<Stores> getStoreDetail(Stores sr);
	public int countStoreList(Stores sr);
	public List<Stores> getStoreRecord(Stores sr);
}