package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class cmpRecomDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public List<cmpRecomVO> selectCmpInfo() {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<cmpRecomVO> cmpRecomList = session.selectList("selectCmpRecomList");
		session.close();
		
		return cmpRecomList ;
	}
}
