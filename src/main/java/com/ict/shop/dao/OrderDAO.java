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

	
	//order===================================================================================================================
		//order_pay

		public OrderVO getAddrProductOrder(String order_idx) {
			return sqlSessionTemplate.selectOne("order.addrproductorder",order_idx);
		}


		public List<CartListVO> getCartList(String user_idx) {
			// TODO Auto-generated method stub
			return null;
		}
		

		
	}

