<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All registration</title>
</head>
<body>
	<h2>All Registrations...</h2>
	<%
		if(request.getAttribute("msg")!=null){
			out.println(request.getAttribute("msg"));
		}	
	%>
	<table border="1">
		<tr> 
			<th>Name</th>
			<th>Email</th>
			<th>Mobile</th>
			<th>Course</th>
			<th>Delete</th>
			<th>Update</th>
		</tr>
		<%
			ResultSet result = (ResultSet)request.getAttribute("res");
			while(result.next()){
		%>
		<tr> 
			<td><%=result.getString(1)%></td>
			<td><%=result.getString(2)%></td>
			<td><%=result.getString(3)%></td>
			<td><%=result.getString(4)%></td>
			<td><a href="deleteInquiry?email=<%=result.getString(2)%>">delete</a></td>
			<td><a href="updateInquiry?email=<%=result.getString(2)%>&mobile=<%=result.getString(3)%>">update</a></td>
		</tr>
		<%	} %>
	</table>
</body>
</html>