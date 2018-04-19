<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<TITLE> 비트닷컴 쇼핑몰</TITLE>
<META HTTP-EQUIV="content-type" content="text/html; charset=utf-8">
<link href="${pageContext.servletContext.contextPath }/assets/css/admin.css" rel="stylesheet" type="text/css">
<script src="${ pageContext.servletContext.contextPath }/assets/js/jquery/jquery-1.9.0.js" type="text/javascript"></script>
</head>

<body onLoad="focus_it()">

<form name="form1" action="${pageContext.servletContext.contextPath }/admin/auth" method="POST">
<div class="bg">
<table class="login-center login" width='330' cellpadding='4' cellspacing='0'>
	<tr>
		<td>
			<table border="0" width="330" cellpadding='0' cellspacing='0' class="">
				<tr>
					<td width="324" colspan="2" bgcolor='#F0E8C6' height="42" align='center'>
            			<b>쇼핑몰 운영자 관리</b>
	        		</td>
			  	</tr>
				<tr>
					<td width="106" align="right">&nbsp;<img src="${pageContext.servletContext.contextPath }/assets/images/admin/id.gif" width="20" border="0"></td>
					<td width="212" >&nbsp;<input type="text" name="adminid" maxlength="12" size="14" value="${authMember.id }" readonly></td>
				</tr>
			    <tr>
					<td width="106" align="right">&nbsp;<img src="${pageContext.servletContext.contextPath }/assets/images/admin/pw.gif" width="75" border="0"></td>
					<td width="212" >
		          		&nbsp;<input type="password" name="adminpw" maxlength="12" size="14">
					</td>
			    </tr>
			    <c:if test='${ result eq "fail" }' >
			    <tr>
			    	<td width="324" colspan="2" align='center'>
						<p style="padding-left: 10px;">로그인이 실패 했습니다.</p>
			    	</td>
			    </tr>
			    </c:if>
				<tr>
					<td width="324" colspan="2" align='center'>
						<input type="image" src="${pageContext.servletContext.contextPath }/assets/images/admin/login.gif" width="72" height="30" border="0">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</div>
</form>
<script type="text/javascript">
	function focus_it() {
		$('input[name="adminpw"]').focus();
	}
</script>
</body>
</html>
