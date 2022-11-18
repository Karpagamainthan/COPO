<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
<%@ include file="header.jsp" %>
<%
    String tab=(String)pageContext.getAttribute("tab",PageContext.SESSION_SCOPE);
    String id=request.getParameter("id");
    String subname=request.getParameter("subname");
    String subcode=request.getParameter("subcode");
    String db=tab+"_"+id;
    pageContext.setAttribute("id",id,PageContext.SESSION_SCOPE);
    pageContext.setAttribute("subcode",subcode,PageContext.SESSION_SCOPE);
    pageContext.setAttribute("subname",subname,PageContext.SESSION_SCOPE);
    pageContext.setAttribute("db",db,PageContext.SESSION_SCOPE);
%>
<!DOCTYPE html> 
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CO PO</title>
    <style>
        .gallary {
            width:1000px;
            margin:auto;
        }
    .gal {
        background-color: lightgrey;
        width:300px;
        padding:5px;
        border:1px solid grey;
        border-radius:10px;
        margin:5px;
        margin-bottom: 50px;
        float:left;
    }
    div a {
       text-decoration: none; 
       color:navy;
    }
    li{
        list-style-position: inside;
        text-align:left;
    }
    #back{
            color:black;
            text-decoration: none;
            background-color: lightslategray;
            border:3px solid black;
            padding:5px;
            width:200px;
            clear:left;
    }
    #back a{
        color:black;
    }
    </style>
</head>
<body>
    <center>
    <h1><%="Batch "+tab%></h1> 
    <h1><%=subcode+" - "+subname%></h1><hr>
    <div class="gallary">
        <div class="gal">
        <h2>Student Name List</h2>
        <ul>
        <li><a href="namelist.jsp"> Student Name List</a></li><br>
        <li><a href="sample.jsp"> Student Name List<br>by using excel sheet</a></li><br>
        </ul>
        </div>
        <div class="gal">
        <h2>Marksheets</h2>
        <ul>
        <li><a href="iat1.jsp">Internal Assessment 1</a></li><br>
        <li><a href="iat2.jsp">Internal Assessment 2</a></li><br>
        <li><a href="iat3.jsp">Internal Assessment 3</a></li><br>
        <li><a href="ass1.jsp">Assignment 1</a></li><br>
        <li><a href="ass2.jsp">Assignment 2</a></li><br>
        <li><a href="ass3.jsp">Assignment 3</a></li><br>
        <li><a href="univ.jsp">University Exam</a></li><br>
        </ul>
        </div>
        <div class="gal">
        <h2>Course Outcomes</h2>
        <ul>
        <li><a href="courseoutcomes.jsp">Course outcomes</a></li><br>
        <li><a href="final.jsp">Direct Attainment</a></li><br>
        </ul>
        </div>
    </div>
        <div id="back">
        <a href="batch.jsp?tab=<%=tab%>"><%="Back To "+tab%></a>
    </div>
    </center>
</body>
</html>
<%@ include file="footer.jsp" %>