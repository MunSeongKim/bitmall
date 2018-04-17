package com.cafe24.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebArgumentResolver;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import com.cafe24.bitmall.vo.MemberVO;


public class AuthMemberHandlerMethodArgumentResolver implements HandlerMethodArgumentResolver {

    @Override
    public Object resolveArgument( MethodParameter parameter, ModelAndViewContainer mavContainer,
	    NativeWebRequest webRequest, WebDataBinderFactory binderFactory ) throws Exception {
	if ( supportsParameter( parameter ) == false ) {
	    return WebArgumentResolver.UNRESOLVED;
	}

	// @AuthMember가 존재하고 Parameter Type이 UserVO인 경우
	HttpServletRequest request = webRequest.getNativeRequest( HttpServletRequest.class );
	HttpSession session = request.getSession();
	if ( session == null ) {
	    return null;
	}

	return session.getAttribute( "authMember" );
    }

    @Override
    public boolean supportsParameter( MethodParameter parameter ) {
	// 1. Parameter에 @AuthMember 여부 검사
	AuthMember authMember = parameter.getParameterAnnotation( AuthMember.class );
	// 2. @AuthMember가 없는 경우
	if ( authMember == null ) {
	    return false;
	}
	// 3. @AuthMember의 타입 확인 -> MemberVO가 아닌 경우
	if ( parameter.getParameterType().equals( MemberVO.class ) == false ) {
	    return false;
	}

	return true;
    }

}
