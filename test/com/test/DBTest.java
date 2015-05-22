package com.test;

import java.io.InputStream;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import com.cms.db.util.DatabaseUtil;
import com.cms.model.User;

public class DBTest {

	@Test
	public void dbTest() {
		String resource = "mybatis-config.xml";
		InputStream is = DatabaseUtil.class.getClassLoader()
				.getResourceAsStream(resource);

		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(is);

		SqlSession session;

		session = factory.openSession(true);
		session.commit(false); // 将默认提交事务属性设置为否

		User user = (User) session.selectOne(
				"com.cms.dao.IUserDao.selectUserRole", 1);
		System.out.println("用户名： " + user.getName());

		System.out.println(user.getRoles().size());
	}

}
