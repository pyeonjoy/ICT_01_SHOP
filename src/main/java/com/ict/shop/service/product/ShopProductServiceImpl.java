package com.ict.shop.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.shop.dao.ProductDAO;
import com.ict.shop.dao.vo.CartListVO;
import com.ict.shop.dao.vo.HeartVO;
import com.ict.shop.dao.vo.ProductVO;

@Service
public class ShopProductServiceImpl implements ShopProductService {
	@Autowired
	private ProductDAO pdao;

	@Override
	public List<ProductVO> productDetailList() throws Exception {
		return pdao.productDetailList();
	}

	@Override
	public ProductVO productDetailInfo(String product_idx) throws Exception {
		return pdao.productDetailInfo(product_idx);
	}

	@Override
	public int getProductDetailAddCart(ProductVO pvo) throws Exception {
		return pdao.getProductDetailAddCart(pvo);
	}

	@Override
	public List<ProductVO> getShopList(ProductVO pvo) throws Exception {
		return pdao.getShopList(pvo);
	}

	@Override
	public ProductVO getShopDetail(String product_idx) throws Exception {
		return pdao.getShopDetail(product_idx);
	}

	@Override
	public CartListVO getCartChk(String user_idx, String product_idx) {
		return pdao.getCartChk(user_idx, product_idx);
	}

	@Override
	public int cartUpdate(CartListVO cvo) {
		return pdao.cartUpdate(cvo);
	}

	@Override
	public List<ProductVO> getShopListbalm(ProductVO pvo) {
		return pdao.getShopListbalm(pvo);
	}

	@Override
	public int ProductAddCart(String product_idx, String user_idx, String product_price) {
		return pdao.ProductAddCart(product_idx, user_idx, product_price);
	}

	@Override
	public HeartVO getHeartChk(String product_idx, String user_idx) {
		return pdao.getHeartChk(product_idx, user_idx);
	}

}
