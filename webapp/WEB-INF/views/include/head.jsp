<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>비트닷컴 쇼핑몰</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.servletContext.contextPath }/assets/css/main.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>

<table id="header-top">
	<tr> 
		<td>
			<!--  상단 왼쪽 로고  -------------------------------------------->
			<table id="header-top-logo">
				<tr>
					<td>
						<c:if test="${not empty authMember and authMember.classify eq 'admin' }">
							<a href="${pageContext.servletContext.contextPath }/admin">
								<img src="${pageContext.servletContext.contextPath }/assets/images/admin.png" alt="logo" />
							</a>
						</c:if>
					</td>
				</tr>
			</table>
		</td>
		<td id="header-top-nav">
			<!--  상단메뉴 시작 (main_topmemnu.jsp) : Home/로그인/회원가입/장바구니/주문배송조회/즐겨찾기추가  ---->	
			<table>
				<tr>
				<c:choose>
					<c:when test="${empty authMember }">
						<td><a href="${pageContext.servletContext.contextPath }">
							<img src="${pageContext.servletContext.contextPath }/assets/images/top_menu01.gif" />
						</a></td>
						<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" /></td>
						<td><a href="${pageContext.servletContext.contextPath }/member/login">
							<img src="${pageContext.servletContext.contextPath }/assets/images/top_menu02.gif" />
						</a></td>
						<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" /></td>
						<td><a href="${pageContext.servletContext.contextPath }/member/agree">
							<img src="${pageContext.servletContext.contextPath }/assets/images/top_menu03.gif" />
						</a></td>
						<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" /></td>
						<td>
							<img src="${pageContext.servletContext.contextPath }/assets/images/top_menu08.gif" />
						</td>
					</c:when>
					
					<c:otherwise>
						<td><a href="${pageContext.servletContext.contextPath }">
							<img src="${pageContext.servletContext.contextPath }/assets/images/top_menu01.gif" />
						</a></td>
						<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" /></td>
						<!-- 로그아웃 -->
						<td><a href="${pageContext.servletContext.contextPath }/member/logout">
							<img src="${pageContext.servletContext.contextPath }/assets/images/top_menu02_1.gif" />
						</a></td>
						<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" /></td>
						<!-- 회원정보수정 -->
						<c:if test="${authMember.id ne 'admin' }" >
						<td><a href="${pageContext.servletContext.contextPath }/member/modify">
							<img src="${pageContext.servletContext.contextPath }/assets/images/top_menu03_1.gif" />
						</a></td>
						<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" /></td>
						</c:if>
						<td><a href="${pageContext.servletContext.contextPath }/cart"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu05.gif" /></a></td>
						<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" /></td>
						<td><a href="${pageContext.servletContext.contextPath }/order/list"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu06.gif" /></a></td>
						<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif"/></td>
						<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu08.gif" /></td>
					</c:otherwise>
				</c:choose>	
				</tr>
			</table>
			<!--  상단메뉴 끝 (main_topmemnu.php)  ---------->	
		</td>
	</tr>
</table>

<!--  상단 메인 이미지 --------------------------------------------------->
<table id="header-main">
	<tr>
	  <td><img src="${pageContext.servletContext.contextPath }/assets/images/main_image.png" alt="main img" /></td>
	</tr>
</table>