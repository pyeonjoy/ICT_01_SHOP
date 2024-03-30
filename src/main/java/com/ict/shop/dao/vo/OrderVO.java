package com.ict.shop.dao.vo;

public class OrderVO { 
private String order_idx, user_idx, product_idx, addr_idx, order_number, order_request, order_regdate;

public String getUser_idx() {
	return user_idx;
}

public String getOrder_idx() {
	return order_idx;
}

public void setOrder_idx(String order_idx) {
	this.order_idx = order_idx;
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

public String getAddr_idx() {
	return addr_idx;
}

public void setAddr_idx(String addr_idx) {
	this.addr_idx = addr_idx;
}

public String getOrder_number() {
	return order_number;
}

public void setOrder_number(String order_number) {
	this.order_number = order_number;
}

public String getOrder_request() {
	return order_request;
}

public void setOrder_request(String order_request) {
	this.order_request = order_request;
}

public String getOrder_regdate() {
	return order_regdate;
}

public void setOrder_regdate(String order_regdate) {
	this.order_regdate = order_regdate;
}
}
