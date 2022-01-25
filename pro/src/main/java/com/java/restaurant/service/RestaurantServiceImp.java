package com.java.restaurant.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.restaurant.dao.RestaurantDaoImp;

@Component
public class RestaurantServiceImp implements RestaurantService {
	
	@Autowired
	private RestaurantDaoImp restaurantDao; 
}
