package com.ict.shop.service.product;

import java.util.List;

import com.ict.shop.dao.vo.CartListVO;
import com.ict.shop.dao.vo.HeartVO;
import com.ict.shop.dao.vo.ProductVO;

public interface ShopProductService {

	List<ProductVO> getShopList(ProductVO pvo) throws Exception;

	List<ProductVO> getShopListbalm(ProductVO pvo);

	ProductVO getShopDetail(String product_idx) throws Exception;

	CartListVO getCartChk(String user_idx, String product_idx);

	int cartUpdate(CartListVO cvo);

	ProductVO productDetailInfo(String product_idx) throws Exception;

	List<ProductVO> productDetailList() throws Exception;

	int ProductAddCart(String product_idx, String user_idx, String product_price);

	int getProductDetailAddCart(ProductVO pvo) throws Exception;

	HeartVO getHeartChk(String product_idx, String user_idx);
}
