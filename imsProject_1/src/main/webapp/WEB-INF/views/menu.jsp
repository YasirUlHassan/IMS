<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f0ece2;
            margin: 0;
            padding: 0;
        }
        .navbar {
            background: #34495e;
            padding: 10px 0;
            text-align: center;
        }
        .navbar a {
            color: #ecf0f1;
            text-decoration: none;
            padding: 10px 20px;
            margin: 0 10px;
            border-radius: 5px;
            transition: background 0.3s;
        }
        .navbar a:hover {
            background: #2c3e50;
        }
        .navbar form {
            display: inline;
        }
        .navbar .navbar-submit {
            background: #808000;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            margin: 0 10px;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s;
        }
        .navbar .navbar-submit:hover {
            background: #556b2f;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="addInquiry">Add Inquiry</a>
        <a href="listInquiries">View Inquiry</a>
        <form action="logOut" method="post">
            <input type="submit" value="Logout" class="navbar-submit">
        </form>
    </div>
</body>
</html>
