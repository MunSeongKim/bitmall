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
		<table class="content-cart"><tr><td>
			<table border="0" cellpadding="0" cellspacing="0" width="710">
				<tr>
					<td align="left"><img src="${pageContext.servletContext.contextPath }/assets/images/order_title1.gif" width="65" height="15" border="0"></td>
				</tr>
				<tr><td height="10"></td></tr>
			</table>
			
			
			<table border="0" cellpadding="5" cellspacing="1" width="710" class="cmfont" bgcolor="#CCCCCC">
				<tr bgcolor="F0F0F0" height="23" class="cmfont">
					<td width="440" align="center">상품</td>
					<td width="70"  align="center">수량</td>
					<td width="100" align="center">가격</td>
					<td width="100" align="center">합계</td>
				</tr>
				<c:if test="${not empty orderProducts }">
				<c:set var="totPrice" value="${0}" />
				<c:forEach items="${orderProducts }" var="orderProduct">
				<tr bgcolor="#FFFFFF">
					<td height="60" align="center">
						<table cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td width="60">
									<a href="${pageContext.servletContext.contextPath }/product/${orderProduct.productCode}"><img src="${pageContext.servletContext.contextPath }${orderProduct.imagePath}" width="50" height="50" border="0"></a>
								</td>
								<td class="cmfont">
									<a href="${pageContext.servletContext.contextPath }/product/${orderProduct.productCode}"><font color="#0066CC">${orderProduct.productName }</font></a><br>
									[${orderProduct.optionName }]</font> ${orderProduct.suboptionName }
								</td>
							</tr>
						</table>
					</td>
					<td align="center"><font color="#464646">${orderProduct.amount }개</font></td>
					<td align="center"><font color="#464646"><fmt:formatNumber value="${orderProduct.price }" /></font> 원</td>
					<td align="center"><font color="#464646"><fmt:formatNumber value="${orderProduct.amount * orderProduct.price }" /></font> 원</td>
					<c:set var="totPrice" value="${totPrice + (orderProduct.amount * orderProduct.price) }" />
				</tr>
				</c:forEach>
				<tr>
					<td colspan="5" bgcolor="#F0F0F0">
						<table width="100%" border="0" cellpadding="0" cellspacing="0" class="cmfont">
							<tr>
								<td bgcolor="#F0F0F0"><img src="${pageContext.servletContext.contextPath }/assets/images/cart_image1.gif" border="0"></td>
								<td align="right" bgcolor="#F0F0F0">
									<font color="#0066CC"><b>총 합계금액</font></b> : 상품대금(<fmt:formatNumber value="${totPrice }" />) + 배송료(2,500원) = <font color="#FF3333"><b><fmt:formatNumber value="${totPrice + 2500}" /> 원</b></font>&nbsp;&nbsp
								</td>
							</tr>
						</table>
					</td>
				</tr>
				</c:if>
			</table>
			<br><br>

			<!-- 주문자 정보 -->
			<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
				<tr height="3" bgcolor="#CCCCCC"><td></td></tr>
			</table>

			<!-- order-index-form 시작  -->
			<form name="order-index-form" method="post" action="order/pay">
			<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
				<tr>
					<td align="left" valign="top" width="150" STYLE="padding-left:45;padding-top:5">
						<font size="2" color="#B90319"><b>주문자 정보</b></font>
					</td>
					<td align="center" width="560">

						<table width="560" border="0" cellpadding="0" cellspacing="0" class="cmfont">
							<tr height="25">
								<td width="150"><b>주문자 성명</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="text"   name="orderName" size="20" maxlength="10" value="${member.member.name }" class="cmfont1">
								</td>
							</tr>
							<tr height="25">
								<td width="150"><b>전화번호</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="text" name="orderTel" size="4" maxlength="4" value="${member.tel[0] }" class="cmfont1"> -
									<input type="text" name="orderTel" size="4" maxlength="4" value="${member.tel[1] }" class="cmfont1"> -
									<input type="text" name="orderTel" size="4" maxlength="4" value="${member.tel[2] }" class="cmfont1">
								</td>
							</tr>
							<tr height="25">
								<td width="150"><b>휴대폰번호</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="text" name="orderPhone" size="4" maxlength="4" value="${member.phone[0] }" class="cmfont1"> -
									<input type="text" name="orderPhone" size="4" maxlength="4" value="${member.phone[1] }" class="cmfont1"> -
									<input type="text" name="orderPhone" size="4" maxlength="4" value="${member.phone[2] }" class="cmfont1">
								</td>
							</tr>
							<tr height="25">
								<td width="150"><b>E-Mail</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="text" name="orderEmail" size="50" maxlength="50" value="${member.member.email }" class="cmfont1">
								</td>
							</tr>
							<tr height="50">
								<td width="150"><b>주소</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="text" name="orderZipcode" size="3" maxlength="3" value="${member.zipcode[0] }" class="cmfont1" readonly> -
									<input type="text" name="orderZipcode" size="3" maxlength="3" value="${member.zipcode[1] }" class="cmfont1" readonly>
									<a href="javascript:FindZip(1)"><img src="${pageContext.servletContext.contextPath }/assets/images/b_zip.gif" align="absmiddle" border="0"></a> <br>
									<input type="text" name="orderAddress" size="50" maxlength="200" value="${member.member.address }" class="cmfont1" readonly><br>
								</td>
							</tr>
						</table>

					</td>
				</tr>
				<tr height="10"><td></td></tr>
			</table>

			<!-- 배송지 정보 -->
			<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
				<tr height="3" bgcolor="#CCCCCC"><td></td></tr>
				<tr height="10"><td></td></tr>
			</table>

			<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
				<tr>
					<td align="left" valign="top" width="150" STYLE="padding-left:45;padding-top:5"><font size=2 color="#B90319"><b>배송지 정보</b></font></td>
					<td align="center" width="560">

						<table width="560" border="0" cellpadding="0" cellspacing="0" class="cmfont">
							<tr height="25">
								<td width="150"><b>주문자정보와 동일</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="radio" name="same" onclick="SameCopy('Y')">예 &nbsp;
									<input type="radio" name="same" onclick="SameCopy('N')">아니오
								</td>
							</tr>
							<tr height="25">
								<td width="150"><b>받으실 분 성명</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="text" name="rcvName" size="20" maxlength="10" value="" class="cmfont1">
								</td>
							</tr>
							<tr height="25">
								<td width="150"><b>전화번호</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="text" name="rcvTel" size="4" maxlength="4" value="" class="cmfont1"> -
									<input type="text" name="rcvTel" size="4" maxlength="4" value="" class="cmfont1"> -
									<input type="text" name="rcvTel" size="4" maxlength="4" value="" class="cmfont1">
								</td>
							</tr>
							<tr height="25">
								<td width="150"><b>휴대폰번호</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="text" name="rcvPhone" size="4" maxlength="4" value="" class="cmfont1"> -
									<input type="text" name="rcvPhone" size="4" maxlength="4" value="" class="cmfont1"> -
									<input type="text" name="rcvPhone" size="4" maxlength="4" value="" class="cmfont1">
								</td>
							</tr>
							<tr height="25">
								<td width="150"><b>E-Mail</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="text" name="rcvEmail" size="50" maxlength="50" value="" class="cmfont1">
								</td>
							</tr>
							<tr height="50">
								<td width="150"><b>주소</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="text" name="rcvZipcode" size="3" maxlength="3" value="" class="cmfont1" readonly> -
									<input type="text" name="rcvZipcode" size="3" maxlength="3" value="" class="cmfont1" readonly>
									<a href="javascript:FindZip(2)"><img src="${pageContext.servletContext.contextPath }/assets/images/b_zip.gif" align="absmiddle" border="0"></a> <br>
									<input type="text" name="rcvAddress" size="50" maxlength="200" value="" class="cmfont1" readonly><br>
								</td>
							</tr>
							<tr height="50">
								<td width="150"><b>배송시요구사항</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<textarea name="require" cols="60" rows="3" class="cmfont1"></textarea>
								</td>
							</tr>
							<input type="hidden" name="state" value="1" />
							<input type="hidden" name="totPrice" value="${totPrice + 2500}" />
						</table>
					</td>
				</tr>
				<tr height="10"><td></td></tr>
			</table>

			<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
				<tr height="3" bgcolor="#CCCCCC"><td></td></tr>
				<tr height="10"><td></td></tr>
			</table>

			<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
				<tr>
					<td align="center">
						<input type="image" src="${pageContext.servletContext.contextPath }/assets/images/b_order3.gif">
					</td>
				</tr>
				<tr height="20"><td></td></tr>
			</table>
			
			</form>
</td></tr></table>
<!-------------------------------------------------------------------------------------------->	
<!-- 끝 : 다른 웹페이지 삽입할 부분                                                         -->
<!-------------------------------------------------------------------------------------------->	

		</td>
	</tr>
</table>
<br><br>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
<!--  현재 페이지 자바스크립  -------------------------------------------->
<script type="text/javascript">
	function check_value(obj) {
		if (!obj.orderName.value) {
			alert("주문자 이름을 입력하세요.");	 obj.orderName.focus(); return false;;
		}
		if (!(obj.orderTel[0].value && obj.orderTel[1].value && obj.orderTel[2].value) ) {
			alert("주문자 전화번호를 입력하세요."); obj.orderTel[0].focus(); return false;;
		}
		if (!(obj.orderPhone[0].value && obj.orderPhone[1].value && obj.orderPhone[2].value) ) {
			alert("주문자 핸드폰 번호를 입력하세요."); obj.orderPhone.focus(); return false;;
		}
		if (!obj.orderEmail.value) {
			alert("주문자 이메일을 입력하세요."); obj.orderEmail.focus(); return false;;
		}
		if (!(obj.orderZipcode[0].value && obj.orderZipcode[1].value)) {
			alert("주문자 우편번호를 입력하세요."); obj.orderZipcode[0].focus(); return false;;
		}
		if (!obj.orderAddress.value) {
			alert("주문자 주소를 입력하세요."); obj.orderAddress.focus(); return false;;
		}
		// --------------------------------
		if (!obj.rcvName.value) {
			alert("받으실 분의 이름을 입력하세요."); obj.rcvName.focus(); return false;;
		}
		if (!obj.rcvTel[0].value || !obj.rcvTel[1].value || !obj.rcvTel[2].value) {
			alert("받으실 분의 전화번호를 입력하세요."); obj.rcvTel[0].focus(); return false;;
		}
		if (!obj.rcvPhone[0].value || !obj.rcvPhone[1].value || !obj.rcvPhone[2].value) {
			alert("받으실 분의 핸드폰 번호를 입력하세요."); obj.rcvPhone[0].focus(); return false;;
		}
		if (!obj.rcvEmail.value) {
			alert("받으실 분의 이메일을 입력하세요."); obj.rcvEmail.focus(); return false;;
		}
		if (!obj.rcvZipcode[0].value || !obj.rcvZipcode[1].value) {
			alert("받으실 분의 우편번호를 입력하세요.");	obj.rcvZipcode[0].focus();	return false;;
		}
		if (!obj.rcvAddress.value) {
			alert("받으실 분의 주소를 입력하세요.");	obj.rcvAddress.focus(); return false;;
		}

		return true;
	}
	
	$('form[name="order-index-form"]').submit(function(e) {
		return check_value(this);;
	});

	function FindZip(zip_kind) 
	{
		window.open("${pageContext.servletContext.contextPath}/zipcode?k="+zip_kind, "", "scrollbars=no,width=500,height=250");
	}

	function SameCopy(str) {
		var orderForm = document.getElementsByName('order-index-form')[0];
		if (str == "Y") {
			orderForm.rcvName.value = orderForm.orderName.value;
			orderForm.rcvZipcode[0].value = orderForm.orderZipcode[0].value;
			orderForm.rcvZipcode[1].value = orderForm.orderZipcode[1].value;
			orderForm.rcvAddress.value = orderForm.orderAddress.value;
			orderForm.rcvTel[0].value = orderForm.orderTel[0].value;
			orderForm.rcvTel[1].value = orderForm.orderTel[1].value;
			orderForm.rcvTel[2].value = orderForm.orderTel[2].value;
			orderForm.rcvPhone[0].value = orderForm.orderPhone[0].value;
			orderForm.rcvPhone[1].value = orderForm.orderPhone[1].value;
			orderForm.rcvPhone[2].value = orderForm.orderPhone[2].value;
			orderForm.rcvEmail.value = orderForm.orderEmail.value;
		}
		else {
			orderForm.rcvName.value = "";
			orderForm.rcvZipcode[0].value = "";
			orderForm.rcvZipcode[1].value = "";
			orderForm.rcvAddress.value = "";
			orderForm.rcvTel[0].value = "";
			orderForm.rcvTel[1].value = "";
			orderForm.rcvTel[2].value = "";
			orderForm.rcvPhone[0].value = "";
			orderForm.rcvPhone[1].value = "";
			orderForm.rcvPhone[2].value = "";
			orderForm.rcvEmail.value ="";
		}
	}
</script>
</body>
</html>