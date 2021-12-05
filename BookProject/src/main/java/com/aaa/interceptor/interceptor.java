package com.aaa.interceptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class interceptor extends MethodFilterInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected String doIntercept(ActionInvocation arg0) throws Exception {
		Object User = ActionContext.getContext().getSession().get("user");
		if (null != User) {
			return arg0.invoke();
		}
		return "login";
	}

}
