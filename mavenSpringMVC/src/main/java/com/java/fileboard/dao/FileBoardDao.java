package com.java.fileboard.dao;

import java.util.HashMap;
import java.util.List;

import com.java.board.dto.BoardDto;
import com.java.fileboard.dto.FileBoardDto;

public interface FileBoardDao {

	int fileBoardGroupNumberMax();

	int fileBoardWriteNumber(HashMap<String, Integer> hMap);

	int fileBoardWriteNumber(FileBoardDto fileBoardDto);

	int getCount();

	List<FileBoardDto> boardList(int startRow, int endRow);

	FileBoardDto read(int boardNumber);

	FileBoardDto fileBoardSelect(int boardNumber);

}
