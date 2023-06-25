<%@page import="com.jspider.springmvc.pojo.StudentPojo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="./NavBar.jsp" %> 
    <%StudentPojo pojo=(StudentPojo)request.getAttribute("student");
    String msg=(String)request.getAttribute("msg");
    %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search page</title>
</head>
<style>
body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
    }

    .container {
        max-width: 500px;
        margin-left:40px;
        padding: 20px;
        background-color: #fff;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    h3 {
        text-align: center;
    }

    label {
        display: block;
        margin-bottom: 10px;
        font-weight: bold;
        font-size: 20px;
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
        padding: 5px;
        background-color: #4CAF50;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #45a049;
    }
    .heading{
    margin-top:20px;
    margin: 0 auto;
    text-align: center;
    }
    
    table,th,td,tr{
    border:2px solid black;
    border-collapse:collapse;
    padding: 10px
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
<body>
<div id="outer">
<div class="container">
        <h3>Search Student Details</h3>
        <form action="./search" method="POST">
            <label for="name">Id:</label>
            <input type="text"  name="id" required/>
            <input type="submit" value="search">
            </form>
           </div>
           
        <% if(msg!=null){ %>  
        <h4 class="heading"><%=msg%></h4>
        
        <%} %> 
        
        <%if(pojo!=null){%>
        
        <table class="heading">
        <tr >
        <th>ID</th>
        <th>NAME</th>
        <th>EMAIL</th>
        <th>MOBILE</th>
        <th>ADDRESS</th>
        
        </tr>
        
        <tr>
        <td><%=pojo.getId() %></td>
        <td><%=pojo.getName() %></td>
        <td><%=pojo.getEmail() %></td>
        <td><%=pojo.getMobile() %></td>
        <td><%=pojo.getAddress() %></td>
        </tr>
        </table>
        
        <%} %>
        </div>
        
            


</body>
</html>