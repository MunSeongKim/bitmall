package com.cafe24.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cafe24.bitmall.service.MemberService;
import com.cafe24.bitmall.vo.MemberVO;

public class AuthLoginInterceptor extends HandlerInterceptorAdapter {
    @Autowired
    private MemberService memberService;

    @Override
    public boolean preHandle( HttpServletRequest request, HttpServletResponse response, Object handler )
	    throws Exception {
	String id = request.getParameter( "id" );
	String password = request.getParameter( "password" );

	MemberVO vo = new MemberVO();
	vo.setId( id );
	vo.setPassword( password );

	MemberVO authMember = memberService.getUserForLogin( vo );

	if ( authMember == null ) {
	    request.setAttribute( "id", id );
	    request.setAttribute( "result", "fail" );
	    request.getRequestDispatcher( "/WEB-INF/views/member/login.jsp" ).forward( request, response );
	    return false;
	}

	HttpSession session = request.getSession( true );
	session.setAttribute( "authMember", authMember );
	response.sendRedirect( request.getContextPath() );
	return false;
    }
}
