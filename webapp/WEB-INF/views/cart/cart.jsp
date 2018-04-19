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
			<table class="content-md content-center">
				<tr>
					<td>
					<table border="0" cellpadding="0" cellspacing="0" width="710" class="cmfont">
						<tr>
							<td style="text-align: left"><img src="${pageContext.servletContext.contextPath }/assets/images/cart_title1.gif" border="0"></td>
						</tr>
					</table>
		
					<table border="0" cellpadding="0" cellspacing="0" width="710">
						<tr><td height="10"></td></tr>
					</table>
		
					<table border="0" cellpadding="5" cellspacing="1" width="710" class="cmfont" bgcolor="#CCCCCC">
						<tr bgcolor="F0F0F0" height="23" class="cmfont">
							<td width="420" align="center">상품</td>
							<td width="70"  align="center">수량</td>
							<td width="80"  align="center">가격</td>
							<td width="90"  align="center">합계</td>
							<td width="50"  align="center">삭제</td>
						</tr>
						
						<c:set var="totPrice" value="${0 }"/>
						<c:forEach items="${carts }" var="cart">
						<tr>
							<form name="modify-cart-form" method="post" action="${pageContext.servletContext.contextPath }/cart/modify/${cart.productCode}/${cart.suboptionNo}">
							<td height="60" align="center" bgcolor="#FFFFFF">
								<table cellpadding="0" cellspacing="0" width="100%">
									<tr>
										<td width="60">
											<a href="${pageContext.servletContext.contextPath }/product/${cart.productCode}"><img src="${pageContext.servletContext.contextPath }${cart.imagePath}" width="50" height="50" border="0"></a>
										</td>
										<td class="cmfont">
											<a href="${pageContext.servletContext.contextPath }/product/${cart.productCode}">${cart.productName }</a><br>
											<font color="#0066CC">[${cart.optionName }]</font> ${cart.suboptionName }
										</td>
									</tr>
								</table>
							</td>
							<td align="center" bgcolor="#FFFFFF">
								<input type="number" name="amount" size="2" value="${cart.amount }" min="1" max="100" class="cmfont1">&nbsp<font color="#464646">개</font>
							</td>
							<td align="center" bgcolor="#FFFFFF"><font color="#464646"><fmt:formatNumber value="${cart.price }" /></font></td>
							<td align="center" bgcolor="#FFFFFF"><font color="#464646"><fmt:formatNumber value="${cart.amount * cart.price }" /></font></td>
							<c:set var="totPrice" value="${totPrice + (cart.amount * cart.price) }" />
							<td align="center" bgcolor="#FFFFFF">
								<input type="image" src="${pageContext.servletContext.contextPath }/assets/images/b_edit1.gif" border="0">&nbsp<br>
								<a href = "${pageContext.servletContext.contextPath }/cart/delete/${cart.productCode}/${cart.suboptionNo}">
									<img src="${pageContext.servletContext.contextPath }/assets/images/b_delete1.gif" border="0">
								</a>&nbsp
							</td>
							</form>
						</tr>
						</c:forEach>
						<c:if test="${not empty carts }">
						<tr>
							<td colspan="5" bgcolor="#F0F0F0">
								<table width="100%" border="0" cellpadding="0" cellspacing="0" class="cmfont">
									<tr>
										<td bgcolor="#F0F0F0"><img src="${pageContext.servletContext.contextPath }/assets/images/cart_image1.gif" border="0"></td>
										<td align="right" bgcolor="#F0F0F0">
											<font color="#0066CC"><b>총 합계금액</font></b> : 상품대금(<fmt:formatNumber value="${totPrice }" />) + 배송료(2,500원) = <font color="#FF3333"><b><fmt:formatNumber value="${totPrice + 2500 }" />원</b></font>&nbsp;&nbsp
										</td>
									</tr>
								</table>
							</td>
						</tr>
						</c:if>
					</table>
					<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
						<tr height="44">
							<td width="710" align="center" valign="middle">
								<a href="${pageContext.servletContext.contextPath }">
									<img src="${pageContext.servletContext.contextPath }/assets/images/b_shopping.gif" border="0">
								</a>&nbsp;&nbsp;
								<a href="${pageContext.servletContext.contextPath }/cart/clean">
									<img src="${pageContext.servletContext.contextPath }/assets/images/b_cartalldel.gif" width="103" height="26" border="0">
								</a>&nbsp;&nbsp;
								<a href="order"><img src="${pageContext.servletContext.contextPath }/assets/images/b_order1.gif" border="0"></a>
							</td>
						</tr>
					</table>
			</td>
			</tr>
			</table>
<!-------------------------------------------------------------------------------------------->	
<!-- 끝 : 다른 웹페이지 삽입할 부분                                                         -->
<!-------------------------------------------------------------------------------------------->	


		</td>
	</tr>
</table>
<br><br>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>