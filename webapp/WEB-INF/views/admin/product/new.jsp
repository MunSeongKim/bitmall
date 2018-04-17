<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>쇼핑몰 관리자 홈페이지</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="white" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<br>
<jsp:include page="/WEB-INF/views/include/admin-menu.jsp"/>
<hr width='900' size='3'>
<form name="new-product-form" method="POST" action="#" enctype="multipart/form-data">
<table width="800" border="1" cellspacing="0" cellpadding="3" bordercolordark="white" bordercolorlight="black">
	<tr height="23"> 
		<td width="100" bgcolor="#CCCCCC" align="center">상품분류</td>
    <td  width="700" bgcolor="#F2F2F2">
			<select name="categoryNo">
				<option value="0" selected>상품분류를 선택하세요</option>
				<c:forEach items="${categories }" var="category" >
					<option value="${category.no }">${category.name }</option>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr height="23"> 
		<td width="100" bgcolor="#CCCCCC" align="center">상품코드</td>
		<td  width="700" bgcolor="#F2F2F2">
			<input type="text" name="code" value="" size="20" maxlength="20">
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">상품명</td>
		<td  width="700" bgcolor="#F2F2F2">
			<input type="text" name="name" value="" size="60" maxlength="60">
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">제조사</td>
		<td  width="700" bgcolor="#F2F2F2">
			<input type="text" name="maker" value="" size="30" maxlength="30">
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">판매가</td>
		<td  width="700" bgcolor="#F2F2F2">
			<input type="number" name="price" value="0" min="0" max="999999999" size="12" maxlength="12"> 원
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">옵션</td>
    <td  width="700" bgcolor="#F2F2F2">
    		<select name="optionNo">
    			<option value="0" selected>옵션선택</option>
    		<c:forEach items="${options }" var="option">
				<option value="${option.no }">${option.name }</option>
			</c:forEach>
			</select>
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">제품설명</td>
		<td  width="700" bgcolor="#F2F2F2">
			<textarea name="description" rows="10" cols="80"></textarea>
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">상품상태</td>
    <td  width="700" bgcolor="#F2F2F2">
			<input type="radio" name="state" value="sale" checked> 판매중
			<input type="radio" name="state" value="not-sale"> 판매중지
			<input type="radio" name="state" value="sold-out"> 품절
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">아이콘</td>
		<td  width="700" bgcolor="#F2F2F2">
			<input type="checkbox" name="newItem" value="1"> New &nbsp;&nbsp	
			<input type="checkbox" name="hitItem" value="1"> Hit &nbsp;&nbsp	
			<input type="checkbox" name="saleItem" value="1" onclick="forms['new-product-form'].discount.disabled=!forms['new-product-form'].discount.disabled;"> Sale &nbsp;&nbsp
			할인율 : <input type="number" name="discount" value="0" size="3" maxlength="3" min="0" max="100" step="10" disabled> %
		</td>
	</tr>
	<tr> 
		<td rowspan="2" width="100" bgcolor="#CCCCCC" align="center">이미지</td>
		<td width="700" bgcolor="#F2F2F2">
			<b>이미지1</b>: <input type="file" id="img1" name="image" size="30" value="찾아보기"><br>
			<b>이미지2</b>: <input type="file" id="img2" name="image" size="30" value="찾아보기"><br>
			<b>이미지3</b>: <input type="file" id="img3" name="image" size="30" value="찾아보기"><br>
		</td>
	</tr>
	<tr> 
		<td>
		<table width="390" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td valign="middle">
					<img id="img-view1" width="50" height="50" border="1" src="" alt="이미지1 미리보기">&nbsp;
					<img id="img-view2" width="50" height="50" border="1" src="" alt="이미지2 미리보기">&nbsp;
					<img id="img-view3" width="50" height="50" border="1" src="" alt="이미지3 미리보기">&nbsp;
				</td>
			</tr>				 
		</table>
		</td>
	</tr>
</table>
<br>
<table width="800" border="0" cellspacing="0" cellpadding="7">
	<tr> 
		<td align="center">
			<input type="submit" value="등록하기">
			<a href="${pageContext.servletContext.contextPath }/admin/product"><input type="button" value="이전화면"></a>
		</td>
	</tr>
</table>
</form>
<script type="text/javascript">
window.onload = function() {
	var discount = document.getElementsByName('discount')[0];
	discount.onchange = function() {
		if(this.value > 100 ){
			this.value = 100;
		}
		
		if(this.value === ""){
			this.value = 10;
		}
	};
	
	var sale = document.getElementsByName('saleItem')[0];
	sale.onchange = function() {
		if( !this.checked ) {
			discount.value = 0;
		}
	};
	document.getElementById('img1').onchange = function() {
		if (this.files[0]) {
			var reader = new FileReader();
			reader.readAsDataURL(this.files[0]);
			reader.onload = function(e) {
				document.getElementById('img-view1').src = e.target.result;
			}
		}
	};
	
	document.getElementById('img2').onchange = function() {
		if (this.files[0]) {
			var reader = new FileReader();
			reader.readAsDataURL(this.files[0]);
			reader.onload = function(e) {
				document.getElementById('img-view2').src = e.target.result;
			}
		}
	};
	
	document.getElementById('img3').onchange = function() {
		if (this.files[0]) {
			var reader = new FileReader();
			reader.readAsDataURL(this.files[0]);
			reader.onload = function(e) {
				document.getElementById('img-view3').src = e.target.result;
			}
		}
	};
};
</script>
</body>
</html>
