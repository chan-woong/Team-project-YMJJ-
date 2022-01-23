package com.java.member.dao;

import com.java.member.dto.MemberDto;

public interface MemberDao {

	int insert(MemberDto memberDto);

	String loginCheck(String id, String password);

	int idCheck(String id);

	MemberDto updateId(String id);

	int update(MemberDto memberDto);

	int delete(String id, String password);

}
