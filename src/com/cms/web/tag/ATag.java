package com.cms.web.tag;

import java.io.IOException;
import java.io.StringWriter;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.DynamicAttributes;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.cms.model.User;

public class ATag extends SimpleTagSupport  implements DynamicAttributes{
	private String href;
	private String sn;
	private String classs;

	public void setHref(String href) {
		this.href = href;
	}


	public void setSn(String sn) {
		this.sn = sn;
	}


	@Override
	public void doTag() throws JspException, IOException {
		
		PageContext pageContext = (PageContext)getJspContext();
		
		HttpSession session = pageContext.getSession();
		User user = (User) session.getAttribute("user");
		
		if (user.hasRight(sn)) {
			JspFragment jspFragment = getJspBody();
			StringWriter sw = new StringWriter();
			jspFragment.invoke(sw);
			pageContext.getOut().print("<a href=\""+href+"\" class=\""+classs+"\">"+sw.toString()+"</a>");
		}
		
		
	}


	@Override
	public void setDynamicAttribute(String arg0, String arg1, Object arg2)
			throws JspException {
		this.classs = (String) arg2;
	}


}
