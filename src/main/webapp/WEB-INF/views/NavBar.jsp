<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
*{
margin: 0;
padding: 0;
box-sizing: border-box;
}
body{
 font-family: Arial, sans-serif;}
#nav{
display:flex;
justify-content: center;
align-items: center;
list-style: none;
height: 80px;
font-weight: bold;
font-size: 20px;


}
.navbar{
display:flex;
text-decoration: none;
margin-left: 20px;
height: 50px;
width: 100px;
border-radius: 30px;
align-items: center;
box-shadow: 0 2px 5px rgba(0, 0, 0, 0.4);

}

#div{
height: 80px;
background-color: #414141;
display: flex;
justify-content: flex-end;

}
a{
display:flex;
text-align:center;
text-decoration: underline;
color: #ffffff ;
height:30px;
margin-left: 15px;
}
#add{
margin-left: 25px;
}

</style>
<body>
<div id="navouter">
<div id="div">
<ul id="nav">
<li class="navbar"><a href="./home">Home</a></li>
<li class="navbar"><a href="./add" id="add">Add</a></li>
<li class="navbar"><a href="./remove" >Remove</a></li>
<li class="navbar"><a href="./update">Update</a></li>
<li class="navbar"><a href="./search">Search</a></li>
<li class="navbar"><a href="./logout">Logout</a></li>
</ul>

</div>
</div>

</body>
</html>