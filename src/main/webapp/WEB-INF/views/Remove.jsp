<%@page import="com.jspider.springmvc.pojo.StudentPojo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="./NavBar.jsp" %>  
    <% List<StudentPojo> students= (List<StudentPojo>)request.getAttribute("student");
		String msg=(String)request.getAttribute("msg");    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Remove page</title>
</head>
<style>
body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
    }

    .container {
        max-width: 500px;
        margin-top:10px;
         margin-left:70px;
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
    margin-top:10px;
    margin-left:200px;
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
        <h3>Remove Student record</h3>
        <form action="./remove" method="POST">
            <label for="name">Id:</label>
            <input type="text"  name="id" required/>
            <input type="submit" value="Remove">
            </form>
           </div>
           
    <%if(msg!=null){ %>
    <h3><%=msg %></h3>
    
    <%} %>
    
        <table class="heading">
        <tr >
        <th>ID</th>
        <th>NAME</th>
        <th>EMAIL</th>
        <th>MOBILE</th>
        <th>ADDRESS</th>
        
        </tr>
        
        <%for(StudentPojo student:students){ %>
        
         <tr>
        <td><%=student.getId() %></td>
        <td><%=student.getName() %></td>
        <td><%=student.getEmail() %></td>
        <td><%=student.getMobile() %></td>
        <td><%=student.getAddress() %></td>
        </tr>
       
        
        
        <%} %>
         </table>
         </div>
        
        
 
</body>
</html>