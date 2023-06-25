<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="./NavBar.jsp"></jsp:include>
     <%String msg=(String)request.getAttribute("msg"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student information Form</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
    }

    .container {
        max-width: 500px;
        margin-top:-20px;
        margin-left:100px;
        padding: 20px;
        background-color: #fff;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    h3{
        text-align: center;
        margin-bottom: 15px;
    }

    label {
        display: block;
        margin-bottom: 10px;
    }

    input[type="text"],
    input[type="email"],
    input[type="tel"],
    textarea {
        width: 100%;
        padding: 5px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    textarea {
        resize: vertical;
        height: 50px;
    }

    input[type="submit"] {
        width: 100%;
        padding: 7px;
        background-color: #4CAF50;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #45a049;
    }
    #heading{
    margin-top:10px;
    margin-left:80px;
    text-align: center;
    }
     #outer{
    height:600px;
    border:2px solid red;
    display: flex;
    flex-direction:column;
    justify-content: space-around;
    align-items:center;
    align-content: space-around;
    }
</style>
</head>
<body>
<div id="outer">
    <div class="container">
        <h3>Add Student Details</h3>
        <form action="./add" method="POST">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="mobile">Mobile Number:</label>
            <input type="tel" id="mobile" name="mobile" required>

            <label for="address">Address:</label>
            <textarea id="address" name="address" required></textarea>

            <input type="submit" value="ADD">
        </form>
         
    </div>
    
    <% if(msg!=null){ %>
         <h3 id="heading"><%=msg %></h3>
         <%
         }%>
         
    </div>
   
   
    
    
</body>
</html>
