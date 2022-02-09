package com.java.review.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.aop.LogAspect;
import com.java.restaurant.dto.RestaurnatDto;
import com.java.review.dto.ReviewDto;

@Component
public class ReviewDaoImp implements ReviewDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<ReviewDto> reviewList(int startRow, int endRow) {
		HashMap<String, Integer> hMap = new HashMap<String, Integer>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		return sqlSessionTemplate.selectList("reviewList", hMap);
	}

	@Override
	public int getCount() {
		return sqlSessionTemplate.selectOne("reviewCount");
	}

	@Override
	public int reviewWriteOk(ReviewDto reviewDto) {
		return sqlSessionTemplate.insert("reviewInsert", reviewDto);
	}

	@Override
	public ReviewDto read(String RVnumber) {
		ReviewDto reviewDto = null;
		int check = sqlSessionTemplate.update("reviewReadCount", RVnumber);
		reviewDto = sqlSessionTemplate.selectOne("reviewRead", RVnumber);
		return reviewDto;
	}

	@Override
	public int reviewWriteNumber(ReviewDto reviewDto) {
		return sqlSessionTemplate.insert("reviewInsert", reviewDto);
	}

	@Override
	public int passCheck(String password, String Mid) {
		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("password", password);
		hMap.put("Mid", Mid);
		return sqlSessionTemplate.selectOne("passCheck", hMap);
	}

	@Override
	public int reviewDeleteCheck(String RVnumber) {
		return sqlSessionTemplate.delete("reviewDelete", RVnumber);
	}

	@Override
	public ReviewDto reviewUpdateSelect(String RVnumber) {
		return sqlSessionTemplate.selectOne("reviewRead", RVnumber);
	}

	@Override
	public int reviewUpdateOk(ReviewDto reviewDto) {
		return sqlSessionTemplate.update("reviewUpdate", reviewDto);
	}

	@Override
	public int reviewFileUpdateOk(ReviewDto reviewDto) {
		return sqlSessionTemplate.update("reviewFileUpdate", reviewDto);
	}

	@Override
	public List<RestaurnatDto> RTsearch(String RTname) {
		return sqlSessionTemplate.selectList("RTsearch", RTname);
	}
}
