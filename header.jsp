<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
    a{
        text-decoration: none;
        color: blue;
    }
  .topnav {
  overflow: hidden;
  background-color: black;
}
#j{
    float:right;
}

.topnav a { 
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

#hello.hover {
  background-color: #ddd;
  color: black;
}

</style>
</head>
<body>
<header>
    <center>
        <img src="logo.png" alt="">
    </center>
    <div class="topnav">
     <%
  String teacher=(String)pageContext.getAttribute("teacher",PageContext.SESSION_SCOPE);
  %>
        <a id="hello" href="dept_list.jsp">Home</a>
        <a id="j" href="login.jsp">LOGOUT</a>
        <a id="j" ><%=teacher%></a>
      </div>
</header>
 
</body>
</html>
