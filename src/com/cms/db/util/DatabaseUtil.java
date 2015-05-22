package com.cms.db.util;

import java.io.InputStream;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DatabaseUtil {

	public static SqlSession getSqlSession() {

		String resource = "mybatis-config.xml";
		InputStream is = DatabaseUtil.class.getClassLoader()
				.getResourceAsStream(resource);
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(is);
		
		return factory.openSession(false);

	}

}
