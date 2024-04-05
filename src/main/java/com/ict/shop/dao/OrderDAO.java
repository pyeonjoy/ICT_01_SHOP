package com.ict.shop.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.shop.dao.vo.AddrVO;
import com.ict.shop.dao.vo.OrderVO;
import com.ict.shop.dao.vo.ProductVO;
import com.ict.shop.dao.vo.UserVO;
import com.ict.shop.dao.vo.CartListVO;

@Repository
public class OrderDAO {

	private static final Logger logger = LoggerFactory.getLogger(OrderDAO.class);

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	// order===================================================================================================================
	// cartlist
	public List<CartListVO> getCartList(String user_idx) {
		try {
			return sqlSessionTemplate.selectList("order.cartlist", user_idx);
		} catch (Exception e) {
			logger.info("cartlist", e);
		}
		return null;
	}

	public int getCartlistDelete(String cartlist_idx) {
		try {
			return sqlSessionTemplate.delete("order.cartlist_delete", cartlist_idx);
		} catch (Exception e) {
			logger.info("cartlistdelete", e);
		}
		return 0;
	}

	public int getCartlistEdit(CartListVO cvo) {
		try {
			return sqlSessionTemplate.update("order.cartlist_edit", cvo);
		} catch (Exception e) {
			logger.info("cartlistEdit", e);
		}
		return 0;
	}

	public List<OrderVO> getCartlistOrderIdx() {
		try {
			return sqlSessionTemplate.selectList("order.cartlist_order_list");
		} catch (Exception e) {
			logger.info("cartlistOrderIdx", e);
		}
		return null;
	}
	
	public int getCartlistPass(CartListVO cvo) {
		try {
			return sqlSessionTemplate.insert("order.cartlist_pass", cvo);
		} catch (Exception e) {
			logger.info("cartlistpass", e);
		}
		return 0;
	}

	public CartListVO getCartlistSelect(String cartlist_idx) {
		try {
			return sqlSessionTemplate.selectOne("order.cartlist_select",cartlist_idx);
		} catch (Exception e) {
			logger.info("cartlistOrderIdx", e);
		}
		return null;
	}

	// order_pay
	//order_pay
		public List<OrderVO> orderaddrproduct(String order_idx) {
			try {
//				Map<String, String> map = new HashMap<>();
//				map.put("user_idx", user_idx);
				return sqlSessionTemplate.selectList("order.orderaddrproduct",order_idx);
			} catch (Exception e) {
				System.out.println(e);
			}
			return null;
	
		}
}
