package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class jjimDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	//찜 목록 가져오기
	public List<jjimVO> selectjjim() {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<jjimVO> list = session.selectList("selectjjim");
		session.close();
		return list;
	}

	//찜 넣어주기
	public int insertjjim(jjimVO vo) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("insertjjim", vo);
		session.close();
		return cnt;
	}

	//찜 삭제하기
	public int deletejjim(jjimVO vo) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("deletejjim", vo);
		session.close();
		return cnt;
	}


}
