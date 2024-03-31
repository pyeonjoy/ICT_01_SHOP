package com.ict.shop.dao.vo;

public class CartListVO {
	private String cartlist_idx, user_idx, product_idx, cartlist_number, cartlist_count;
	
	private String product_name, product_price, product_img;
	
	

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_img() {
		return product_img;
	}

	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}

	public String getCartlist_idx() {
		return cartlist_idx;
	}

	public void setCartlist_idx(String cartlist_idx) {
		this.cartlist_idx = cartlist_idx;
	}

	public String getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(String user_idx) {
		this.user_idx = user_idx;
	}

	public String getProduct_idx() {
		return product_idx;
	}

	public void setProduct_idx(String product_idx) {
		this.product_idx = product_idx;
	}

	public String getProduct_price() {
		return product_price;
	}

	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}

	public String getCartlist_number() {
		return cartlist_number;
	}

	public void setCartlist_number(String cartlist_number) {
		this.cartlist_number = cartlist_number;
	}

	public String getCartlist_count() {
		return cartlist_count;
	}

	public void setCartlist_count(String cartlist_count) {
		this.cartlist_count = cartlist_count;
	}

	
	
}
