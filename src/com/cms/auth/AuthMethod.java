package com.cms.auth;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/**
 * 权限方法
 */

@Retention(RetentionPolicy.RUNTIME)
public @interface AuthMethod {

	public String rightName();
	public String rightUrl();
	
}
