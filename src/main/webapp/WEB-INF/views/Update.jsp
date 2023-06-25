<%@page import="com.jspider.springmvc.pojo.StudentPojo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="./NavBar.jsp" %>  
     <% List<StudentPojo> students= (List<StudentPojo>)request.getAttribute("students");
		String msg=(String)request.getAttribute("msg");  
		StudentPojo student=(StudentPojo)request.getAttribute("student");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update page</title>
</head>
<style>
 body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
    }

    .container {
        max-width: 500px;
        margin-top:20px;
        margin-left:40px;
        padding: 20px;
        background-color: #fff;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }
    .container1{
    	max-width: 500px;
        margin-top:20px;
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
    }

    input[type="text"],
    input[type="email"],
    input[type="tel"],
    textarea {
        width: 100%;
        padding: 5px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    textarea {
        resize: vertical;
        height: 30px;
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
    #heading{
    text-align: center;
    margin-top: 30px;

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
	<%if(student==null){%>
<div class="container">
        <h3>Select Student </h3>
        <form action="./update" method="POST">
         	<label for="name">Id:</label>
            <input type="text" id="id" name="id" required>
            <input type="submit" value="SEND">
        </form>
       </div>
       <%if(msg!=null){
    	%>
    	<h4><%=msg%></h4>
       <%} %>
       <div>
        <%if(students!=null){ %>
       <table class="heading">
        <tr >
        <th>ID</th>
        <th>NAME</th>
        <th>EMAIL</th>
        <th>MOBILE</th>
        <th>ADDRESS</th>
        
        </tr>
        
        <%for(StudentPojo pojo:students) {%>
        
         <tr>
        <td><%=pojo.getId()%></td>
        <td><%=pojo.getName()%></td>
        <td><%=pojo.getEmail()%></td>
        <td><%=pojo.getMobile()%></td>
        <td><%=pojo.getAddress()%></td>
        </tr>
       <%}
        }%>
       </table>
       </div>
       
       <% }else if(student!=null){ %>
   
       <div class="container1">
        <h3>Update form</h3>
        <form action="./updateData" method="POST">
         	<label for="name" hidden="true"></label>
            <input type="text" id="id" name="id" required  hidden="true" value="<%=student.getId()%>" >
            
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="<%=student.getName()%>">

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="<%=student.getEmail() %>">

            <label for="mobile">Mobile Number:</label>
            <input type="tel" id="mobile" name="mobile" value="<%=student.getMobile() %>" >

            <label for="address">Address:</label>
            <input type="text" id="address" name="address" value="<%=student.getAddress() %>" >

            <input type="submit" value="Update">
        </form>
    
       </div>
           <% }%> 
           
           </div>
         
       
       
      
      
</body>
</html>