package com.cafe24.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthLogoutInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle( HttpServletRequest request, HttpServletResponse response, Object handler )
	    throws Exception {
	HttpSession session = request.getSession();
	if ( session != null ) {
	    session.removeAttribute( "authMember" );
	    session.invalidate();
	    response.sendRedirect( request.getHeader("referer") );
	    return false;
	}
	return false;
    }

}
