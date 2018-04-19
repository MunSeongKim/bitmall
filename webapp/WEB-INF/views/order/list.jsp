<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/include/head.jsp"/>
<jsp:include page="/WEB-INF/views/include/navigation.jsp"/>
<!-- Main content -->
<table id="content">
	<tr>
		<td id="content-main">
<!-------------------------------------------------------------------------------------------->	
<!-- 시작 : 다른 웹페이지 삽입할 부분                                                       -->
<!-------------------------------------------------------------------------------------------->	
		<table class="content-sm content-center">
			<tr><td>
			
			<table border="0" cellpadding="0" cellspacing="0" width="690">
				<tr>
					<td align="left"><img src="${pageContext.servletContext.contextPath }/assets/images/jumun_title1.gif" border="0" align="absmiddle"></td>
				</tr>
				<tr><td height="10"></td></tr>
			</table>

			<table border="0" cellpadding="0" cellspacing="0" width="685" class="cmfont">
				<tr><td colspan="5" height="3" bgcolor="#0066CC"></td></tr>
				<tr bgcolor="F2F2F2">
					<td width="80" height="30" align="center">주문일</td>
					<td width="100"  align="center">주문번호</td>
					<td width="290" align="center">제품명</td>
					<td width="100" align="center">금액</td>
					<td width="115" align="center">주문상태</td>
				</tr>
				<tr><td colspan="5" bgcolor="DEDCDD"></td></tr>
				<!-- 주문 ROW -->
				<c:forEach items="${orders }" var="order">
				<tr>
					<td height="30" align="center"><font color="686868">${order.regDate }</font></td>
					<td align="center">
						<a href="${pageContext.servletContext.contextPath }/order/${order.no}"><font color="#0066CC">${order.no }</font></a>
					</td>
					<td><font color="686868">${order.name }
					<c:if test="${order.count gt 1 }">외 ${order.count -1 }</c:if>
					</font></td>
					<td align="right"><font color="686868"><fmt:formatNumber value="${order.totPrice }"/></font></td>
					<td align="center"><font color="#0066CC">${order.state }</font></td>
				</tr>
				<tr><td colspan="5" background="${pageContext.servletContext.contextPath }/assets/images/line_dot.gif"></td></tr>
				</c:forEach>
				<tr><td colspan="5" height="2" bgcolor="#0066CC"></td></tr>
			</table>
			
			</td></tr></table>
<!-------------------------------------------------------------------------------------------->	
<!-- 끝 : 다른 웹페이지 삽입할 부분                                                         -->
<!-------------------------------------------------------------------------------------------->	
		</td>
	</tr>
</table>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>