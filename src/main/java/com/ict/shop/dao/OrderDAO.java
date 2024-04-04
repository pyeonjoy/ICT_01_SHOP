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
import com.ict.shop.dao.vo.OrderVO;
import com.ict.shop.dao.vo.ProductVO;
import com.ict.shop.dao.vo.UserVO;
import com.ict.shop.dao.vo.CartListVO;

@Repository
public class OrderDAO {

	private static final Logger logger = LoggerFactory.getLogger(OrderDAO.class);

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	
	//order===================================================================================================================
	//order_pay
	public List<OrderVO> orderaddrproduct(String order_idx) {
		try {
//			Map<String, String> map = new HashMap<>();
//			map.put("user_idx", user_idx);
			return sqlSessionTemplate.selectList("order.orderaddrproduct",order_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;

	}
}
	
	
	
	
	
