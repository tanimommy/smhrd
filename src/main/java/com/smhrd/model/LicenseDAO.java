package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class LicenseDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// 기술 가져오기
	public List<LicenseVO> selectLicense() {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<LicenseVO> list = session.selectList("selectLicense");
		session.close();
		return list;
	}
	
	public int insertLicenses(LicenseVO vo) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("com.smhrd.db.LanguageMapper.insertLicenses", vo);
		session.close();
		return cnt;

	}
}
