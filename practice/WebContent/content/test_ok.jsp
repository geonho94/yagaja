<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String citys[] = request.getParameterValues("city");
System.out.println(citys==null);
%>
<script>
location.href='Test.jsp';
window.alert('야호');
</script>
