package icia.escape.db;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import icia.escape.beans.Camping;
import icia.escape.beans.Fishing;
import icia.escape.beans.Maps;

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
}