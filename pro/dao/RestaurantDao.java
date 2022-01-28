package com.java.restaurant.dao;

import java.util.HashMap;

import com.java.restaurant.dto.RestaurnatDto;

public interface RestaurantDao {
	
	public int boardGroupNumberMax();
	
	public int boardWriteNumber(HashMap<String, Integer> hMap);
	
	public int restaurantWriteOk(RestaurnatDto restaurnatDto);
	

	
}
