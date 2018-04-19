<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/include/head.jsp"/>
<jsp:include page="/WEB-INF/views/include/navigation.jsp"/>
<!-- Main Content -->
<table id="content">
	<tr>
		<td id="content-main">
		<!-------------------------------------------------------------------------------------------->	
		<!-- 시작 : 다른 웹페이지 삽입할 부분                                                                                                                                                            -->
		<!-------------------------------------------------------------------------------------------->	
			<!---- 화면 우측(로그인) S -------------------------------------------------->
			<table class="content-center">
				<tr>
					<td width="120" align="center"><img src="${pageContext.servletContext.contextPath }/assets/images/login_image1.gif" width="110" height="90" border="0"></td>
					<td width="320">
						<table border="0" cellpadding="0" cellspacing="0" width="320">
							<tr>
								<td height="35">
									<p style="padding-left:10px;"><img src="${pageContext.servletContext.contextPath }/assets/images/login_image2.gif" width="220" height="21" border="0"></p>
								</td>
							</tr>
						</table>
						<table border="0" cellpadding="0" cellspacing="0" width="320">
							<!-- form 시작 ------>
							<form name = "form" method = "post" action = "${pageContext.servletContext.contextPath }/member/auth">
							<tr>
								<td width="220" height="25">
									<p style="padding-left:10px;">
									<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/login_id.gif" width="40" height="13" border="0"> 
									<input type="text" name="id" size="20" maxlength="12" class="cmfont1">
									</p>
								</td>
								<td width="100" rowspan="2">
									<input type="image" align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/b_login.gif" width="50" border="0">
								</td>
							</tr>
							<tr>
								<td width="220" height="25">
									<p style="padding-left:10px;">
									<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/login_pw.gif" width="40" height="13" border="0"> 
									<input type="password" name="password" size="20" maxlength="12" class="cmfont1">
									</p>
								</td>
							</tr>
							<tr>
								<td width="220" height="25" align="center">
								<c:if test='${ result eq "fail" }' >
									<p style="padding-left: 10px;">로그인이 실패 했습니다.</p>
								</c:if>
								</td>
							</tr>
							</form>
							<!--form 끝 ------>
						</table>
					</td>
				</tr>
			</table>
			<hr />
			<table class="content-center">
				<tr>
					<td align="center">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td height="30"><img src="${pageContext.servletContext.contextPath }/assets/images/login_image6.gif" border="0"></td>
								<td height="30">
									<a href="#" onfocus="this.blur()"><img src="${pageContext.servletContext.contextPath }/assets/images/b_id.gif" width="64" height="19" border="0" align="absmiddle"></a> &nbsp; 
									<a href="#" onfocus="this.blur()"><img src="${pageContext.servletContext.contextPath }/assets/images/b_pw.gif" width="64" height="19" border="0" align="absmiddle"></a>
								</td>
							</tr>
						</table>												
					</td>
				</tr>
			</table>
		<!-------------------------------------------------------------------------------------------->	
		<!-- 끝 : 다른 웹페이지 삽입할 부분                                                                                                                                                              -->
		<!-------------------------------------------------------------------------------------------->	
		</td>
	</tr>
</table>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>