package com.java.restaurant.dao;

import java.util.HashMap;

import com.java.img.dto.ImgDto;
import com.java.restaurant.dto.RestaurnatDto;

public interface RestaurantDao {

	public int restaurantWriteOk(RestaurnatDto restaurnatDto);
	
	public int imgWriteOk(ImgDto imgDto);
	

	
}
