package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class developDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// 자격증 명칭
	public List<developVO> selectDevelopList() {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<developVO> list = session.selectList("selectDevelopList");
		session.close();
		return list;
	}
}
