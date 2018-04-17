package com.cafe24.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cafe24.bitmall.service.MemberService;
import com.cafe24.bitmall.vo.MemberVO;

public class AuthAdminLoginInterceptor extends HandlerInterceptorAdapter {
    @Autowired
    private MemberService memberService;

    @Override
    public boolean preHandle( HttpServletRequest request, HttpServletResponse response, Object handler )
	    throws Exception {
	String id = request.getParameter( "adminid" );
	String password = request.getParameter( "adminpw" );

	MemberVO vo = new MemberVO();
	vo.setId( id );
	vo.setPassword( password );

	MemberVO authAdmin = memberService.getUserForLogin( vo );

	if ( authAdmin == null ) {
	    request.setAttribute( "result", "fail" );
	    request.getRequestDispatcher( "/WEB-INF/views/admin/login.jsp" ).forward( request, response );
	    return false;
	}

	response.sendRedirect( request.getContextPath() + "/admin/product" );
	return false;
    }
}
