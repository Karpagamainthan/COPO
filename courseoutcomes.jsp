<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
<%@ include file="header.jsp" %>
<%
String tab=(String)pageContext.getAttribute("tab",PageContext.SESSION_SCOPE);
String db=(String)pageContext.getAttribute("db",PageContext.SESSION_SCOPE);
String subcode=(String)pageContext.getAttribute("subcode",PageContext.SESSION_SCOPE);
String subname=(String)pageContext.getAttribute("subname",PageContext.SESSION_SCOPE);
String id=(String)pageContext.getAttribute("id",PageContext.SESSION_SCOPE);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
       
        form {
            width:50%;
            background-color: gray;
            padding:20px;
            margin-top: 30px;
             margin-bottom: 30px;
        }
        #form{
          
            margin-bottom:60px;
        }
        #form a{
            color:black;
            text-decoration: none;
            background-color: lightslategray;
            border:3px solid black;
            padding:5px;
            margin:0px 8px;
        }
        input {
            margin:10px;
            padding:10px;
        }
        input[type="text"]
        {
            width:80%;
            padding:10px;
        }
    </style>
</head>
<body>
    <center>

        <h1><%=subcode+" - "+subname%>-Course outcomes</h1><hr>
   
        <div id="form">
        <form method="GET" action="#">
        <p>CO1 : <textarea name="co1" rows="1" value="hii"></textarea></p>
        CO2 : <input type="text" placeholder="Course outcome 2" name="co2" size="20" required><br>
        CO3 : <input type="text" placeholder="Course outcome 3" name="co2" size="80" required><br>
        CO4 : <input type="text" placeholder="Course outcome 4" name="co2" size="20" required><br>
        CO5 : <input type="text" placeholder="Course outcome 5" name="co2" size="80" required><br>
        CO6 : <input type="text" placeholder="Course outcome 6" name="co2" size="20" required><br>
        <input type="submit" value="Update CO" name="submit">   <input type="reset" value="Reset" name="reset">
        </form>
        <center><a href="subject.jsp?id=<%=id%>&subname=<%=subname%>&subcode=<%=subcode%>">Back To Course</a></center>
    </div>
</center>
    
</body>
</html>
<%@ include file="footer.jsp" %>