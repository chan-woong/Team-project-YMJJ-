package com.java.review.dao;

import java.util.List;

import com.java.restaurant.dto.RestaurnatDto;
import com.java.review.dto.ReviewDto;

public interface ReviewDao {

	public int getCount();

	public List<ReviewDto> reviewList(int startRow, int endRow);

	public int reviewWriteOk(ReviewDto reviewDto);

	public ReviewDto read(String RVnumber);

	public int reviewWriteNumber(ReviewDto reviewDto);

	public int passCheck(String password, String Mid);

	public int reviewDeleteCheck(String RVnumber);

	public ReviewDto reviewUpdateSelect(String RVnumber);

	public int reviewUpdateOk(ReviewDto reviewDto);

	public int reviewFileUpdateOk(ReviewDto reviewDto);

	public List<RestaurnatDto> RTsearch(String RTname);
}
