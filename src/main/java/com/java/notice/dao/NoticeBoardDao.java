package com.java.notice.dao;

import java.util.HashMap;
import java.util.List;

import com.java.notice.dto.NoticeBoardDto;

public interface NoticeBoardDao {
	public int noticeBoardWriteNumber(HashMap<String, Integer> hMap);

	public int noticeBoardWriteOk(NoticeBoardDto noticeBoardDto);

	public int getCount();

	public List<NoticeBoardDto> noticeBoardList(int startRow, int endRow);

	public int noticeBoardDeleteOk(int cnumber);

	public NoticeBoardDto noticeBoardUpdateSelect(int cnumber);

	public int boardUpdateOk(NoticeBoardDto noticeBoardDto);

}
