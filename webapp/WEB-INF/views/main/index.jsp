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
		<!---- 화면 우측 제목 -------------------------------------------------->
			<table id="content-main-title">
				<tr>
					<td>
						<h1><span class="highlight">New</span> Arrival</h1>
					</td>
				</tr>
			</table>
		<!-------------------------------------------------------------------------------------------->	
		<!-- 시작 : 다른 웹페이지 삽입할 부분                                                                                                                                                            -->
		<!-------------------------------------------------------------------------------------------->	
		<!---- 화면 우측 내용 -------------------------------------------------->
			<c:set var="count" value="${fn:length(newProducts)}" />
			<table id="content-main-item">
				<!---1번째 줄-->
				<c:forEach var="row" begin="0" end="${count / 3 }">
				<tr>
					<c:forEach var="col" begin="0" end="3">
						<c:set var="itemIdx" value="${(row*4)+col }"/>
						<c:if test="${itemIdx lt count }">
						<td class="content-items">
							<table class="content-items-table cmfont">
								<tr> 
									<td class="content-items-img"> 
										<a href="${pageContext.servletContext.contextPath }/product/${newProducts[itemIdx].code }">
											<img src="${pageContext.servletContext.contextPath }${newProducts[itemIdx].imagePath1}" alt="item1" />
										</a>
									</td>
								</tr>
								<tr> 
									<td class="content-items-title">
										<a href="${pageContext.servletContext.contextPath }/product/${newProducts[itemIdx].code }">${newProducts[itemIdx].name }</a>
										<img src="${pageContext.servletContext.contextPath }/assets/images/i_new.gif"/>
										<c:if test="${newProducts[itemIdx].hitItem eq true }">
											<img src="${pageContext.servletContext.contextPath }/assets/images/i_hit.gif" />
										</c:if>
										<c:if test="${newProducts[itemIdx].saleItem eq true }">
											<img src="${pageContext.servletContext.contextPath }/assets/images/i_sale.gif" >
										</c:if>
									</td>
								</tr>
								<tr>
									<c:choose>
										<c:when test="${newProducts[itemIdx].saleItem eq true and newProducts[itemIdx].discount gt 0 }">
											<td class="content-items-price" style="text-decoration: strike; color: #999"><fmt:formatNumber value="${newProducts[itemIdx].price }" /></td>
											<td class="content-items-price"><fmt:formatNumber value="${newProducts[itemIdx].price * (1-(newProducts[itemIdx].discount / 100)) }" /></td>
										</c:when>
										<c:otherwise>
											<td class="content-items-price"><fmt:formatNumber value="${newProducts[itemIdx].price }" /></td>
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
			<!---- 화면 우측(신상품) 끝 -------------------------------------------------->	
		<!-------------------------------------------------------------------------------------------->	
		<!-- 끝 : 다른 웹페이지 삽입할 부분                                                                                                                                                              -->
		<!-------------------------------------------------------------------------------------------->
		</td>
	</tr>
</table>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>