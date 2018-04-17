<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>쇼핑몰 관리자 홈페이지</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
	<script src="${ pageContext.servletContext.contextPath }/assets/js/jquery/jquery-1.9.0.js" type="text/javascript"></script>
	
</head>
<body bgcolor="white" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<br>
<jsp:include page="/WEB-INF/views/include/admin-menu.jsp"/>
<hr width='900' size='3'>

<body bgcolor="white" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<form name="modify-product-form" method="post" action="${pageContext.servletContext.contextPath }/admin/product/modify"
	  enctype="multipart/form-data">
<table width="800" border="1" cellspacing="0" cellpadding="3" bordercolordark="white" bordercolorlight="black">
	<tr height="23"> 
		<td width="100" bgcolor="#CCCCCC" align="center">상품분류</td>
    	<td width="700" bgcolor="#F2F2F2">
			<select name="categoryNo">
				<option value="0">상품분류를 선택하세요</option>
				<c:forEach items="${categories }" var="category" >
					<c:choose>
						<c:when test="${category.no != product.categoryNo }">
							<option value="${category.no }">${category.name }</option>
						</c:when>
						<c:otherwise>
							<option value="${category.no }" selected>${category.name }</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr height="23"> 
		<td width="100" bgcolor="#CCCCCC" align="center">상품코드</td>
		<td width="700"  bgcolor="#F2F2F2">
			<input type="text" name="code" value="${product.code }" size="20" maxlength="20" readonly>
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">상품명</td>
		<td width="700"  bgcolor="#F2F2F2">
			<input type="text" name="name" value="${product.name }" size="60" maxlength="60">
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">제조사</td>
		<td width="700"  bgcolor="#F2F2F2">
			<input type="text" name="maker" value="${product.maker }" size="30" maxlength="30">
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">판매가</td>
		<td width="700"  bgcolor="#F2F2F2">
			<input type="text" name="price" value="${product.price }" size="12" maxlength="12"> 원
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">옵션</td>
    <td width="700"  bgcolor="#F2F2F2">
			<select name="optionNo">
    			<option value="0" >옵션선택</option>
    		<c:forEach items="${options }" var="option">
    			<c:choose>
					<c:when test="${option.no != product.optionNo }">
						<option value="${option.no }">${option.name }</option>
					</c:when>
					<c:otherwise>
						<option value="${option.no }" selected>${option.name }</option>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			</select>
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">제품설명</td>
		<td width="700"  bgcolor="#F2F2F2">
			<textarea name="description" rows="4" cols="70">${product.description }</textarea>
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">상품상태</td>
    	<td width="700"  bgcolor="#F2F2F2">
    		<c:choose>
	    		<c:when test="${product.state eq 'sale' }">
	    			<input type="radio" name="state" value="sale" checked> 판매중
					<input type="radio" name="state" value="not-sale"> 판매중지
					<input type="radio" name="state" value="sold-out"> 품절
	    		</c:when>
	    		<c:when test="${product.state eq 'not-sale' }">
	    			<input type="radio" name="state" value="sale" > 판매중
					<input type="radio" name="state" value="not-sale" checked /> 판매중지
					<input type="radio" name="state" value="sold-out" /> 품절
	    		</c:when>
	    		<c:otherwise>
	    			<input type="radio" name="state" value="sale" > 판매중
					<input type="radio" name="state" value="not-sale"> 판매중지
					<input type="radio" name="state" value="sold-out" checked> 품절
	    		</c:otherwise>
    		</c:choose>
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">아이콘</td>
		<td width="700"  bgcolor="#F2F2F2">
			<c:choose>
				<c:when test="${product.newItem eq true }">
					<input type="checkbox" name="newItem" value="1" checked> New &nbsp;&nbsp
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="newItem" value="1"> New &nbsp;&nbsp
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${product.hitItem eq true }">
					<input type="checkbox" name="hitItem" value="1" checked> Hit &nbsp;&nbsp
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="hitItem" value="1"> Hit &nbsp;&nbsp
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${product.saleItem eq true }">
					<input type="checkbox" name="saleItem" value="1" onclick="forms['modify-product-form'].discount.disabled=!forms['modify-product-form'].discount.disabled;" checked> Sale &nbsp;&nbsp
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="saleItem" value="1" onclick="forms['modify-product-form'].discount.disabled=!forms['modify-product-form'].discount.disabled;"> Sale &nbsp;&nbsp
				</c:otherwise>
			</c:choose>
			할인율 : <input type="number" name="discount" value="${product.discount }" size="3" maxlength="3" min="0" max="100" step="10" disabled> %
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">등록일</td>
		<td width="700"  bgcolor="#F2F2F2">
			<input type="text" name="regday1" value="${product.regDate }" size="10" readonly>
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">이미지</td>
		<td width="700"  bgcolor="#F2F2F2">

			<table border="0" cellspacing="0" cellpadding="0" align="left">
				<tr>
					<td>
						<table width="390" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td>
									<input type='hidden' name='del-img' value='${product.imagePath1 }'>
									&nbsp;<input type="checkbox" name="delImg" value="0" > <b>이미지1</b>: ${fn:split(product.imagePath1, '/')[3] }									<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="file" id="img1" name="image" size="20" value="찾아보기">
								</td>
							</tr> 
							<tr>
								<td>
									<input type='hidden' name='del-img' value='${product.imagePath2 }'>
									&nbsp;<input type="checkbox" name="delImg" value="1" > <b>이미지2</b>: ${fn:split(product.imagePath2, '/')[3] }
									<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="file" id="img2" name="image" size="20" value="찾아보기">
								</td>
							</tr> 
							<tr>
								<td>
									<input type='hidden' name='del-img' value='${product.imagePath3 }'>
									&nbsp;<input type="checkbox" name="delImg" value="2"> <b>이미지3</b>: ${fn:split(product.imagePath3, '/')[3] }
									<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="file" id="img3" name="image" size="20" value="찾아보기">
								</td>
							</tr> 
							<tr>
								<td><br>&nbsp;&nbsp;&nbsp;※ 삭제할 그림은 체크를 하세요.</td>
							</tr> 
				  	</table>
						<br><br><br><br><br>
						<table width="390" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td  valign="middle">&nbsp;
									<img id="img-view1" src="${pageContext.servletContext.contextPath }${product.imagePath1}" width="50" height="50" border="1" style='cursor:hand' onclick="imageView(this)">&nbsp;
									<img id="img-view2" src="${pageContext.servletContext.contextPath }${product.imagePath2}" width="50" height="50" border="1" style='cursor:hand' onclick="imageView(this)">&nbsp;
									<img id="img-view3" src="${pageContext.servletContext.contextPath }${product.imagePath3}" width="50" height="50" border="1" style='cursor:hand' onclick="imageView(this)">&nbsp;
								</td>
							</tr>				 
						</table>
					</td>
					<td>
						<td align="right" width="310"><img id="big-img" name="big" src="${pageContext.servletContext.contextPath }${product.imagePath1}" width="300" height="300" border="1"></td>
					</td>
				</tr>
			</table>

		</td>
	</tr>
</table>

<br>
<table width="800" border="0" cellspacing="0" cellpadding="5">
	<tr> 
		<td align="center">
			<input type="submit" value="수정하기"> &nbsp;&nbsp
			<a href="${pageContext.servletContext.contextPath }/admin/product"><input type="button" value="이전화면"></a>
		</td>
	</tr>
</table>
</form>
<script type="text/javascript">
	function imageView(obj){
		document.getElementById('big-img').src = obj.src;
	}
	
	function imagePreview(e, obj) {
		obj.src = e.target.result;
	}
	
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
		
				
		if( sale.checked ){
			document.forms['modify-product-form'].discount.disabled=!document.forms['modify-product-form'].discount.disabled;
		}
		
	}
</script>
</body>
</html>
