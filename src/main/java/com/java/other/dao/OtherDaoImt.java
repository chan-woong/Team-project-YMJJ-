package com.java.other.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.member.dto.RankingDto;
import com.java.restaurant.dto.RestaurnatDto;

@Component
public class OtherDaoImt implements OtherDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<RestaurnatDto> getRestaurnatList(String RTtype) {
		return sqlSessionTemplate.selectList("getRestaurnatList",RTtype);
	}
	@Override
	public List<RestaurnatDto> selectRestaurnatList(String RTname) {
		return sqlSessionTemplate.selectList("selectRestaurnatList",RTname);
	}
	@Override
	public List<RankingDto> selectRankingList() {
		return sqlSessionTemplate.selectList("getRanking");
	}
}
