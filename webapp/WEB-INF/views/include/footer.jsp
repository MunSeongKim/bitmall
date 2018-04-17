<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<table id="footer">
	<tr class="vertical-line">
		<td></td>
	</tr>
	<tr>
		<td>
			<table>
				<tr>
					<td id="footer-logo">
						<a href="${pageContext.servletContext.contextPath }/company">
							<img src="${pageContext.servletContext.contextPath }/assets/images/footer_logo.gif" alt="footer logo" />
						</a>
					</td>
					<td>
						<table>
							<tr>
								<td>
									<table>
										<tr>
											<td><a href="${pageContext.servletContext.contextPath }/company">
												<img src="${pageContext.servletContext.contextPath }/assets/images/footer_menu01.gif" alt="회사소개"/>
											</a></td>
											<td><img src="${pageContext.servletContext.contextPath }/assets/images/footer_line.gif" /></td>
											<td><a href="useinfo.jsp"><img src="${pageContext.servletContext.contextPath }/assets/images/footer_menu02.gif" alt="이용안내" /></a></td>
											<td><img src="${pageContext.servletContext.contextPath }/assets/images/footer_line.gif"></td>
											<td><a href="policy.jsp"><img src="${pageContext.servletContext.contextPath }/assets/images/footer_menu03.gif" alt="정책" /></a></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td><img src="${pageContext.servletContext.contextPath }/assets/images/footer_copyright.gif" alt="contact and copyright"></td>
							</tr>
						</table>
					</td>
					<td id="actions">
						<table>
							<tr>
								<td>
									<a href="${pageContext.servletContext.contextPath }"><img src="${pageContext.servletContext.contextPath }/assets/images/footer_home.gif" alt="home" /></a>
									<a href="#top"><img	src="${pageContext.servletContext.contextPath }/assets/images/footer_top.gif" alt="top"/></a>
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tr>
											<td><A HREF="http://www.ftc.go.kr/" target="_blank">
												<img src="${pageContext.servletContext.contextPath }/assets/images/footer_pic1.gif" alt="공정거래위원회 링크" />
												</A></td>
											<td><A HREF="http://www.sgic.co.kr/" target="_blank"><img src="${pageContext.servletContext.contextPath }/assets/images/footer_pic2.gif" alt="소보원 링크" />
												</a></td>
										</tr>
									</table>
								</td>
							<tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>