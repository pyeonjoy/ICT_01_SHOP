package com.ict.shop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.shop.dao.vo.CartListVO;
import com.ict.shop.dao.vo.HeartVO;
import com.ict.shop.dao.vo.ProductVO;

@Repository
public class ProductDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
  
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
	
	public int getProductDetailAddCart(ProductVO pvo) {
		try {
			return sqlSessionTemplate.insert("product.cart_go", pvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}
    
    // product========================================================================
    // 향수만 보이게
    public List<ProductVO> getShopList(ProductVO pvo) {
        return sqlSessionTemplate.selectList("product.getShopList", pvo);
    }
    // 비누만 보이게
    public List<ProductVO> getShopListbalm(ProductVO pvo) {
    	return sqlSessionTemplate.selectList("product.getShopListbalm",pvo);
    }
    // 상품 디테일 화면
    public ProductVO getShopDetail(String product_idx) {
        return sqlSessionTemplate.selectOne("product.getShopDetail", product_idx);
    }
    // 상품이 이미 장바구니에 담겨있나 확인
    public CartListVO getCartChk(String user_idx, String product_idx) {
        Map<String, String> map = new HashMap<>();
        map.put("user_idx", user_idx);
        map.put("product_idx", product_idx);
        return sqlSessionTemplate.selectOne("product.getCartChk", map);
    }
    // 장바구니에 이미 담겨있는거 +1 하기
    public int cartUpdate(CartListVO cvo) {
        return sqlSessionTemplate.update("product.cartUpdate", cvo);
    }
    // 장바구니에 상품 추가
	public int ProductAddCart(String product_idx, String user_idx, String product_price) {
		try {
			Map<String, String> map = new HashMap<String,String>();
			map.put("product_idx", product_idx);
			map.put("user_idx", user_idx);
			map.put("product_price", product_price);
			return sqlSessionTemplate.insert("product.add_cart",map);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
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
	public HeartVO getHeartChk(String product_idx, String user_idx) {
        Map<String, String> map = new HashMap<>();
        map.put("user_idx", user_idx);
        map.put("product_idx", product_idx);
        return sqlSessionTemplate.selectOne("product.getHeartChk", map);
	}

}