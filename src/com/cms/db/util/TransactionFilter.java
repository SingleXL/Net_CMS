package com.cms.db.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.ibatis.session.SqlSession;

public class TransactionFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {

		SqlSession session = null;

		try {
			// obtain session
			session = DatabaseUtil.getSqlSession();
			SqlSessionContext.getInstance().bind(session);
			chain.doFilter(request, response);

			// commit
			session.commit();
		} catch (Exception e) {

			// rollback
			session.rollback();
		} finally {
			// close
			SqlSessionContext.getInstance().remove();
			session.close();
		}

	}

	@Override
	public void destroy() {
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
	}

}
