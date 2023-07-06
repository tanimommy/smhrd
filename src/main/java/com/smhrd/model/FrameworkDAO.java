package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class FrameworkDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// 기술 가져오기
	public List<FrameworkVO> selectFramework() {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<FrameworkVO> list = session.selectList("selectFramework");
		session.close();
		return list;
	}
	
	// 구직자 아이디 기반 프레임워크 가져오기
	public List<String> selectUserFrameWork(String userId){
		SqlSession session = sqlSessionFactory.openSession(true);
		List<String> frameList = session.selectList("selectUserFrameWork",userId);
		session.close();
		return frameList ;
	}

	public int insertFrameworks(FrameworkVO vo) {

		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("com.smhrd.db.LanguageMapper.insertFrameworks", vo);
		session.close();
		return cnt;
	}
}
