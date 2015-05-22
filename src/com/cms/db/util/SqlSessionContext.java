package com.cms.db.util;

import org.apache.ibatis.session.SqlSession;

public class SqlSessionContext {

	private SqlSessionContext() {
	}

	private static SqlSessionContext instance = new SqlSessionContext();

	public static SqlSessionContext getInstance() {
		return instance;
	}

	private ThreadLocal<SqlSession> sqlsessionLocal = new ThreadLocal<>();

	public void bind(SqlSession sqlSession) {
		sqlsessionLocal.set(sqlSession);
	}

	public SqlSession get() {
		return sqlsessionLocal.get();
	}

	public void remove() {
		sqlsessionLocal.remove();
	}

}
