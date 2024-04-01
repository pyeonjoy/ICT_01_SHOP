package com.ict.shop.dao.vo;

public class OrderVO { 
private String order_idx, user_idx, product_idx, addr_idx, order_number, order_request, order_regdate;
private String addr_name, addr_phone, addr_addr,product_name,product_price,product_content,product_detail,product_img;

public String getAddr_name() {
	return addr_name;
}

public void setAddr_name(String addr_name) {
	this.addr_name = addr_name;
}

public String getAddr_phone() {
	return addr_phone;
}

public void setAddr_phone(String addr_phone) {
	this.addr_phone = addr_phone;
}

public String getAddr_addr() {
	return addr_addr;
}

public void setAddr_addr(String addr_addr) {
	this.addr_addr = addr_addr;
}

public String getProduct_name() {
	return product_name;
}

public void setProduct_name(String product_name) {
	this.product_name = product_name;
}

public String getProduct_price() {
	return product_price;
}

public void setProduct_price(String product_price) {
	this.product_price = product_price;
}

public String getProduct_content() {
	return product_content;
}

public void setProduct_content(String product_content) {
	this.product_content = product_content;
}

public String getProduct_detail() {
	return product_detail;
}

public void setProduct_detail(String product_detail) {
	this.product_detail = product_detail;
}

public String getProduct_img() {
	return product_img;
}

public void setProduct_img(String product_img) {
	this.product_img = product_img;
}

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
