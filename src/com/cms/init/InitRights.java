package com.cms.init;

import java.io.File;
import java.lang.reflect.Method;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ServletContextAware;

import com.cms.auth.AuthClass;
import com.cms.auth.AuthMethod;
import com.cms.model.Right;
import com.cms.service.RightService;

@Component
public class InitRights implements ApplicationListener<ContextRefreshedEvent>,ServletContextAware {

	@Autowired
	private RightService rs;
	
	private ServletContext sc;

	@Override
	public void onApplicationEvent(ContextRefreshedEvent event) {

		
		// spring容器初始化完成后，执行该方法
		if (event.getApplicationContext().getParent() == null) {
			
			//将权限添加到数据库
			try {
				ClassLoader loader = InitRights.class.getClassLoader();
				URL url = loader.getResource("com/cms/controller");
				File dir = new File(url.toURI());
				File[] files = dir.listFiles();
				String fname = "";
				for (File f : files) {
					fname = f.getName();
					if (fname.endsWith(".class")) {
						processController(fname, rs);
					}
				}
			} catch (Exception e) {
				
				e.printStackTrace();
			}

		}
		
		//将所有权限放置到 
		List<Right> rights = rs.findAllRights();
		Map<String, Right> map = new HashMap<String, Right>();  
        for(Right r : rights){  
            map.put(r.getRightUrl(), r);  
        }  
        if(sc != null){  
            sc.setAttribute("all_rights", map);  
        }  

	}

	// 反射 Controller, 找出权限类和权限方法
	private static void processController(String fname, RightService rs) {
		try {
			String pkgName = "com.cms.controller";
			String simpleClassName = fname
					.substring(0, fname.indexOf(".class"));
			String className = pkgName + "." + simpleClassName;

			// 权限类
			Class<?> clazz = Class.forName(className);
			if (clazz.isAnnotationPresent(AuthClass.class)) {

				AuthClass authClass = clazz.getAnnotation(AuthClass.class);
				rs.appendRight(new Right(authClass.name(), clazz.getSimpleName(),"category"));
				
				
				Method[] methods = clazz.getDeclaredMethods();
				for (Method method : methods) {

					if (method.isAnnotationPresent(AuthMethod.class)) {
						AuthMethod authMethod = method
								.getAnnotation(AuthMethod.class);
						String rightName = authMethod.rightName();
						String rightUrl = authMethod.rightUrl();
						rs.appendRight(new Right(rightName, rightUrl,"action"));
					}
				}
			}

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}

	@Override
	public void setServletContext(ServletContext arg0) {
		this.sc = arg0;
	}
}