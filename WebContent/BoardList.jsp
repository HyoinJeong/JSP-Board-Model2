<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<c:if test="${msg=='revise' }">
	<script type="text/javascript">
		alert("���� �� ��й�ȣ�� Ʋ�Ƚ��ϴ�.");
	</script>
</c:if>
<c:if test="${msg=='delete' }">
	<script type="text/javascript">
		alert("���� �� ��й�ȣ�� Ʋ�Ƚ��ϴ�.");
	</script>
</c:if>

<center>
<h2>��ü �Խñ� ����</h2>
<table width="700" border="1">
	<tr height="40">
		<td align="right" colspan="5">
		<input type="button" value="�۾���" onclick="location.href='BoardWriteForm.jsp'"></td>
	</tr>
	<tr height="40">
		<td width="50" align="center">��ȣ</td>
		<td width="320" align="center">����</td>
		<td width="100" align="center">�ۼ���</td>
		<td width="150" align="center">�ۼ���</td>
		<td width="80" align="center">��ȸ��</td>
	</tr>
	<c:forEach var="bean" items="${v }">
	<c:set var="number" value="${number }"></c:set>
	<tr height="40">
		<td width="50" align="center">${number }</td>
		<td width="320" align="left">
			<c:if test="${bean.re_step>1 }">
				<c:forEach var="j" begin="1" end="${(bean.re_step-1)*5 }">
					&nbsp;
				</c:forEach>
			</c:if>
		<a href="BoardInfoCon.do?num=${bean.num }" style="text-decoration:none">${bean.subject }</a></td>
		<td width="100" align="center">${bean.writer }</td>
		<td width="150" align="center">${bean.reg_date }</td>
		<td width="80" align="center">${bean.readcount }</td>
	</tr>
	<c:set var="number" value="${number-1 }"></c:set>
	</c:forEach>
</table>
<p>
<!-- ������ ī���͸� �ҽ��� �ۼ� -->
<c:if test="${count>0 }">
	<c:set var="pageCount" value="${count/pageSize+(count%pageSize==0?0:1) }"></c:set>
	<c:set var="startPage" value="${1 }"></c:set>
	<c:if test="${currentPage %10 !=0}">
		<!-- ����� ���������� ���� �޾ƾ� �ϱ⿡ fmt�±� ��� -->
		<fmt:parseNumber var="result" value="${currentPage/10 }" integerOnly="true"></fmt:parseNumber>
		<c:set var="startPage" value="${result*10+1 }"></c:set>
	</c:if>
	<c:if test="${currentPage %10 ==0}">
		<!-- ����� ���������� ���� �޾ƾ� �ϱ⿡ fmt�±� ��� -->
		<c:set var="startPage" value="${(result-1)*10+1 }"></c:set>
	</c:if>
	
	<!-- ȭ�鿡 ������ ������ ó�� ���ڸ� ǥ�� -->
	<c:set var="pageBlock" value="${ 10}"></c:set>
	<c:set var="endPage" value="${startPage+pageBlock-1 }"></c:set>
	
	<c:if test="${endPage > pageCount }">
		<c:set var="endPage" value="${pageCount }"></c:set>
	</c:if>
	
	<!-- ���� ��ũ�� ���� �ľ� -->
	<c:if test="${startPage>10 }">
		<a href="BoardListCon.do?pageNum=${ startPage-10}" style="text-decoration:none">[����] </a>		
	</c:if>
	
	<!-- ����¡ ó�� -->
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<a href="BoardListCon.do?pageNum=${i }" style="text-decoration:none">[${i }]</a>	
	</c:forEach>
	
	<!-- ���� ��ũ�� ���� Ȯ�� -->
	<c:if test="${endPage<pageCount }">
		<a href="BoardListCon.do?pageNum=${ startPage+10}" style="text-decoration:none">[����] </a>		
	</c:if>
</c:if>
</p>
</center>

</body>
</html>