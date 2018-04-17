package com.cafe24.security;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cafe24.bitmall.vo.MemberVO;
import com.cafe24.dto.JSONResult;
import com.cafe24.security.Auth.Role;
import com.fasterxml.jackson.databind.ObjectMapper;

public class AuthInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle( HttpServletRequest request, HttpServletResponse response, Object handler )
	    throws Exception {
	// 1. Handler 종류 확인
	if ( handler instanceof HandlerMethod == false ) {
	    return true;
	}
	// 2. Type Casting
	HandlerMethod handlerMethod = (HandlerMethod) handler;
	// 3. get @Auth
	Auth authMethod = handlerMethod.getMethodAnnotation( Auth.class );
	// Class의 @Auth를 가져옴
	Auth authClass = handlerMethod.getBeanType().getAnnotation( Auth.class );
	// 4. method, class에 @Auth가 없는 경우
	if ( authMethod == null && authClass == null ) {
	    return true;
	}
	// 5. @Auth가 있는 경우, 인증여부 체크
	HttpSession session = request.getSession();
	if ( session == null ) {
	    response.sendRedirect( request.getContextPath() + "/member/login" );
	    return false;
	}
	MemberVO authMember = (MemberVO) session.getAttribute( "authMember" );
	if ( authMember == null ) {
	    
	    String accept = request.getHeader( "accept" );
	    if ( accept.matches( ".*application/json.*" ) ) {
		// 실패 JSON 응답
		JSONResult jsonResult = JSONResult.fail( request.getContextPath() + "/member/login" );
		String json = new ObjectMapper().writeValueAsString( jsonResult );
		response.setContentType( "application/json; charset=utf-8" );
		response.getWriter().print( json );
		return false;
	    }
	    
	    response.sendRedirect( request.getContextPath() + "/member/login" );
	    return false;
	}
	
	if ( "modify".equals( handlerMethod.getMethod().getName() ) ) {
	    String methodName = handlerMethod.getBeanType().getSimpleName();
	    if ( "admin".equals( authMember.getId() ) && "MemberController".equals(methodName)  ) {
		response.sendRedirect( request.getContextPath() );
		return false;
	    }
	}

	// class에 @Auth가 없는 경우
	if ( authClass == null ) {
	    return true;
	}
	

	// 인증되었을 경우, 권한 체크
	if ( authClass.role() == Role.ADMIN ) {
	    if ( "user".equals( authMember.getClassify() ) ) {
		response.sendRedirect( request.getContextPath() );
		return false;
	    }
	}

	// 6. 접근 허가
	return true;
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
	
	String handlerMethodName = handlerMethod.getMethod().getName();
	System.out.println( handlerMethodName );

	Map<String, Object> model = modelAndView.getModel();
	MemberVO memberVo = (MemberVO) model.get( "memberVO" );

	HttpSession session = request.getSession();
	MemberVO authMember = (MemberVO) session.getAttribute( "authMember" );
	authMember.setName( memberVo.getName() );
	session.setAttribute( "authMember", authMember );
	
	super.postHandle( request, response, handlerMethod, modelAndView );
    }
}
