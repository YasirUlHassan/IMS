<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Inquiry</title>
</head>
<body>
	<h2> Update Student details</h2>
	<%
		if(request.getAttribute("msg")!=null){
			out.println(request.getAttribute("msg"));
		}
	%>
	<form action="updateInquiry" method="post">
		<pre>
			Email <input type="text" name="email" value="<%=request.getAttribute("email")%>" readonly>
			Mobile <input type="text" name="mobile" value="<%=request.getAttribute("mobile")%>">
			<input type="submit" value="Update Inquiry">
		</pre>
	</form>
</body>
</html>