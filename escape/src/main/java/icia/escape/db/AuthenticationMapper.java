package icia.escape.db;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Select;

import icia.escape.beans.Stores;
import icia.escape.beans.Camping;
import icia.escape.beans.Members;
import icia.escape.beans.Orders;
import icia.escape.beans.OrderDetail;

public interface AuthenticationMapper {
	public Members isMember(Members mem);
	public int isAccess(Members mem);
	public int insMembersAccessHistory(Members mem);
	public Members getMemberAccessInfo(Members mem);
	public Stores isStores(Stores sr);
	public int isStoresAccess(Stores sr);
	public int insStoresAccessHistory(Stores sr);
	}
