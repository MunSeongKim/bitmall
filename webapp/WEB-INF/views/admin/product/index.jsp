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
</head>
<body>
<div class="bg">
<jsp:include page="/WEB-INF/views/include/admin-menu.jsp"/>


<table class="admin">
	<tr>
		<td class="admin-title">
			제품수 : <font color="#FF0000">${fn:length(products) }</font>
		</td>
		<td class="admin-actions" colspan="6">
			<a href="product/new"><input type="button" value="새상품"></a>
		</td>
	</tr>
	<tr bgcolor="#CCCCCC" height="23"> 
		<td width="100" align="center">제품분류</td>
		<td width="100" align="center">제품코드</td>
		<td width="280" align="center">제품명</td>
		<td width="70"  align="center">판매가</td>
		<td width="50"  align="center">상태</td>
		<td width="120" align="center">이벤트</td>
		<td width="80"  align="center">수정/삭제</td>
	</tr>
	<c:forEach items="${products }" var="product" >
		<tr bgcolor="#F2F2F2" height="23">	
		<td width="100">${product.categoryName }</td>
		<td width="100">${product.code }</td>
		<td width="280">${product.name }</td>	
		<td width="70"  align="center"><fmt:formatNumber value="${product.price }" /></td>	
		<td width="50"  align="center">${product.state }</td>
		<td width="120" align="center" style="text-transform: capitalize">
				<c:if test="${product.newItem eq true }">
					New 
				</c:if>
				<c:if test="${product.hitItem eq true }">
					Hit 
				</c:if>
				<c:if test="${product.saleItem eq true }">
					Sale
					${product.discount } %
				</c:if>
		</td>	
		<td width="80"  align="center">
			<a href="${pageContext.servletContext.contextPath }/admin/product/modify/${product.code }">수정</a>/
			<a href="${pageContext.servletContext.contextPath }/admin/product/delete/${product.code }">삭제</a>
		</td>
	</tr>	
	</c:forEach>
</table>
</div>
</body>
</html>