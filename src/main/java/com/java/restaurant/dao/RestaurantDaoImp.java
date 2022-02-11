package com.java.restaurant.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.aop.LogAspect;
import com.java.comments.dto.CommentsDto;
import com.java.restaurant.dto.RestaurnatDto;

@Component
public class RestaurantDaoImp implements RestaurantDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int restaurantWriteOk(RestaurnatDto restaurnatDto) {
		return sqlSessionTemplate.insert("boardInsert", restaurnatDto);
	}

	@Override
	public int getCount() {
		return sqlSessionTemplate.selectOne("boardCount");
	}

	@Override
	public int getCount(String rTtype) {
		return sqlSessionTemplate.selectOne("boardCounttype", rTtype);
	}

	@Override
	public List<RestaurnatDto> restaurantList(int startRow, int endRow) {
		HashMap<String, Integer> hMap = new HashMap<String, Integer>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		return sqlSessionTemplate.selectList("boardList", hMap);
	}

	@Override
	public List<RestaurnatDto> restaurantLists(int startRow, int endRow, String rTtype) {
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		hMap.put("rTtype", rTtype);

		System.out.println(startRow);
		System.out.println(endRow);
		System.out.println(rTtype);
		return sqlSessionTemplate.selectList("boardListtype", hMap);
	}

	@Override
	public RestaurnatDto restaurantRead(String RTnumber) {
		RestaurnatDto restaurnatDto = null;
		int check = sqlSessionTemplate.update("boardReadCount", RTnumber);
		LogAspect.logger.info(LogAspect.LogMsg + check);
		restaurnatDto = sqlSessionTemplate.selectOne("boardRead", RTnumber);
		return restaurnatDto;
	}

	@Override
	public int restaurantDeleteOk(String RTnumber) {
		sqlSessionTemplate.delete("Bdelete", RTnumber);
		sqlSessionTemplate.delete("Cdelete", RTnumber);
		sqlSessionTemplate.delete("Rdelete", RTnumber);
		sqlSessionTemplate.delete("CMdelete", RTnumber);
		sqlSessionTemplate.delete("BMdelete", RTnumber);
		return sqlSessionTemplate.delete("boardDelete", RTnumber);
	}

	@Override
	public int restaurantUpdateOk(RestaurnatDto restaurnatDto) {
		return sqlSessionTemplate.update("boardUpdate", restaurnatDto);
	}

	@Override
	public RestaurnatDto restaurantUpdateSelect(String RTnumber) {
		return sqlSessionTemplate.selectOne("boardRead", RTnumber);
	}

	@Override
	public int update(RestaurnatDto restaurnatDto) {
		return sqlSessionTemplate.update("restaurantUpdate", restaurnatDto);
	}
	@Override
	public int commentsWriteOk(CommentsDto comentsDto) {
		return sqlSessionTemplate.insert("commentsInsert", comentsDto);
	}

	@Override
	public int commentsGetCount() {
		return  sqlSessionTemplate.selectOne("commentsCount");
	}

	@Override
	public List<CommentsDto> commentList(int startRow, int endRow, String RTnumber) {
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		hMap.put("RTnumber", RTnumber);
		return sqlSessionTemplate.selectList("commentsList", hMap);
	}

	@Override
	public RestaurnatDto selectrestaurant(String parameter) {
		return sqlSessionTemplate.selectOne("selectrestaurant", parameter);
	}

	@Override
	public int Update2(RestaurnatDto restaurnatDto) {
		return sqlSessionTemplate.update("restaurantUpdate2", restaurnatDto);
	}

	@Override
	public int bookMarkCheck(String rTnumber, String mid) {
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("rTnumber", rTnumber);
		hMap.put("mid", mid);
		return sqlSessionTemplate.insert("markinsert", hMap);
	}

	@Override
	public int bookMarkDeleteOk(String Mid, String RTnumber) {
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("RTnumber", RTnumber);
		hMap.put("Mid", Mid);
		return sqlSessionTemplate.delete("markdelete", hMap);
	}

	@Override
	public int bookMarkSelect(String Mid, String RTnumber) {
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("RTnumber", RTnumber);
		hMap.put("Mid", Mid);
		int check = sqlSessionTemplate.selectOne("selectbook", hMap);
		LogAspect.logger.info(LogAspect.LogMsg + check);
		return check;
	}
}
