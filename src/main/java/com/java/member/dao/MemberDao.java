package com.java.member.dao;

import java.util.List;

import com.java.member.dto.BookmarkDto;
import com.java.member.dto.MemberDto;
import com.java.member.dto.SimpleReviewDto;

public interface MemberDao {

	int insert(MemberDto memberDto);

	int idCheck(String mid);

	MemberDto LoginOk(String Mid, String Mpassword);

	MemberDto selectMid(String mid);

	int getCount();

	List<MemberDto> memberList();

	int update(MemberDto memberDto);

	int delete(String Mid);

	List<SimpleReviewDto> getReview(String parameter);

	int Markinsert(String Mid, String RTnumber);

	int MarkDel(String Mid, String RTnumber);

	List<BookmarkDto> getBook(String Mid);


}
