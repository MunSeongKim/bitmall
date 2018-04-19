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
<table width="800" border="1" cellspacing="0" cellpadding="4" bordercolordark="white" bordercolorlight="black">
	<tr> 
        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">주문번호</font></td>
        <td width="300" height="20" bgcolor="#EEEEEE"><font size="3"><b>${order.no }</b></font></td>
        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">주문일</font></td>
        <td width="300" height="20" bgcolor="#EEEEEE">${order.regDate }</td>
	</tr>
</table>
<br>
<table width="800" border="1" cellspacing="0" cellpadding="4" bordercolordark="white" bordercolorlight="black">
	<tr> 
        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">주문자</font></td>
        <td width="300" height="20" bgcolor="#EEEEEE">${order.orderName }</td>
        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">주문자전화</font></td>
        <td width="300" height="20" bgcolor="#EEEEEE">${order.orderTel }</td>
	</tr>
	<tr> 
        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">주문자 E-Mail</font></td>
        <td width="300" height="20" bgcolor="#EEEEEE">${order.orderEmail }</td>
        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">주문자핸드폰</font></td>
        <td width="300" height="20" bgcolor="#EEEEEE">${order.orderPhone }</td>
	</tr>
	<tr> 
        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">주문자주소</font></td>
        <td width="300" height="20" bgcolor="#EEEEEE" colspan="3">(${order.orderZipcode }) ${order.orderAddress }</td>
	</tr>
	</tr>
</table>
<table width="800" border="1" cellspacing="0" cellpadding="4" bordercolordark="white" bordercolorlight="black">
	<tr> 
        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">수신자</font></td>
        <td width="300" height="20" bgcolor="#EEEEEE">${order.rcvName }</td>
        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">수신자전화</font></td>
        <td width="300" height="20" bgcolor="#EEEEEE">${order.rcvTel }</td>
	</tr>
	<tr> 
        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">수신자 E-Mail</font></td>
        <td width="300" height="20" bgcolor="#EEEEEE">${order.rcvEmail }</td>
        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">수신자핸드폰</font></td>
        <td width="300" height="20" bgcolor="#EEEEEE">${order.rcvPhone }</td>
	</tr>
	<tr> 
        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">수신자주소</font></td>
        <td width="300" height="20" bgcolor="#EEEEEE" colspan="3">(${order.rcvZipcode }) ${order.rcvAddress }</td>
	</tr>
	<tr> 
        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">메모</font></td>
        <td width="300" height="50" bgcolor="#EEEEEE" colspan="3">${order.require }</td>
	</tr>
</table>
<br>
<table width="800" border="1" cellspacing="0" cellpadding="4" bordercolordark="white" bordercolorlight="black">
	<c:choose>
		<c:when test="${order.payType eq 'card' }">
		<tr> 
	        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">지불종류</font></td>
	        <td width="300" height="20" bgcolor="#EEEEEE">카드</td>
	        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">카드승인번호 </font></td>
	        <td width="300" height="20" bgcolor="#EEEEEE">12345678&nbsp</td>
		</tr>
		<tr> 
	        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">카드 할부</font></td>
	        <c:choose>
	        	<c:when test="${card.installment ne 0}">
	        		<td width="300" height="20" bgcolor="#EEEEEE">${card.installment } 개월</td>
	        	</c:when>
	        	<c:otherwise>
	        		<td width="300" height="20" bgcolor="#EEEEEE">일시불</td>
	        	</c:otherwise>
	        </c:choose>
	        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">카드종류</font></td>
	        <td width="300" height="20" bgcolor="#EEEEEE">${card.cardBank }</td>
		</tr>
		</c:when>
		<c:otherwise>
		<tr> 
	        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">무통장</font></td>
	        <td width="300" height="20" bgcolor="#EEEEEE">${account.accountBank }</td>
	        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">입금자이름</font></td>
	        <td width="300" height="20" bgcolor="#EEEEEE">${account.name }</td>
		</tr>
		</c:otherwise>
	</c:choose>
</table>
<br>
<table width="800" border="1" cellspacing="0" cellpadding="4" bordercolordark="white" bordercolorlight="black">
	<tr bgcolor="#CCCCCC"> 
    <td width="340" height="20" align="center"><font color="#142712">상품명</font></td>
		<td width="50"  height="20" align="center"><font color="#142712">수량</font></td>
		<td width="70"  height="20" align="center"><font color="#142712">단가</font></td>
		<td width="70"  height="20" align="center"><font color="#142712">금액</font></td>
		<td width="50"  height="20" align="center"><font color="#142712">할인</font></td>
		<td width="60"  height="20" align="center"><font color="#142712">옵션1</font></td>
	</tr>
	<c:set var="totPrice" value="${0 }"/>
	<c:forEach items="${orderProducts }" var="orderProduct" >
	<c:choose>
		<c:when test="${not empty orderProduct.discount}">
			<c:set var="price" value="${orderProduct.amount * (orderProduct.price * (orderProduct.discount / 100)) }" />	
		</c:when>
		<c:otherwise>
			<c:set var="price" value="${orderProduct.amount * orderProduct.price }" />
		</c:otherwise>
	</c:choose>	
	<tr bgcolor="#EEEEEE" height="20">	
		<td width="340" height="20" align="left">${orderProduct.productName }</td>	
		<td width="50"  height="20" align="center">${orderProduct.amount }</td>	
		<td width="70"  height="20" align="right"><fmt:formatNumber value="${orderProduct.price }" /></td>
		<td width="70"  height="20" align="right"><fmt:formatNumber value="${price }" /></td>
		<td width="50"  height="20" align="center">${orderProduct.discount }</td>
		<td width="60"  height="20" align="center">${orderProduct.suboptionName }</td>
		<c:set var="totPrice" value="${totPrice + price }"/>
	</tr>
	</c:forEach>
</table>
<table width="800" border="1" cellspacing="0" cellpadding="4" bordercolordark="white" bordercolorlight="black">
	<tr> 
	  <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">총금액</font></td>
		<td width="700" height="20" bgcolor="#EEEEEE" align="right"><font color="#142712" size="3"><b><fmt:formatNumber value="${totPrice }"/></b></font> 원&nbsp;&nbsp</td>
	</tr>
</table>

<br>
<table width="800" border="0" cellspacing="0" cellpadding="7">
	<tr> 
		<td align="center">
			<a href="${pageContext.servletContext.contextPath }/admin/order"><input type="button" value="이 전 화 면"></a>&nbsp
			<input type="button" value="프린트" onClick="javascript:print();">
		</td>
	</tr>
</table>
</div></div>
</body>
</html>
