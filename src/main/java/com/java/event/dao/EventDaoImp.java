package com.java.event.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class EventDaoImp implements EventDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
}
