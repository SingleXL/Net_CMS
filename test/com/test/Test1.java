package com.test;

import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.cms.dao.IUserDao;
import com.cms.db.util.DatabaseUtil;
import com.sun.org.apache.bcel.internal.generic.NEW;

public class Test1 {

	public static void main(String[] args) throws Exception {

		
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		System.out.println(sdf.format(new Date()));
		
		
		
		
		
		String str = "刚刚过去的是清明节，三天的假期，同学刚刚过去的是清明节，三天的假期，同学刚刚过去的是清明节，三天的假期，同学刚刚过去的是清明节，三天的假期，同学刚刚过去的是清明节，三天的假期，同学们都在朋友圈里各种晒出门旅行的照片，http://www.wojilu.com/Forum";
		System.out.println(str.length());
		
		String resource = "mybatis-config.xml";
		InputStream is = DatabaseUtil.class.getClassLoader()
				.getResourceAsStream(resource);

		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(is);

		SqlSession session;

		session = factory.openSession(true);
		session.commit(false); // ��Ĭ���ύ������������Ϊ��

		IUserDao iUserDao = session.getMapper(IUserDao.class);
//		System.out.println(iUserDao.selectUserRole(1).getRoles().size());
		
//		User user = (User) session.selectOne(
//				"com.cms.dao.IUserDao.selectUserRole", 1);
//		System.out.println("�û��� " + user.getName());
//		System.out.println(user.getRoles().size());
//		System.out.println(user.getRoles().get(0).getId());

		
		session.commit();
	}

}