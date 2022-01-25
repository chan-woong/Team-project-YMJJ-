package com.java.restaurant.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class RestaurantDaoImp implements RestaurantDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
}
