package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class cmpDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// 유저(기업)회원가입
	public int insertCmp(cmpVO vo) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int cnt = sqlSession.insert("com.smhrd.db.CmpMemberMapper.cmpInsert", vo);

		sqlSession.close();

		return cnt;
	}

	// 유저(기업)로그인
	public cmpVO cmpLogin(cmpVO vo) {

		cmpVO cmpLogin = null;

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		cmpLogin = sqlSession.selectOne("com.smhrd.db.CmpMemberMapper.cmpSelect", vo);

		sqlSession.close();

		return cmpLogin;
	}

}
