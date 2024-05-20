<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Registrations</title>

<style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f0ece2;
            margin: 0;
            padding: 0;
        }
        .container {
            display: flex;
            justify-content: center;
    		align-items: flex-start;
            height: 100vh;
        }
        .listInquiries-page{
            width: fit-content;
            background: #cbc0ad;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
            animation: fadeIn 1s ease;
        }
        h2 {
            margin-bottom: 20px;
            text-align: center;
            color: #635d52;
        }
		.success-button {
            display: none;
            border: none;
            border-radius: 5px;
            color: #f44336;		/* Red */
            padding: 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin-top: 20px;
        }
        .success-button.visible {
            display: block;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background-color: #f0ece2;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #808000;
            color: #ffffff;
        }
        tr:nth-child(even) {
            background-color: #e0e0d1;
        }
        tr:hover {
            background-color: #c0c0b0;
        }
        a {
            color: #556b2f;
            text-decoration: none;
            padding: 5px 10px;
            border-radius: 5px;
            transition: background 0.3s;
        }
        a:hover {
            background-color: #808000;
            color: #ffffff;
        }
    </style>
</head>
<body>
	<div class="container">
		<div class="listInquiries-page">
			<h2>All Registrations</h2>
			<%
                if (request.getAttribute("msg") != null) {
            %>
            <div class="success-button visible">
                <%= request.getAttribute("msg") %>
            </div>
            <%
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
		</div>
	</div>
</body>
</html>