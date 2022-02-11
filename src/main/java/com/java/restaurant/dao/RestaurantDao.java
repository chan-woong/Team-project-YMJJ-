package com.java.restaurant.dao;

import java.util.List;

import com.java.comments.dto.CommentsDto;
import com.java.restaurant.dto.RestaurnatDto;

public interface RestaurantDao {

	public int restaurantWriteOk(RestaurnatDto restaurnatDto);

	public int getCount();

	public int getCount(String rTtype);

	public List<RestaurnatDto> restaurantList(int startRow, int endRow);

	public List<RestaurnatDto> restaurantLists(int startRow, int endRow, String rTtype);

	public RestaurnatDto restaurantRead(String RTnumber);

	public int restaurantDeleteOk(String RTnumber);

	public RestaurnatDto restaurantUpdateSelect(String RTnumber);

	public int restaurantUpdateOk(RestaurnatDto restaurnatDto);

	public int commentsWriteOk(CommentsDto comentsDto);

	public int commentsGetCount();

	public List<CommentsDto> commentList(int startRow, int endRow, String RTnumber);

	public RestaurnatDto selectrestaurant(String parameter);

	public int update(RestaurnatDto restaurnatDto);

	public int Update2(RestaurnatDto restaurnatDto);

	// 북마크

	public int bookMarkCheck(String rTnumber, String mid);

	public int bookMarkSelect(String Mid, String RTnumber);

	public int bookMarkDeleteOk(String Mid, String RTnumber);

	// public int imgWriteOk(ImgDto imgDto);

}
