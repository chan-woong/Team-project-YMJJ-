package com.java.aboutjeju.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class AboutjejuDaoImp implements AboutjejuDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
}
