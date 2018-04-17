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
				<form name="modify-form" method="post" action="${pageContext.servletContext.contextPath }/member/modify">
				<tr>
					<td class="content-user-form">
						<table class="cmfont">
							<tr>
								<td class="label">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" />
									<span>아이디</span>
								</td>
								<td>
									<input type="text" id="input-id" name="id" maxlength = "12" value="${member.id }" size="20" class="cmfont1" readonly /> 
								</td>
							</tr>
							<tr>
								<td class="label">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" />
									<span>비밀번호</span>
								</td>
								<td>
									<input TYPE="password" id="input-pw" name="password" maxlength = "10" size="20" class="cmfont1" />
								</td>
							</tr>
							<tr>
								<td class="label">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" />
									<span>비밀번호 확인</span>
								</td>
								<td>
									<input TYPE="password" id="input-check-pw" name="check-pw" maxlength = "10" size="20" class="cmfont1" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="content-user-form">					
						<table class="cmfont">
							<tr>
								<td class="label">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" />
									<span>이 름</span>
								</td>
								<td class="">
									<input type="text" name="name" maxlength = "10" value = "${member.name }" size="20" class="cmfont1" />
								</td>
							</tr>
							<tr>
								<td class="label">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" />
									<span>생년월일</span>
								</td>
								<td>
									<input type="text" name='birth' size = "4" maxlength = "4" value = "${birth[0] }" class="cmfont1" />
									<span>년</span>
									<input type="text" name='birth' size = "2" maxlength = "2" value = "${birth[1] }" class="cmfont1" />
									<span>월</span> 
									<input type="text" name='birth' size = "2" maxlength = "2" value = "${birth[2] }" class="cmfont1" />
									<span>일</span>
									<!-- <input type="radio" name='sm' value = "1" checked> <span>양력 
									<input type="radio" name='sm' value = "2" > <span>음력</td> -->
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="content-user-form">
						<table class="cmfont">
							<tr>
								<td class="label">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" />
									<span>전화 번호</span>
								</td>
								<td>
									<input type="text" name='tel' size = "4" maxlength = "4" value = "${tel[0] }" class="cmfont1" />
									<span>-</span>
									<input type="text" name='tel' size = "4" maxlength = "4" value = "${tel[1] }" class="cmfont1" />
									<span>-</span>
									<input type="text" name='tel' size = "4" maxlength = "4" value = "${tel[2] }" class="cmfont1" />
								</td>
							</tr>
							<tr>
								<td class="label">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" />
									<span>핸드폰 번호</span>
								</td>
								<td>
									<input type="text" name='phone' size = "4" maxlength = "4" value = "${phone[0] }" class="cmfont1" />
									<span>-</span>
									<input type="text" name='phone' size = "4" maxlength = "4" value = "${phone[1] }" class="cmfont1" />
									<span>-</span>
									<input type="text" name='phone' size = "4" maxlength = "4" value = "${phone[2] }" class="cmfont1" />
								</td>
							</tr>
							<tr>
								<td class="label">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" />
									<span>주소</span>
								</td>
								<td>
									<div>
										<input type="text" id="zip1" name='zipcode' size = "4" maxlength = "3" value = "${zipcode[0] }" class="cmfont1" />
										<span>-</span>
										<input type="text" id="zip2" name='zipcode' size = "4" maxlength = "3" value = "${zipcode[1] }" class="cmfont1" /> 
										<a href="javascript:FindZip(0)">
											<img src="${pageContext.servletContext.contextPath }/assets/images/b_zip.gif" alt="우편번호" />
										</a>
									</div>
									<input type="text" name='address' size = "50" maxlength = "200" value = "${member.address }" class="cmfont1" />
								</td>
							</tr>
							<tr>
								<td class="label">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" />
									<span>E-Mail</span>
								</td>
								<td>
									<input type="text" name='email' size = "50" maxlength = "50" value = "${member.email }" class="cmfont1" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="actions">
						<input type="image" src="${pageContext.servletContext.contextPath }/assets/images/b_add.gif" />
						<a href="javascript:form_reset()">
							<img src="${pageContext.servletContext.contextPath }/assets/images/b_reset.gif" />
						</a>
					</td>
				</tr>
				</form>
			</table>
		<!-------------------------------------------------------------------------------------------->	
		<!-- 끝 : 다른 웹페이지 삽입할 부분                                                                                                                                                              -->
		<!-------------------------------------------------------------------------------------------->	
		</td>
	</tr>
</table>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
<script type="text/javascript">
	$('#input-check-pw').change(function(){
		var pw = $('#input-pw').val();
		var checkPw = $(this).val();
		if(checkPw === "") {
			alert("비밀번호 확인을 입력해주세요.");
			return ;
		}
		
		if(pw !== checkPw) {
			alert("비밀번호가 일치하지 않습니다.");
			$(this).val("");
			$(this).focus();
			return ;
		}
	});

	$('input[name="zipcode"], input[name="address"]').focus(function(){
		findZip();
	});
	
	function findZip() {
		window.open("${pageContext.servletContext.contextPath}/member/zipcode");
	}

	function form_reset() {
		document.getElementsByName('modify-form')[0].reset();
	}
</script>
</body>
</html>