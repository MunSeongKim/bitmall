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
						<img src="${pageContext.servletContext.contextPath }/assets/images/login_title2.gif" />
					</td>
				</tr>
				<form name="join-form" method="POST" action="join">
				<input type="hidden" name="classify" value="user" />
				<tr>
					<td class="content-user-form">
						<table class="cmfont">
							<tr>
								<td class="label">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" />
									<span>아이디</span>
								</td>
								<td>
									<input type="text" id="input-id" name="id" maxlength = "12" value="" size="20" class="cmfont1"> 
									<a id="btn-check-id" href="javascript:check_id();">
										<img id="btn-image-check-id" src="${pageContext.servletContext.contextPath }/assets/images/b_idcheck.gif" />
									</a>
								</td>
							</tr>
							<tr>
								<td class="label">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" />
									<span>비밀번호</span>
								</td>
								<td>
									<input TYPE="password" id="input-pw" name="password" maxlength = "10" size="20" class="cmfont1">
								</td>
							</tr>
							<tr>
								<td class="label">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" alt="ID중복확인" />
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
									<input type="text" name="name" maxlength = "10" value = "" size="20" class="cmfont1" />
								</td>
							</tr>
							<tr>
								<td class="label">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" />
									<span>생년월일</span>
								</td>
								<td>
									<input type="text" name='birth' size = "4" maxlength = "4" value = "" class="cmfont1" />
									<span>년</span>
									<input type="text" name='birth' size = "2" maxlength = "2" value = "" class="cmfont1" />
									<span>월</span> 
									<input type="text" name='birth' size = "2" maxlength = "2" value = "" class="cmfont1" />
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
									<input type="text" name='tel' size = "4" maxlength = "4" value = "" class="cmfont1" />
									<span>-</span>
									<input type="text" name='tel' size = "4" maxlength = "4" value = "" class="cmfont1" />
									<span>-</span>
									<input type="text" name='tel' size = "4" maxlength = "4" value = "" class="cmfont1" />
								</td>
							</tr>
							<tr>
								<td class="label">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" />
									<span>핸드폰 번호</span>
								</td>
								<td>
									<input type="text" name='phone' size = "4" maxlength = "4" value = "" class="cmfont1" />
									<span>-</span>
									<input type="text" name='phone' size = "4" maxlength = "4" value = "" class="cmfont1" />
									<span>-</span>
									<input type="text" name='phone' size = "4" maxlength = "4" value = "" class="cmfont1" />
								</td>
							</tr>
							<tr>
								<td class="label">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" />
									<span>주소</span>
								</td>
								<td>
									<div>
										<input type="text" id="input-zip1" name='zipcode' size = "4" maxlength = "3" value = "" class="cmfont1" readonly/>
										<span>-</span>
										<input type="text" id="input-zip2" name='zipcode' size = "4" maxlength = "3" value = "" class="cmfont1" readonly /> 
										<a href="javascript:findZip(0)">
											<img src="${pageContext.servletContext.contextPath }/assets/images/b_zip.gif" alt="우편번호" />
										</a>
									</div>
									<input type="text" id="input-address" name='address' size = "50" maxlength = "200" value = "" class="cmfont1" readonly/>
								</td>
							</tr>
							<tr>
								<td class="label">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" />
									<span>E-Mail</span>
								</td>
								<td>
									<input type="text" name='email' size = "50" maxlength = "50" value = "" class="cmfont1" />
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
	function check_id() {
		var id = $('#input-id').val();
		$.ajax({
			url: '${pageContext.servletContext.contextPath}/api/member/checkid',
			type: 'GET',
			data: { "id": id },
			dataType: 'json',
			success: function( response, status ) {
				console.log( response );
				if( response.result != "success" ) {
					console.log(response.message);
					return ;
				}
				
				if( response.data == "exist" ){
					alert(id + "(은)는 이미 사용중입니다.")
					$('#id').val("").focus();
					return ;
				}
				
				
				$('#btn-image-check-id').attr("src", "${pageContext.servletContext.contextPath }/assets/images/b_idcheckok.png" );
				$('#btn-check-id').css('cursor', 'default').click(function(e){
					e.preventDefault();
				});
			},
			error: function( e, status, xhr ) {
				console.warn("[" + status + "] " + e);
			}
		});
	}
	
	$('#input-id').change(function(){
		$('#btn-image-check-id').attr("src", "${pageContext.servletContext.contextPath }/assets/images/b_idcheck.gif" );
		$('#btn-check-id').css('cursor', 'pointer').click(function(){
			check_id();
		});
	});
	
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
	
	$('input[name="zipcode"], input[name="address"]').click(function(){
		findZip();
	});

	function findZip() {
		window.open("${pageContext.servletContext.contextPath}/zipcode?k=0", "", "scrollbars=no,width=500,height=250");
	}

	function form_reset() {
		document.getElementsByName('join-form')[0].reset();
	}
</script>
</body>
</html>