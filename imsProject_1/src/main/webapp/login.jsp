<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Login</title>
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
        .login-page{
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
        .success-button {
            display: none;
            border: none;
            border-radius: 5px;
            color: white;		
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
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background: linear-gradient(to right, #808000, #556b2f);
            border: none;
            color: #f0ece2;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s;
        }
        input[type="submit"]:hover {
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
	    <div class="login-page">
	        <h2>Login Here</h2>
	        <%
                if (request.getAttribute("msg") != null) {
            %>
            <div class="success-button visible">
                <%= request.getAttribute("msg") %>
            </div>
            <%
                }
            %>
	        <form action="verifyLogin" method="post">
	            Email: <input type="text" name="email"/><br>
	            Password: <input type="password" name="password"/><br>
	            <input type="submit" value="Login"/>
	        </form>
	    </div>
	</div>
</body>
</html>
