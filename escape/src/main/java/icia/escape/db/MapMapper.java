package icia.escape.db;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import icia.escape.beans.Maps;

@Mapper
public interface MapMapper {

	/* 임시 */
	public List<Maps> getCampingList(Maps map);
	
}