package com.java.aboutjeju.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.aboutjeju.dto.AboutjejuDto;

@Component
public class AboutjejuDaoImp implements AboutjejuDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int LMinsert(AboutjejuDto aboutjejuDto) {
		//항목 추가
		return sqlSessionTemplate.insert("Linsert",aboutjejuDto);
	}

	@Override
	public List<AboutjejuDto> IRead(String introduction) {
		//카테고리별 selectList
		return sqlSessionTemplate.selectList("IRead",introduction);	
	}

	@Override
	public List<AboutjejuDto> Lread(String location) {
		
		return sqlSessionTemplate.selectList("LRead",location);
	}

	@Override
	public List<AboutjejuDto> Sread(String speciality) {
		
		return sqlSessionTemplate.selectList("SRead",speciality);
	}

	@Override
	public List<AboutjejuDto> Aread(String activites) {
		
		return sqlSessionTemplate.selectList("ARead",activites);	
	}
}
