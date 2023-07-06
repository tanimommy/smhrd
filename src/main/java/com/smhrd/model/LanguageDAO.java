package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class LanguageDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// 기술 가져오기
	public List<LanguageVO> selectLanguage() {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<LanguageVO> list = session.selectList("selectLanguage");
		session.close();
		return list;
	}
	
	public List<String> selectUserLanguage(String userId) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<String> lanList = session.selectList("selectUserLanguage",userId);
		session.close();
		return lanList ;
	}
	
	// 기술 insert
	public int insertLanguages(LanguageVO vo) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("com.smhrd.db.LanguageMapper.insertLanguages", vo);
		session.close();
		return cnt;
	}
}
