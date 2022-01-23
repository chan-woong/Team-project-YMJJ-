package com.java.board.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.java.board.dto.BoardDto;
import com.java.myBatis.SqlManager;

public class BoardDao {
	private static BoardDao instance=new BoardDao();
	private static SqlSessionFactory sqlSessionFactory=SqlManager.getInstance();
	private SqlSession session;
	public static BoardDao getInstance() {
		return instance;
	}
	
	public int insert(BoardDto boardDto) {
		int check=0;
		writeNumber(boardDto);
		try {
			session=sqlSessionFactory.openSession();
			check=session.insert("boardInsert",boardDto);
			session.commit();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return check;
	}
	
	public void writeNumber(BoardDto boardDto) {
		int boardNumber=boardDto.getBoardNumber();
		int groupNumber=boardDto.getGroupNumber();
		int sequenceNumber=boardDto.getSequenceNumber();
		int sequenceLevel=boardDto.getSequenceLevel();
			
		try {
			if(boardNumber==0) {  // ROOT(부모글) : 그룹번호 작업
				session=sqlSessionFactory.openSession();
				int max=session.selectOne("boardGroupNumberMax");
	
				if(max !=0) {
					max=max+1;
					boardDto.setGroupNumber(max);
				}
			}else {  							// 자식글 : 글순서, 글레벨 작업
				HashMap<String, Integer> hMap=new HashMap<String, Integer>();
				hMap.put("groupNumber", groupNumber);
				hMap.put("sequenceNumber", sequenceNumber);
				
				session=sqlSessionFactory.openSession();
				session.update("boardWriterNumber", hMap);
				session.commit();
				
				sequenceNumber=sequenceNumber+1;
				sequenceLevel=sequenceLevel+1;
				
				boardDto.setSequenceNumber(sequenceNumber);
				boardDto.setSequenceLevel(sequenceLevel);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
	}
	
	public List<BoardDto> boardList(int startRow, int endRow){
		List<BoardDto> valueList=null;
		HashMap<String, Integer> hMap = new HashMap<String, Integer>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		try {
			session=sqlSessionFactory.openSession();
			valueList=session.selectList("boardList",hMap);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
	
		return valueList;
	}
	
	public int getCount() {
		int count=0;
		try {
			session=sqlSessionFactory.openSession();
			count=session.selectOne("boardCount");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return count;
	}
	
	public BoardDto read(int boardNumber) {
		BoardDto boardDto=null;
		try {
			session=sqlSessionFactory.openSession();
			session.update("boardReadCount", boardNumber);
			boardDto=session.selectOne("boardRead", boardNumber);
			session.commit();
		}catch(Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
		
		return boardDto;
	}
	
	public int delete(int boardNumber, String password) {
		int check=0;
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("boardNumber", boardNumber);
		hMap.put("password", password);
		try {
			session = sqlSessionFactory.openSession();
			check=session.delete("boardDelete",hMap);
			session.commit();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
		}
		return check;
	}
	
	public BoardDto update(int boardNumber) {
		BoardDto boardDto=null;
		
		try {
			session = sqlSessionFactory.openSession();
			boardDto=session.selectOne("boardRead",boardNumber);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return boardDto;
	}
	
	public int update(BoardDto boardDto) {
		int check=0;
		try {
			session = sqlSessionFactory.openSession();
			check=session.update("boardupdate",boardDto);
			session.commit();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return check;
	}
}
