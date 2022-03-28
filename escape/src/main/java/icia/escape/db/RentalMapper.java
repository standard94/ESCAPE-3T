package icia.escape.db;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import icia.escape.beans.Goods;
import icia.escape.beans.Stores;

@Mapper
public interface RentalMapper {
	/*************렌탈업체****************/
	/*렌탈업체 상세정보*/
	public List<Stores> getRentalStores(Stores sr);
	/*낚시 렌탈업체 리스트*/
	public int getFishingStoreListCount(Stores sr);
	public List<Stores> getFishingStoreList(Stores sr);
	
	/***********렌탈 장비***************/
	public int countGoodsList(Goods go);
	public int countStoreGoodsList(Goods go);
	public List<Goods>	getAllStoreGoods(Goods go);
	public List<Goods> getStoreGoods(Goods go);
	public List<Goods> getSameTypeGoods(Goods go);
	public Goods getThatStoreThatGoods(Goods go);
	public List<Goods> getThatStoreOtherGoods(Goods go);
}