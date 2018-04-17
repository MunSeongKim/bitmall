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
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/head.jsp"/>
<jsp:include page="/WEB-INF/views/include/search.jsp"/>
<!-- Main content -->
<table id="content">
	<tr>
		<td id="nav">
			<jsp:include page="/WEB-INF/views/include/navigation.jsp"/>
		</td>
		<td id="content-main">
		<!---- 화면 우측 제목 -------------------------------------------------->
			<table id="content-main-title">
				<tr>
					<td>
						<img src="${pageContext.servletContext.contextPath }/assets/images/product_title3.gif">
					</td>
				</tr>
			</table>
<!-------------------------------------------------------------------------------------------->	
<!-- 시작 : 다른 웹페이지 삽입할 부분                                                       -->
<!-------------------------------------------------------------------------------------------->	

      <!-- 하위 상품목록 -->
			<c:set var="count" value="${fn:length(products) + 11 }" />
			<!-- form2 시작 -->
			<form name="product-sort-form" method="GET" action="${pageContext.servletContext.contextPath }/product/${category.no }">

			<table border="0" cellpadding="0" cellspacing="5" width="767" class="cmfont" bgcolor="#efefef">
				<tr>
					<td bgcolor="white" align="center">
						<table border="0" cellpadding="0" cellspacing="0" width="751" class="cmfont">
							<tr>
								<td align="center" valign="middle">
									<table border="0" cellpadding="0" cellspacing="0" width="730" height="40" class="cmfont">
										<tr>
											<td width="500" class="cmfont">
												<font color="#C83762" class="cmfont"><b>${category.name }</b></font>&nbsp
											</td>
											<td align="right" width="274">
												<table width="100%" border="0" cellpadding="0" cellspacing="0" class="cmfont">
													<tr>
														<td align="right"><font color="EF3F25"><b>${count }</b></font> 개의 상품.&nbsp;&nbsp;&nbsp</td>
														<td width="100">
															<select name="sort" size="1" class="cmfont" onChange="product-sort-form.submit()">
																<option value="new" selected>신상품순 정렬</option>
																<option value="expensive">고가격순 정렬</option>
																<option value="cheap">저가격순 정렬</option>
																<option value="name">상품명 정렬</option>
															</select>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			</form>
			<!-- form2 -->

			<table border="0" cellpadding="0" cellspacing="0">
				<!--- 1 번째 줄 -->
				<!-- item index = (row * 5 + col) ${fn:length(products) / 5 }-->
				<c:forEach var="row" begin="0" end="${count / 4 }">
				<tr>
					<c:forEach var="col" begin="0" end="4">
					<c:set var="itemIdx" value="${(row*5)+col }"/>
						<c:if test="${itemIdx lt count }">
						<td width="150" height="205" align="center" valign="top">
							<table border="0" cellpadding="0" cellspacing="0" width="100" class="cmfont">
								<tr> 
									<td align="center"> 
										<a href="${pageContext.servletContext.contextPath }/product/${products[itemIdx].code}">
										<img src="${pageContext.servletContext.contextPath }${products[itemIdx].imagePath1}" width="120" height="140" border="0">
										</a>
									</td>
								</tr>
								<tr><td height="5"></td></tr>
								<tr> 
									<td height="20" align="center">
										<a href="${pageContext.servletContext.contextPath }/product/${products[itemIdx].code}"><font color="444444">${products[itemIdx].name }</font></a>&nbsp; 
										<c:if test="${products[itemIdx].hitItem eq true }">
												<img src="${pageContext.servletContext.contextPath }/assets/images/i_new.gif"/>
										</c:if>
										<c:if test="${products[itemIdx].hitItem eq true }">
											<img src="${pageContext.servletContext.contextPath }/assets/images/i_hit.gif" />
										</c:if>
										<c:if test="${products[itemIdx].saleItem eq true }">
											<img src="${pageContext.servletContext.contextPath }/assets/images/i_sale.gif" >
										</c:if> 
									</td>
								</tr>
								<tr>
								<c:choose>
									<c:when test="${products[itemIdx].saleItem eq true and products[itemIdx].discount gt 0 }">
										<td height="20" align="center" style="text-decoration: strike; color: #999"><fmt:formatNumber value="${products[itemIdx].price }" /></td>
										<td height="20" align="center"><fmt:formatNumber value="${products[itemIdx].price * (1-(products[itemIdx].discount / 100)) }" /> 원</td>
									</c:when>
									<c:otherwise>
										<td height="20" align="center"><fmt:formatNumber value="${products[itemIdx].price }" /> 원</td>
									</c:otherwise>
								</c:choose>
								</tr>
							</table>
						</td>
						</c:if>
					</c:forEach>
				</tr>
				</c:forEach>
			</table>

			<table border="0" cellpadding="0" cellspacing="0" width="690">
				<tr>
					<td height="40" class="cmfont" align="center">
						<img src="${pageContext.servletContext.contextPath }/assets/images/i_prev.gif" align="absmiddle" border="0"> 
						<font color="#FC0504"><b>1</b></font>&nbsp;
						<a href="product.jsp?code1=1&code2=1"><font color="#7C7A77">[2]</font></a>&nbsp;
						<a href="product.jsp?code1=1&code2=1"><font color="#7C7A77">[3]</font></a>&nbsp;
						<img src="${pageContext.servletContext.contextPath }/assets/images/i_next.gif" align="absmiddle" border="0">
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