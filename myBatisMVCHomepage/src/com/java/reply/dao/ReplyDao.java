package com.java.reply.dao;

import java.util.HashMap;
import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.java.myBatis.SqlManager;
import com.java.reply.dto.ReplyDto;

public class ReplyDao {
	private static SqlSessionFactory sqlSessionFactory=SqlManager.getInstance();
	private  SqlSession session;
	private static ReplyDao instance=new ReplyDao();
	public static ReplyDao getInstance() {
		return instance;
	}
	public int insert(ReplyDto replyDto) {
		int check=0;
		
		try {
			session=sqlSessionFactory.openSession();
			check = session.insert("replyWrite",replyDto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return check;
	}
	public int getBunho() {
		int bunho = 0;
		try {
			session=sqlSessionFactory.openSession();
			bunho = session.selectOne("replyBunho");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return bunho;
	}
	public List<ReplyDto> getList() {
		List<ReplyDto> replyList=null;
		try {
			session=sqlSessionFactory.openSession();
			replyList = session.selectList("replyList");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return replyList;
	}
	public int delete(int bunho) {
		int check=0;
		try {
			session=sqlSessionFactory.openSession();
			check = session.delete("replyDelete",bunho);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return check;
	}
	public ReplyDto select(int bunho) {
		ReplyDto replyDto=null;
		try {
			session=sqlSessionFactory.openSession();
			replyDto = session.selectOne("replySelect",bunho);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return replyDto;
		
	}
	public int update(int bunho, String line_reply) {
		int check=0;
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("bunho", bunho);
		hMap.put("line_reply", line_reply);
		try {
			session=sqlSessionFactory.openSession();
			check = session.update("replyupdate",hMap);
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return check;
	}
}
