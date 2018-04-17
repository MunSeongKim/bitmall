package com.cafe24.security;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cafe24.bitmall.vo.MemberVO;
import com.cafe24.security.Auth.Role;

public class NavigatorInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle( HttpServletRequest request, HttpServletResponse response, Object handler )
	    throws Exception {
	// TODO Auto-generated method stub
	return super.preHandle( request, response, handler );
    }

    @Override
    public void postHandle( HttpServletRequest request, HttpServletResponse response, Object handler,
	    ModelAndView modelAndView ) throws Exception {
	if( "GET".equals(request.getMethod().toUpperCase()) ){
	    super.postHandle( request, response, handler, modelAndView );
	    return ;
	}

	// 1. Handler 종류 확인
	if ( handler instanceof HandlerMethod == false ) {
	    super.postHandle( request, response, handler, modelAndView );
	    return;
	}
	
	HandlerMethod handlerMethod = (HandlerMethod) handler;
	Auth authMethod = handlerMethod.getMethodAnnotation( Auth.class );

	if ( authMethod == null ) {
	    super.postHandle( request, response, handler, modelAndView );
	    return;
	}

	Map<String, Object> model = modelAndView.getModel();
	MemberVO memberVo = (MemberVO) model.get( "memberVO" );

	HttpSession session = request.getSession();
	MemberVO authMember = (MemberVO) session.getAttribute( "authMember" );
	authMember.setName( memberVo.getName() );
	session.setAttribute( "authMember", authMember );
	
	super.postHandle( request, response, handlerMethod, modelAndView );
    }
}
