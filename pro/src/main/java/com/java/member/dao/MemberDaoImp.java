package com.java.member.dao;

import java.util.HashMap;
import java.util.List;

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
	public int idCheck(String mid) {
		return sqlSessionTemplate.selectOne("idcheck", mid);
	}
	@Override
	public MemberDto LoginOk(String Mid, String Mpassword) {
		HashMap<String, String> hMap=new HashMap<String, String>();
		hMap.put("Mid", Mid);
		hMap.put("Mpassword", Mpassword);
		return sqlSessionTemplate.selectOne("loginOk", hMap);
	}
	@Override
	public MemberDto selectMid(String mid) {
		return sqlSessionTemplate.selectOne("memberSelect", mid);
	}
	@Override
	public int getCount() {
		return sqlSessionTemplate.selectOne("getCount");
	}
	@Override
	public List<MemberDto> memberList() {
		return sqlSessionTemplate.selectList("memberList");
	}
	@Override
	public int update(MemberDto memberDto) {
		return sqlSessionTemplate.update("updata", memberDto);
	}
	
}
