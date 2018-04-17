<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<table id="search">
	<tr>
		<td><b>Welcome! ${authMember.name}.</b></td>
		<td><b>상품검색 ▶</b></td>
		<!-- form1 시작 -->
		<form name="form1" method="get" action="product_search.jsp">
			<td><input type="text" name="findtext" maxlength="40" size="20" class="cmfont1"></td>
			<td><input type="image" src="${pageContext.servletContext.contextPath }/assets/images/i_search1.gif"></td>
		</form>
		<!-- form1 끝 -->
	</tr>
</table>