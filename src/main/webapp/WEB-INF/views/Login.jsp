<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String msg=(String)request.getAttribute("msg"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        height: 800px;
    }

    .container {
        max-width: 400px;
        margin: 0 auto;
        margin-top:130px;
        padding: 20px;
        background-color: #fff;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    h1 {
        text-align: center;
    }

    label {
        display: block;
        margin-bottom: 10px;
    }

    input[type="text"],
    input[type="password"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    input[type="submit"] {
        width: 100%;
        padding: 10px;
        background-color: #4CAF50;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #45a049;
    }

    .error-message {
        color: red;
        margin-top: 10px;
    }
    a{
    margin-left: 130px;
    margin-top: 20px;
    font-weight: bold;
    font-size: 15px;
    
    }
    #id{
    margin-top: 20px;
    }
    #msg{
    margin-left: 550px;;}
</style>
</head>
<body>
    <div class="container">
        <h1>Login Page</h1>
        <form action="./login" method="POST">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <input type="submit" value="Login">
           
        </form>
        
       <div id="id"> <a href="./createAdmin">Create new account</a></div>
		
    </div>
    <div id="msg"> <%
		if (msg != null) {
		%>
		<h2><%=msg%></h2>
		<%
		}
		%></div>
   
</body>
</html>
