package com.ict.shop.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.shop.dao.vo.CartListVO;
import com.ict.shop.dao.vo.ProductVO;
import com.ict.shop.dao.vo.UserVO;

@Repository
public class OrderDAO {

	private static final Logger logger = LoggerFactory.getLogger(OrderDAO.class);

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//order===================================================================================================================
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
		
		public List<ProductVO> getProductList() {
			try {
				return sqlSessionTemplate.selectList("order.productlist");
			} catch (Exception e) {
				logger.info("list", e);
			}
			return null;
		}

		public List<UserVO> getUserList() {
			try {
				return sqlSessionTemplate.selectList("order.userlist");
			} catch (Exception e) {
				logger.info("list", e);
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
		
		
		
		public List<CartListVO> getCartList(String user_idx) {
			// TODO Auto-generated method stub
			return null;
		}

		public int getCartlistDelete(String cartlist_idx) {
			// TODO Auto-generated method stub
			return 0;
		}

	}

