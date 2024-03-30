package com.ict.shop.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ProductDAO {

	private static final Logger logger = LoggerFactory.getLogger(ProductDAO.class);

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
//product========================================================================
	

	}

