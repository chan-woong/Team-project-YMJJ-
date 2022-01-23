package com.java.sawon.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.java.myBatis.SqlManager;
import com.java.sawon.dto.EmpDto;

public class SawonDao {
	private static SqlSessionFactory sqlSessionFactory=SqlManager.getInstance();
	private SqlSession session;
	
	private static SawonDao instance=new SawonDao();
	public static SawonDao getInstance() {
		return instance;
	}
	public List<String> deptList() {
		List<String> deptList=null;
		
		try {
			session = sqlSessionFactory.openSession();
			deptList= session.selectList("deptList");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return deptList;
	}
	public List<EmpDto> select(String departmentName) {
		List<EmpDto> sawonList=null;
		
		try {
			session=sqlSessionFactory.openSession();
			sawonList=session.selectList("sawonList", departmentName);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return sawonList;
	}
}
