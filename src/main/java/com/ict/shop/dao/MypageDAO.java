package com.ict.shop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.shop.dao.vo.AddrVO;
import com.ict.shop.dao.vo.HeartVO;
import com.ict.shop.dao.vo.OrderVO;
import com.ict.shop.dao.vo.UserVO;

@Repository
public class MypageDAO {

	private static final Logger logger = LoggerFactory.getLogger(MypageDAO.class);

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

//mypage=========================================================================================================
	
	//mypage_addr
	public List<OrderVO> getAddrlist(OrderVO ovo) {
		try {
			return sqlSessionTemplate.selectList("mypage.addrlist",ovo);
		} catch (Exception e) {
			logger.info("list", e);
		}
		return null;
	}
	public List<AddrVO> getMyAddrlist(String user_idx) {
		try {
			return sqlSessionTemplate.selectList("mypage.myaddrlist", user_idx);
		} catch (Exception e) {
			logger.info("list", e);
		}
		return null;
	}
	
	public int getAddrInsert(AddrVO avo) {
		try {
			return sqlSessionTemplate.insert("mypage.addrinsert", avo);
		} catch (Exception e) {
			logger.info("insert", e);
		}
		return -1;
	}
	public AddrVO getAddrDetail(AddrVO avo) {
		try {
			System.out.println("dao"+avo.getAddr_addr());
			return sqlSessionTemplate.selectOne("mypage.addrdetail", avo);
		} catch (Exception e) {
			logger.info("update", e);
		}
		return null;
	}
	
	
	public OrderVO getOrderDetail(String order_idx) {
		try {
			return sqlSessionTemplate.selectOne("mypage.orderlist", order_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	public UserVO getUser_id(String user_id) {
		return sqlSessionTemplate.selectOne("mypage.user_id",user_id);
	}

	// 관심상품 리스트
	public List<OrderVO> getShopHeartList(String user_idx) {
		try {
			return sqlSessionTemplate.selectList("mypage.heartlist",user_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	public int getRemoveHeart(String product_idx, String user_idx, String heart_idx) {
		try {
	        Map<String, String> params = new HashMap<>();
	        params.put("user_idx", user_idx);
	        params.put("product_idx", product_idx);
	        params.put("heart_idx", heart_idx);
	        return sqlSessionTemplate.update("mypage.MypageRemoveHeart", params);          
	    } catch (Exception e) {
	        System.out.println(e);
	    }
	    return -1;

	}
	
	public int getAddHeart(String product_idx, String user_idx) {
		try {
			Map<String, String> params = new HashMap<>();
			params.put("user_idx", user_idx);
			params.put("product_idx", product_idx);
			return sqlSessionTemplate.insert("mypage.MypageAddHeart", params);          
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
		
	}
	
	public int getCartListAdd(OrderVO ovo) {
		try {
			return sqlSessionTemplate.insert("mypage.cartlistadd", ovo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
		
	}

	// 주문 내역 리스트
	public int orderupdate2(String order_idx) {
		try {
			return sqlSessionTemplate.delete("mypage.orderupdate2",order_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	public int orderupdate3(String order_idx) {
		try {
			return sqlSessionTemplate.delete("mypage.orderupdate3",order_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	public int orderupdate4(String order_idx) {
		try {
			return sqlSessionTemplate.delete("mypage.orderupdate4",order_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	
	public List<OrderVO> getShopOrderList(String user_idx) {
		try {
			return sqlSessionTemplate.selectList("mypage.orderlist",user_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public UserVO firstchk(String user_id) {
		try {
			return sqlSessionTemplate.selectOne("mypage.firstchek", user_id);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public int getChangePwd(UserVO uvo) {
		try {
			return sqlSessionTemplate.insert("mypage.changepwd", uvo);
		} catch (Exception e) {
			logger.info("insert", e);
		}
		return -1;
	}

	public int getDeliveryStatus(List<OrderVO> ovo) {
		
		return sqlSessionTemplate.update("mypage.deliveryStatus", ovo);
	}
	
	public List<OrderVO> getOrderList(String user_idx) {
		try {
			Map<String, String> map = new HashMap<>();
			map.put("user_idx", user_idx);
			return sqlSessionTemplate.selectList("mypage.orderlist", map);
		} catch (Exception e) {
			logger.info("insert", e);
		}
		return null;
	}
	
	public List<OrderVO> getOrderList2(String user_idx) {
		try {
			Map<String, String> map = new HashMap<>();
			map.put("user_idx", user_idx);
			return sqlSessionTemplate.selectList("mypage.orderlist2", map);
		} catch (Exception e) {
			logger.info("insert", e);
		}
		return null;
	}
	public int Mypage_Info_Change(UserVO uvo) {
		try {
			return sqlSessionTemplate.update("mypage.Mypage_Info_Change",uvo);			
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	public int getAddrEdit(AddrVO avo) {
		try {
			return sqlSessionTemplate.update("mypage.addredit", avo);
		} catch (Exception e) {
			logger.info("insert", e);
		}
		return -1;
	}


	public UserVO getMypage_Info(String user_id) {
		try {
			return sqlSessionTemplate.selectOne("mypage.user_id",user_id);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public int getAddrDelete(String addr_idx) {
		try {
			return sqlSessionTemplate.delete("mypage.addrdelete",addr_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	

}

