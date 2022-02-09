package com.java.notice.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.notice.dto.NoticeBoardDto;

@Component
public class NoticeBoardDaoImp implements NoticeBoardDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int noticeBoardWriteNumber(HashMap<String, Integer> hMap) {
		return sqlSessionTemplate.update("noticeBoardWriteNumber", hMap);
	}

	@Override
	public int noticeBoardWriteOk(NoticeBoardDto noticeBoardDto) {
		return sqlSessionTemplate.insert("noticeBoardInsert", noticeBoardDto);
	}

	@Override
	public List<NoticeBoardDto> noticeBoardList(int startRow, int endRow) {
		HashMap<String, Integer> hMap = new HashMap<String, Integer>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		return sqlSessionTemplate.selectList("noticeBoardList", hMap);
	}

	@Override
	public int getCount() {
		return sqlSessionTemplate.selectOne("noticeBoardCount");
	}

	@Override
	public int noticeBoardDeleteOk(int cnumber) {
		return sqlSessionTemplate.delete("noticeBoardDelete", cnumber);
	}

	@Override
	public NoticeBoardDto noticeBoardUpdateSelect(int cnumber) {
		return sqlSessionTemplate.selectOne("noticeBoardRead", cnumber);
	}

	@Override
	public int boardUpdateOk(NoticeBoardDto noticeBoardDto) {
		return sqlSessionTemplate.update("noticeBoardUpdate", noticeBoardDto);
	}

}
