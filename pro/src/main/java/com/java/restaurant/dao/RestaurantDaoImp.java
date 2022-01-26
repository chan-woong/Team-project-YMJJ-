package com.java.restaurant.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.restaurant.dto.RestaurnatDto;

@Component
public class RestaurantDaoImp implements RestaurantDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int boardGroupNumberMax() {
		return sqlSessionTemplate.selectOne("boardGroupNumberMax");
	}

	@Override
	public int boardWriteNumber(HashMap<String, Integer> hMap) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("boardWriterNumber", hMap);
	}

	@Override
	public int restaurantWriteOk(RestaurnatDto restaurnatDto) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("boardInsert", restaurnatDto);
	}
	
	
}
