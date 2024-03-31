package com.ict.shop.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.shop.dao.vo.AddrVO;
import com.ict.shop.dao.vo.ProductVO;
import com.ict.shop.dao.vo.UserVO;

@Repository
public class OrderDAO {

	private static final Logger logger = LoggerFactory.getLogger(OrderDAO.class);

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//order===================================================================================================================
		//order_pay
		public AddrVO getAddrDetail(AddrVO avo) {
			try {
				System.out.println(avo);
				return sqlSessionTemplate.selectOne("order.addrdetail", avo);
			} catch (Exception e) {
				logger.info("update", e);
			}
			return null;
		}
		
		public ProductVO getProductDetail(ProductVO pvo) {
			try {
				return sqlSessionTemplate.selectOne("order.paydetail", pvo);
			} catch (Exception e) {
				logger.info("update", e);
			}
			return null;
		}

		
	}

