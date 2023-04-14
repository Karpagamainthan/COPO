<%! String home="Home"; %>
<%! boolean flag=true; %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    />
<style>
    a{
        text-decoration: none;
        color: blue;
    }
  .topnav {
  overflow: hidden;
  background-color: black;
}
#rightside{
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

#leftside.hover {
  background-color: #ddd;
  color: black;
} 
.icon{
        border-radius: 50%;
        transition: .3s;
      }
      .icon:hover{
        background-color:rgb(77, 76, 76);
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
  if(teacher==null)
  teacher="";
  %>
          <a href="#" class="icon"><i class="fa-sharp fa-solid fa-arrow-left"></i></a>

        <% if(flag){ %>
        <a id="leftside" href="dept_list.jsp">Home</a>
        <%} %>
        <a id="rightside" href="index.jsp">LOGOUT</a>
        <a id="rightside" ><%=teacher%></a>
      </div>
</header>
</body>
</html>
