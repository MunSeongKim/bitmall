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
		<table class="content-sm content-center" style="text-align: left"><tr><td>
			<table border="0" cellpadding="0" cellspacing="0" width="690">
				<tr>
					<td align="left"><img src="${pageContext.servletContext.contextPath }/assets/images/useinfo_title1.gif" border="0"></td>
				</tr>
			</table>
			<br>
			<!-- 1 -->
			<table border="0" cellpadding="0" cellspacing="0" width="690" class="cmfont">
				<tr>
					<td width="30"><font color="8B9CBF"><b>(1)</b></td>
					<td><font color="8B9CBF"><b>회원 가입은 어떻게 하나요?</b></font></td>
				</tr>
				<tr><td height="10" colspan="2"></td></tr>
				<tr>
					<td width="30"></td>
					<td>
						<font color="4B4B4B">
						<p>누구나 비트닷컴 인터넷 쇼핑몰의 회원이 되실 수 있습니다.</p>
						<p> 비트닷컴 인터넷 쇼핑몰 상단에 있는 회원가입 버튼을 선택 하신 후 등록을 해주시면, 바로 회원으로 가입이 됩니다.</p></font>
					</td>
				</tr>
				<tr><td height="10" colspan="2"></td></tr>
			</table>
			<!-- 2 -->
			<table border="0" cellpadding="0" cellspacing="0" width="690" class="cmfont">
				<tr>
					<td width="30"><font color="8B9CBF"><b>(2)</b></td>
					<td><font color="8B9CBF"><b>상품구매 방법은?</b></font></td>
				</tr>
				<tr><td height="10" colspan="2"></td></tr>
				<tr>
					<td width="30"></td>
					<td>
						<font color="4B4B4B">. . .</font>
					</td>
				</tr>
				<tr><td height="10" colspan="2"></td></tr>
			</table>
			<!-- 3 -->
			<table border="0" cellpadding="0" cellspacing="0" width="690" class="cmfont">
				<tr>
					<td width="30"><font color="8B9CBF"><b>(3)</b></td>
					<td><font color="8B9CBF"><b>ID와 Passward를 잊어버렸을 경우는 ?</b></font></td>
				</tr>
				<tr><td height="10" colspan="2"></td></tr>
				<tr>
					<td width="30"></td>
					<td>
						<font color="4B4B4B">. . .</font>
					</td>
				</tr>
				<tr><td height="10" colspan="2"></td></tr>
			</table>
		</td></tr></table>
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