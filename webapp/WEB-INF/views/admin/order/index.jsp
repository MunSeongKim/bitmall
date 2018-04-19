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

<div class="center lg">
<table class="admin">
	<tr>
		<td align="left"  width="100" valign="bottom">주문수 : <font color="#FF0000">${fn:length(orders)}</font></td>
	</tr>
	<tr bgcolor="#CCCCCC" height="23"> 
		<td width="70"  align="center">주문번호</td>
    <td width="70"  align="center">주문일</td>
	  <td width="250" align="center">상품명</td>
		<td width="40"  align="center">제품수</td>	
		<td width="70"  align="center">총금액</td>
    <td width="65"  align="center">주문자</td>
		<td width="50"  align="center">결재</td>
    <td width="135" align="center">주문상태</td>
    <td width="50"  align="center">삭제</td>
	</tr>
	<c:forEach items="${orders }" var="order">
	<form name="modify-order-form${order.orderNo }" method="POST" action="${pageContext.servletContext.contextPath }/admin/order/modify/${order.orderNo}">
	<tr bgcolor="#F2F2F2" height="23">
		<td width="70"  align="center"><a href="${pageContext.servletContext.contextPath }/admin/order/${order.orderNo}">${order.orderNo }</a></td>
		<td width="70"  align="center">${order.regDate }</td>
		<td width="250" align="left">${order.productName }<c:if test="${order.count gt 1 }"> 외 ${order.count -1 }</c:if></td>
		<td width="40" align="center">${order.count }</td>	
		<td width="70"  align="right"><fmt:formatNumber value="${order.totPrice }"/></td>	
		<td width="65"  align="center">${order.orderName }</td>
		<c:choose>
			<c:when test="${order.payType eq 'card' }">
				<td width="50"  align="center">카드</td>
			</c:when>
			<c:otherwise>
				<td width="50"  align="center">무통장</td>
			</c:otherwise>
		</c:choose>
		<td width="135" align="center" valign="bottom">
			<input type="hidden" name="hidden-state" value="${order.state }" />
			<select id="del-${order.orderNo }" name="state" style="font-size:9pt; color:black">
				<option value="1">주문신청</option>
				<option value="2">주문확인</option>
				<option value="3">입금확인</option>
				<option value="4">배송중</option>
				<option value="5">주문완료</option>
				<option value="6">주문취소</option>
			</select>&nbsp;
			<input type="image" src="${pageContext.servletContext.contextPath }/assets/images/admin/b_edit1.gif" border="0">
		</td>	
		<td width="50" align="center" valign="bottom">
			<a class="btn-del" name="del-${order.orderNo }" href="${pageContext.servletContext.contextPath }/admin/order/delete/${order.orderNo}"><img src="${pageContext.servletContext.contextPath }/assets/images/admin/b_delete1.gif" border="0"></a>
		</td>
	</tr>
	</form>
	</c:forEach>
</table>
</div></div>

<script type="text/javascript">
	$(function() {
		var states = document.getElementsByName("hidden-state");
		var selectStates = document.getElementsByName("state");
		
		for(var i = 0; i < states.length; i++){
			selectStates[i].selectedIndex=states[i].value-1
		}
		
		$('a.btn-del').click(function(e) {
			var selectedValue = $("#"+this.name+" option:selected").val();
			if( selectedValue !== '5' ){
				e.preventDefault();
				alert("주문완료 상태가 아닙니다.");
				return false;						
			};
			return true;
		});
	});
</script>
</body>
</html>