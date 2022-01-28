package com.java.restaurant.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.img.dto.ImgDto;
import com.java.restaurant.dto.RestaurnatDto;

@Component
public class RestaurantDaoImp implements RestaurantDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private ImgDto imgDto;

	@Override
	public int restaurantWriteOk(RestaurnatDto restaurnatDto) {
		// TODO Auto-generated method stub
		imgWriteOk(imgDto);
		
		return sqlSessionTemplate.insert("boardInsert", restaurnatDto);
	}

	@Override
	public int imgWriteOk(ImgDto imgDto) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("insert", imgDto);
	}
	
	
	
}
