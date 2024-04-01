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
import com.ict.shop.dao.vo.ProductVO;
import com.ict.shop.dao.vo.UserVO;

@Repository
public class MypageDAO {

	private static final Logger logger = LoggerFactory.getLogger(MypageDAO.class);

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

//mypage=========================================================================================================
	//mypage_addr
	public List<AddrVO> getAddrlist() {
		try {
			return sqlSessionTemplate.selectList("mypage.addrlist");
		} catch (Exception e) {
			logger.info("list", e);
		}
		return null;
	}
	
	public int getAddrInsert(AddrVO avo) {
		try {
			return sqlSessionTemplate.insert("mypage.addradd", avo);
		} catch (Exception e) {
			logger.info("insert", e);
		}
		return -1;
	}
	public AddrVO getAddrDetail(AddrVO avo) {
		try {
			return sqlSessionTemplate.selectOne("mypage.addrdetail", avo);
		} catch (Exception e) {
			logger.info("update", e);
		}
		return null;
	}
	
	public ProductVO getProductDetail(String pruduct_idx) {
		try {
			return sqlSessionTemplate.selectOne("mypage.productlist", pruduct_idx);
		} catch (Exception e) {
			System.out.println(e);
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
	public List<HeartVO> getShopHeartList() {
		try {
			return sqlSessionTemplate.selectList("mypage.heartlist");
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	// 주문 내역 리스트
	public List<OrderVO> getShopOrderList() {
		try {
			return sqlSessionTemplate.selectList("mypage.orderlist");
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

	public List<OrderVO> getOrderList(String order_idx, String product_idx) {
		try {
			Map<String, String> map = new HashMap<>();
			map.put("product_idx", product_idx);
			map.put("order_idx", order_idx);
			return sqlSessionTemplate.selectList("mypage.orderlist", map);
		} catch (Exception e) {
			logger.info("insert", e);
		}
		return null;
	}
	public int Mypage_Info_Change(String user_id) {
		try {
			return sqlSessionTemplate.update("mypage.Mypage_Info_Change",user_id);			
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


	

}

