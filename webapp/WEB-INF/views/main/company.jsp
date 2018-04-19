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
		<table class="content-sm content-center"><tr><td>
			<table border="0" cellpadding="0" cellspacing="0" width="690">
				<tr>
					<td align="left"><img src="${pageContext.servletContext.contextPath }/assets/images/company_title1.gif" border="0"></td>
				</tr>
				<tr><td height="10"></td></tr>
			</table>
			<table border="0" cellpadding="15" cellspacing="4" width="690" bgcolor="D0D8DF">
				<tr>
					<td bgcolor="white">
						<table border="0" cellpadding="0" cellspacing="0" width="652">
							<tr>
								<td class="content-text">
									<p>비트닷컴은 아주 오래전부터 현재의 비트닷컴 까지 수년여의 오랜 전통과 역사를 가지고 소비자분들의 격려와 믿음을 바탕으로 성장해온 전문 쇼핑몰 입니다.</p>
									<p>...</p>
									<p>편안한 쇼핑시간이 되시기를...</p>
									<p>감사합니다.</p>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<br><br><br>
			<table border="0" cellpadding="0" cellspacing="0" width="690">
				<tr>
					<td align="left"><img src="${pageContext.servletContext.contextPath }/assets/images/company_title2.gif" border="0"></td>
				</tr>
				<tr><td height="10"></td></tr>
			</table>
			<table border="0" cellpadding="15" cellspacing="4" width="690" bgcolor="D0D8DF">
				<tr>
					<td bgcolor="white">
						<table border="0" cellpadding="0" cellspacing="0" width="652">
							<tr>
								<td width="652" valign="top"  style="line-height:19px; text-align: center;">
									<img src="${pageContext.servletContext.contextPath }/assets/images/company_image1.gif" border="0">
								</td>
							</tr>
						</table>
					</td>
				</tr>
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