package com.java.restaurant.service;

import org.springframework.web.servlet.ModelAndView;

public interface RestaurantService {

	public void restaurnatWrite(ModelAndView mav);

	public void restaurnatWriteOk(ModelAndView mav);

	public void restaurantList(ModelAndView mav);

	public void restaurantRead(ModelAndView mav);

	public void restaurantUpdate(ModelAndView mav);

	public void restaurantUpdateOk(ModelAndView mav);

	public void restaurantDeleteOk(ModelAndView mav);

	public void restaurantDelete(ModelAndView mav);

	public void commentsWriteOk(ModelAndView mav);

	public void bookmarkOk(ModelAndView mav);

	public void bookmarkDeleteOk(ModelAndView mav);

}
