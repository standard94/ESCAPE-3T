package icia.escape.db;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import icia.escape.beans.Camping;
import icia.escape.beans.Maps;

@Mapper
public interface MapMapper {

	/* 임시 */
	public List<Camping> getCampingList(Camping cp);
	public List<Camping> getCampingRecord(Camping cp);
	public int countCampingList(Camping cp);
	
}