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
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
<div class="bg">
<jsp:include page="/WEB-INF/views/include/admin-menu.jsp"/>

<table class="admin">
	<tr>
		<td class="admin-title">회원수 : <font color="#FF0000">${fn:length(members) }</font></td>
	</tr>
	<tr bgcolor="#CCCCCC" height="23"> 
		<td width="100" align="center">ID</td>
		<td width="100" align="center">이름</td>
		<td width="100" align="center">전화</td>
		<td width="100" align="center">핸드폰</td>
		<td width="200" align="center">E-Mail</td>
		<td width="100" align="center">회원구분</td>
		<td width="100" align="center">수정/삭제</td>
	</tr>

	<c:forEach var="member" items="${members }" varStatus="status">
	<tr class="member" bgcolor="#F2F2F2" height="23">	
		<td class="${member.id }" width="100">${member.id }</td>	
		<td class="${member.id }" width="100">${member.name }</td>	
		<td width="100">${member.tel }</td>	
		<td width="100">${member.phone }</td>	
		<td width="200">${member.email }</td>	
		<c:choose>
			<c:when test="${member.classify eq 'user' }">
				<td class="${member.id }" width="100" align="center">회원</td>
			</c:when>
			<c:otherwise>
				<td class="${member.id }" width="100" align="center">관리자</td>
			</c:otherwise>
		</c:choose>
		<td width="100" align="center">
			<a class="${member.id }" onclick="modify_classify(this);">수정</a>/
			<a href="#">삭제</a>
		</td>
	</tr>
	</c:forEach>
</table>

<div id="dialog-modify-form" title="회원정보 수정" style="display:none;">
	<strong>ID</strong>
	<p class="validateTips id"></p>
	<strong>이름</strong>
	<p class="validateTips name"></p>
	<strong>회원구분</strong>
	<form>
		<select name="classify">
			<option value="admin">관리자</option>
			<option value="user">회원</option>
		</select>
		<input type="hidden" name="id" id="hidden-id" value="">
	</form>
	<p class="validateTips error" style="display:none"></p>
</div>
<div id="dialog-message" title="">
  <p></p>
</div>
</div>


<script type="text/javascript">
	
	function modify_classify(obj){
		var selector = "td." + $(obj).attr("class");
		var dataTarget = $(selector);
		$('.validateTips.id').text(dataTarget[0].innerText);
		$('.validateTips.name').text(dataTarget[1].innerText);
		if( dataTarget[2].innerText === "관리자") {
			$('select[name="classify"]').val("admin");
		} else {
			$('select[name="classify"]').val("user");
		}
		modifyDialog.dialog('open');
	}
	
	var modifyDialog = $( "#dialog-modify-form" ).dialog({
		autoOpen: false,
		width: 350,
		modal: true,
		position: { my: "center", at: "center", of: "body" },
		draggable: false,
		resizable: false,
		buttons: {
			"저장": function() {
				var id = $('.validateTips.id').text();
				var classify = $('select[name="classify"]').val();
			// Ajax - request to modify
				$.ajax({
					url: '${ pageContext.servletContext.contextPath }/api/member/modify',
					type: 'POST',
					dataType: 'json',
					data: {"id": id, "classify": classify},
					success: function(response) {
						if( response.result == "fail"){
							console.warn(response);
							return ;
						}
						
						console.log(response.data);
						
						if( response.data == false ){
							$(".validateTips.error").text("저장에 실패했습니다.").show();
							return ;
						}
						
						$('td.'+id).last().text($('option[value="'+classify+'"]').text());
						modifyDialog.dialog("close");
					}
				});
			},
			"취소": function() {
				modifyDialog.dialog("close");
			}
		},
		close: function() {
			modifyDialog.dialog("close");
		}
	});
</script>
</body>
</html>