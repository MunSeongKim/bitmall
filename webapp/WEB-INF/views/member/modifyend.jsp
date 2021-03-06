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
			<table id="content-user-item">
				<tr>
					<td id="content-user-subtitle" class="cmfont">
						<img src="${pageContext.servletContext.contextPath }/assets/images/member_edit.gif" />
					</td>
				</tr>
				<tr>
					<td id="content-user-result">
						<table>
							<tr>
								<td class="content-user-result-title">
									Congratulation !!!
								</td>
							</tr>
							<tr>
								<td class="content-text">
									<p>수정완료</p>
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
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>