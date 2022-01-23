package com.java.member.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.member.dto.MemberDto;
@Component
public class MemberDaoImp implements MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int insert(MemberDto memberDto) {
		return sqlSessionTemplate.insert("memberInsert", memberDto);
	}
	@Override
	public int idCheck(String id) {
		return sqlSessionTemplate.selectOne("memberIdCheck", id);
	}
	@Override
	public String loginCheck(String id, String password) {
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("id", id);
		hMap.put("password", password);
		return sqlSessionTemplate.selectOne("loginCheck", hMap);
	}
	@Override
	public MemberDto updateId(String id) {
		return sqlSessionTemplate.selectOne("memberSelect", id);
	}
	@Override
	public int update(MemberDto memberDto) {
		return sqlSessionTemplate.update("memberUpdate", memberDto);
	}
	@Override
	public int delete(String id, String password) {
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("id", id);
		hMap.put("password", password);
		return sqlSessionTemplate.delete("memberDelete", hMap);
	}
}
