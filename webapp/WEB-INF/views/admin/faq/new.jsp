<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>쇼핑몰 관리자 홈페이지</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.servletContext.contextPath }/assets/css/admin.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
</head>
<body>
<div class="bg">
<jsp:include page="/WEB-INF/views/include/admin-menu.jsp"/>

<div class="center md">
<form name="faq-new-form" method="post" action="${pageContext.servletContext.contextPath }/admin/faq/new">
<table width="600" border="1" cellspacing="0" bordercolordark="white" bordercolorlight="black">
	<tr> 
		<td width="100" height="20" bgcolor="#CCCCCC" align="center">
			<font color="#142712">글제목</font>
		</td>
		<td width="500" height="20"  bgcolor="#F2F2F2">
			<input type="text" name="title" value="" size="67">
		</td>
	</tr>
	<tr> 
		<td width="100" height="20" bgcolor="#CCCCCC" align="center">
			<font color="#142712">글내용</font>
		</td>
		<td width="500" height="20" bgcolor="#F2F2F2">
			<textarea name="content" rows="7" cols="69"></textarea>
		</td>
	</tr>
</table>
<br>
<table width="600" border="0" cellspacing="0" cellpadding="7">
	<tr> 
		<td align="center">
			<input type="submit" value="등 록 하 기" />
			<a href="${pageContext.servletContext.contextPath }/admin/faq"><input type="button" value="이 전 화 면"></a>
		</td>
	</tr>
</table>
</form>
</div></div>
</body>
</html>
