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
		<table class="content-lg content-center"><tr><td>	
			<!-- form2 시작  -->
			<form name="product-detail-form" method="post">
			<input type="hidden" name="productCode" value="${product.code }">

			<table border="0" cellpadding="0" cellspacing="0" width="745">
				<tr>
					<td width="335" align="center" valign="top">
						<!-- 상품이미지 -->
						<table border="0" cellpadding="0" cellspacing="1" width="315" height="315" bgcolor="D4D0C8">
							<tr>
								<td bgcolor="white" align="center">
									<img src="${pageContext.servletContext.contextPath }${product.imagePath1}" width="315" border="0" align="absmiddle" ONCLICK="Zoomimage('0000')" STYLE="cursor:hand">
								</td>
							</tr>
						</table>
					</td>
					<td width="410 " align="center" valign="top">
						<!-- 상품명 -->
						<table border="0" cellpadding="0" cellspacing="0" width="370" class="cmfont">
							<tr><td colspan="3" bgcolor="E8E7EA"></td></tr>
							<tr>
								<td width="80" height="45" style="padding-left:10px">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot1.gif" width="3" height="3" border="0" align="absmiddle">
									<font color="666666"><b>제품명</b></font>
								</td>
								<td width="1" bgcolor="E8E7EA"></td>
								<td style="padding-left:10px">
									<input type="hidden" name="name" value="${product.name }" />
									<font color="282828">${product.name }</font><br>
									<c:if test="${product.newItem eq true }">
										<img src="${pageContext.servletContext.contextPath }/assets/images/i_new.gif"/>
									</c:if>
									<c:if test="${product.hitItem eq true }">
										<img src="${pageContext.servletContext.contextPath }/assets/images/i_hit.gif" />
									</c:if>
									<c:if test="${product.saleItem eq true }">
										<img src="${pageContext.servletContext.contextPath }/assets/images/i_sale.gif" >
									</c:if> 
								</td>
							</tr>
							<tr><td colspan="3" bgcolor="E8E7EA"></td></tr>
							<!-- 시중가 -->
							<tr>
								<td width="80" height="35" style="padding-left:10px">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot1.gif" width="3" height="3" border="0" align="absmiddle">
									<font color="666666"><b>소비자가</b></font>
								</td>
								<td width="1" bgcolor="E8E7EA"></td>
								<td width="289" style="padding-left:10px"><font color="666666"><fmt:formatNumber value="${product.price }" /> 원</font></td>
							</tr>
							<tr><td colspan="3" bgcolor="E8E7EA"></td></tr>
							<!-- 판매가 -->
							<tr>
								<td width="80" height="35" style="padding-left:10px">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot1.gif" width="3" height="3" border="0" align="absmiddle">
									<font color="666666"><b>판매가</b></font>
								</td>
								<td width="1" bgcolor="E8E7EA"></td>
								<td style="padding-left:10px"><font color="0288DD"><b><fmt:formatNumber value="${product.price * (1-(product.discount / 100)) }" /> 원</b></font></td>
							</tr>
							<tr><td colspan="3" bgcolor="E8E7EA"></td></tr>
							<!-- 옵션 -->
							<tr>
								<td width="80" height="35" style="padding-left:10px">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot1.gif" width="3" height="3" border="0" align="absmiddle">
									<font color="666666"><b>옵션선택</b></font>
								</td>
								<td width="1" bgcolor="E8E7EA"></td>
								<td style="padding-left:10px">
									<select name="suboptionNo">
						    			<option value="0" selected>옵션선택</option>
						    		<c:forEach items="${suboptions }" var="suboption">
										<option value="${suboption.no }">${suboption.name }</option>
									</c:forEach>
									</select>
								</td>
							</tr>
							<tr><td colspan="3" bgcolor="E8E7EA"></td></tr>
							<!-- 수량 -->
							<tr>
								<td width="80" height="35" style="padding-left:10px">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot1.gif" width="3" height="3" border="0" align="absmiddle">
									<font color="666666"><b>수량</b></font>
								</td>
								<td width="1" bgcolor="E8E7EA"></td>
								<td style="padding-left:10px">
									<input type="number" name="amount" value="1" size="3" maxlength="5" min="1" max="10" class="cmfont1"> <font color="666666">개</font>
								</td>
							</tr>
							<tr><td colspan="3" bgcolor="E8E7EA"></td></tr>
						</table>
						<table border="0" cellpadding="0" cellspacing="0" width="370" class="cmfont">
							<tr>
								<td height="70" align="center">
									<a href="javascript:order()"><img src="${pageContext.servletContext.contextPath }/assets/images/b_order.gif" border="0" align="absmiddle"></a>&nbsp;&nbsp;&nbsp;
									<a href="javascript:cart()"><img src="${pageContext.servletContext.contextPath }/assets/images/b_cart.gif"  border="0" align="absmiddle"></a>
								</td>
							</tr>
						</table>
						<table border="0" cellpadding="0" cellspacing="0" width="370" class="cmfont">
							<tr>
								<td height="30" align="center">
									<img src="${pageContext.servletContext.contextPath }/assets/images/product_text1.gif" border="0" align="absmiddle">
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			</form>
			<!-- form2 끝  -->

			<table border="0" cellpadding="0" cellspacing="0" width="747">
				<tr><td height="22"></td></tr>
			</table>

			<!-- 상세설명 -->
			<table border="0" cellpadding="0" cellspacing="0" width="747">
				<tr><td height="13"></td></tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="746">
				<tr>
					<td height="30" align="center">
						<img src="${pageContext.servletContext.contextPath }/assets/images/product_title.gif" width="746" height="30" border="0">
					</td>
				</tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="746" style="font-size:9pt">
				<tr><td height="13"></td></tr>
				<tr>
					<td height="200" valign=top style="line-height:14pt">
						${product.description }
						<br>
						<br>
						<center>
							<img src="${pageContext.servletContext.contextPath }${product.imagePath1}" width="746"><br><br><br>
							<img src="${pageContext.servletContext.contextPath }${product.imagePath2}" width="746"><br><br><br>
							<img src="${pageContext.servletContext.contextPath }${product.imagePath3}" width="746">&nbsp
						</center>
					</td>
				</tr>
			</table>
		</td></tr></table>

			<!-- 교환배송정보 -->
<!-- 			<table border="0" cellpadding="0" cellspacing="0" width="746" class="cmfont"> -->
<!-- 				<tr><td height="10"></td></tr> -->
<!-- 			</table> -->
<!-- 			<table border="0" cellpadding="0" cellspacing="0" width="746"> -->
<!-- 				<tr> -->
<!-- 					<td align="center" class="cmfont">배송정보 어쩌고저쩌고........</td> -->
<!-- 				</tr> -->
<!-- 			</table> -->
<!-- 			<table border="0" cellpadding="0" cellspacing="0" width="746" class="cmfont"> -->
<!-- 				<tr><td height="10"></td></tr> -->
<!-- 			</table> -->

<!-------------------------------------------------------------------------------------------->	
<!-- 끝 : 다른 웹페이지 삽입할 부분                                                         -->
<!-------------------------------------------------------------------------------------------->	
		</td>
	</tr>
</table>
<br><br>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>

<script type="text/javascript">
	function order() {
		if( $('select[name="suboptionNo"]').val() == 0 ){
			alert("옵션이 선택되지 않았습니다.");
			return false;
		}
		
		var form = $('form[name="product-detail-form"]');
		var formData = $(form).serializeArray();
		$(form).attr('action', '${pageContext.servletContext.contextPath}/order');
		console.log(formData);
		$(form).submit();
	}
	
	function cart() {
		if( $('select[name="suboptionNo"]').val() == 0 ){
			alert("옵션이 선택되지 않았습니다.");
			return false;
		}
		
		var form = $('form[name="product-detail-form"]');
		var formData = $(form).serializeArray();
		
		var data = {};
		$.each(formData, function(index, obj){
			data[obj.name] = obj.value;
		});
		
		console.log(data);
		// Ajax code
		$.ajax({
			url: "${pageContext.servletContext.contextPath}/api/cart",
			type: "POST",
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify(data),
			dataType: "json",
			success: function( response, status ) {
				if( response.result !== "success" ){
					console.warn(response.message);
					if( confirm("장바구니는 로그인이 필요합니다.\n로그인 하시겠습니까?") ){
						location.href=response.message;
					}
					return ;
				}
				
				if( response.data === "added" ){
					$('input[name="amount"]').val(1);
					$('select[name="suboptionNo"] option:eq(0)').prop("selected", true);
					
					if( confirm("["+ data["name"]+"] 을 장바구니에 추가하였습니다.\n 장바구니를 확인하겠습니까??" ) ){
						location.href = "${pageContext.servletContext.contextPath}/cart";
					}
				}
			},
			error: function(e, status) {
				console.warn("[" + status + "] " + e);
			}
			
		});
		return false;
	} 
</script>
</body>
</html>