package com.ict.shop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.shop.dao.vo.CartListVO;
import com.ict.shop.dao.vo.HeartVO;
import com.ict.shop.dao.vo.ProductVO;

@Repository
public class ProductDAO {

	private static final Logger logger = LoggerFactory.getLogger(ProductDAO.class);

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	// product========================================================================
	public List<ProductVO> getShopList(ProductVO pvo) {
		return sqlSessionTemplate.selectList("product.getShopList", pvo);
	}

	public ProductVO getShopDetail(String product_idx) {
		return sqlSessionTemplate.selectOne("product.getShopDetail", product_idx);
	}

	public CartListVO getCartChk(String user_idx, String product_idx) {
		Map<String, String> map = new HashMap<>();
		map.put("user_idx", user_idx);
		map.put("product_idx", product_idx);
		return sqlSessionTemplate.selectOne("product.getCartChk", map);
	}

	public int cartInsert(ProductVO productVO) {
		return sqlSessionTemplate.insert("product.cartInsert", productVO);
	}

	public int cartUpdate(ProductVO productVO) {
		return sqlSessionTemplate.update("product.cartUpdate", productVO);
	}

	public List<CartListVO> getCartList(String user_idx) {
		return sqlSessionTemplate.selectList("product.getCartList", user_idx);
	}

	public int cartEdit(CartListVO cartVO) {
		return sqlSessionTemplate.update("product.cartEdit", cartVO);
	}

	public int cartDelete(String cartlist_idx) {
		return sqlSessionTemplate.delete("product.cartDelete", cartlist_idx);
	}

	public int productInsert(ProductVO productVO) {
		return sqlSessionTemplate.insert("product.productInsert", productVO);
	}

	public int add_to_heart(String user_idx, String product_idx) {
		Map<String, String> map = new HashMap<>();
		map.put("user_idx", user_idx);
		map.put("product_idx", product_idx);
		return sqlSessionTemplate.insert("product.add_to_heart", map);
	}

	public int check_heart_item(String user_idx, String product_idx) {
		Map<String, String> map = new HashMap<>();
		map.put("user_idx", user_idx);
		map.put("product_idx", product_idx);
		return sqlSessionTemplate.selectOne("product.check_heart_item", map);
	}

	public List<HeartVO> get_heart_items(String user_idx) {
		return sqlSessionTemplate.selectList("product.get_heart_items", user_idx);
	}

	public int remove_from_heart(String user_idx, String product_idx) {
		Map<String, String> map = new HashMap<>();
		map.put("user_idx", user_idx);
		map.put("product_idx", product_idx);
		return sqlSessionTemplate.delete("product.remove_from_heart", map);
	}

	
	// product_detail
	public ProductVO productDetailInfo(String product_idx) {
		try {
			return sqlSessionTemplate.selectOne("product.detail_info", product_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	public List<ProductVO> productDetailList() {
		try {
			return sqlSessionTemplate.selectList("product.detail_list");
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	public int productDetailCart(String product_idx, String user_idx) {
		try {
			Map<String, String> map = new HashMap<>();
			map.put("user_idx", user_idx);
			map.put("product_idx", product_idx);
			return sqlSessionTemplate.insert("product.cart_go", map);
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}

	
	

	
}