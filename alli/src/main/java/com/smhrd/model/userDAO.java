package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class userDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// 유저(구직자)회원가입
	public int insertUser(userVO vo) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int cnt = sqlSession.insert("com.smhrd.db.UserMemberMapper.userInsert", vo);

		sqlSession.close();

		return cnt;
	}

	// 유저(구직자)로그인
	public userVO userLogin(userVO vo) {

		userVO userLogin = null;

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		userLogin = sqlSession.selectOne("com.smhrd.db.UserMemberMapper.userSelect", vo);

		sqlSession.close();

		return userLogin;
	}

}
