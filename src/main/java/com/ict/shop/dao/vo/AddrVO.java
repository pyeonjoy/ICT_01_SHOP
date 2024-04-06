package com.ict.shop.dao.vo;

import org.springframework.web.multipart.MultipartFile;

public class AddrVO {
	private String addr_idx, user_idx, addr_name, addr_phone, addr_addr,addr_base;
	public String getAddr_base() {
		return addr_base;
	}

	public void setAddr_base(String addr_base) {
		this.addr_base = addr_base;
	}

	public String getAddr_idx() {
		return addr_idx;
	}

	public void setAddr_idx(String addr_idx) {
		this.addr_idx = addr_idx;
	}

	private MultipartFile file; 
	
	 public String getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(String user_idx) {
		this.user_idx = user_idx;
	}

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

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	 
}