<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="menu.jsp" %>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Update </title>
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
            align-items: center;
            height: 100vh;
        }
        .updateInquiry-page{
            width: 300px;
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
        input[type="text"],
        input[type="password"] {
            width: calc(100% - 10px);
            padding: 10px;
            margin-bottom: 10px;
            border: none;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            background-color: #f0ece2;
            color: #635d52;
        }
        .updateInquiry-page input[type="submit"] {
            width: 100%;
            padding: 10px;
            background: linear-gradient(to right, #808000, #556b2f);
            border: none;
            color: #f0ece2;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s;
        }
        .updateInquiry-page input[type="submit"]:hover {
            background: linear-gradient(to right, #556b2f, #808000);
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
    </style>
	</head>
<body>
	<div class="container">
		<div class="updateInquiry-page">
			<h2>Update Inquiry Here...</h2>
			<form action="updateInquiry" method="post">
				Email <input type="text" name="email" value="<%=request.getAttribute("email")%>"readonly/>
				Mobile <input type="text" name="mobile" value="<%=request.getAttribute("mobile")%>"/>
				<input type="submit" value="Update Inquiry"/>
			</form>
		</div>
	</div>
</body>
</html>