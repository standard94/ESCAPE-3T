package icia.escape.db;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import icia.escape.beans.Stores;
import icia.escape.beans.Camping;
import icia.escape.beans.Maps;
import icia.escape.beans.Members;
import icia.escape.beans.Orders;
import icia.escape.beans.OrderDetail;

@Mapper
public interface AuthenticationMapper {
	/*Members*/
	public Members isMember(Members mem);
	public int isAccess(Members mem);
	public int insMembersAccessHistory(Members mem);
	public Members getMemberAccessInfo(Members mem);
	public Members getMemberInfo(Members mem);
	public int checkMemberId(Members mem);
	public int insMember(Members mem);
	public String checkMemberCode(Members mem);
	public String findMemberId(Members mem);
	public String checkMember(Members mem);
	public int updMmPassword(Members mem);
	
	/*Stores*/
	public Stores isStores(Stores sr);
	public int isStoresAccess(Stores sr);
	public int insStoresAccessHistory(Stores sr);
	public Stores getStoreAccessInfo(Stores sr);
	public Stores getStoreInfo(Stores sr);
	public int checkStoreId(Stores sr);
	public int insStore(Stores sr);
	public String checkStoreCode(Stores sr);
	public String findStoreId(Stores sr);
	public String checkStore(Stores sr);
	public int updSrPassword(Stores sr);
	
	
	}
