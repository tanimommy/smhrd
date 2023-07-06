package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class OsDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// 기술 가져오기
	public List<OsVO> selectOs() {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<OsVO> list = session.selectList("selectOs");
		session.close();
		return list;
	}
	
	// 구직자 로그인 아이디로 OS 가져오기
	public List<String> selectUserOS(String userId) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<String> osList = session.selectList("selectUserOS",userId);
		session.close();
		return osList ;
	}

	public int insertOss(OsVO vo) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("com.smhrd.db.LanguageMapper.insertOss", vo);
		session.close();
		return cnt;
	}
}
