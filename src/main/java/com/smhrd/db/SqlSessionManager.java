package com.smhrd.db;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionManager {

	private static SqlSessionFactory sqlSessionFactory;

	static {
		// mybatis 설정파일 경로
		String resource = "com/smhrd/db/mybatis-config.xml";
		Reader reader;

		try {
			reader = Resources.getResourceAsReader(resource);

			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static SqlSessionFactory getSqlSession() {
		return sqlSessionFactory;
	}

}
