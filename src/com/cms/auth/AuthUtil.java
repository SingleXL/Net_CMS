package com.cms.auth;

import java.io.File;
import java.lang.reflect.Method;
import java.net.URL;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.cms.model.Right;
import com.cms.service.RightService;

public class AuthUtil  {

	// 获取权限
	public static void main(String[] args) throws Exception {
		
		ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
		RightService rs = ac.getBean(RightService.class);
		
		ClassLoader loader = AuthUtil.class.getClassLoader();
		URL url = loader.getResource("com/cms/controller");
		File dir = new File(url.toURI());
		File[] files = dir.listFiles();
		String fname = "";
		for(File f : files){
			fname = f.getName();
			if (fname.endsWith(".class")) {
				processController(fname,rs);
			}
		}
	}

	private static void processController(String fname,RightService rs) {
		try {
			String pkgName = "com.cms.controller";
			String simpleClassName = fname.substring(0,fname.indexOf(".class"));
			String className = pkgName + "." + simpleClassName;
			
			Class<?> clazz = Class.forName(className);
			if (clazz.isAnnotationPresent(AuthClass.class)) {
				
//				AuthClass authClass = (AuthClass) clazz.getAnnotation(AuthClass.class);
//				String uri = authClass.uri();
				
				Method[] methods = clazz.getDeclaredMethods();
				for (Method method : methods){
					
					if (method.isAnnotationPresent(AuthMethod.class)) {
						AuthMethod authMethod = method.getAnnotation(AuthMethod.class);						
						String rightName = authMethod.rightName();
						String rightUrl =  authMethod.rightUrl();
						rs.appendRight(new Right(rightName, rightUrl));
					}
				}
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}		
	}
	
	
	// 判断是否有权限
	
	
	
	
	
	
}
