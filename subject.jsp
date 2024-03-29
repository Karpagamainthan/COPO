<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
<%@ include file="header.jsp" %>
<%
    String tab=(String)pageContext.getAttribute("tab",PageContext.SESSION_SCOPE);
    String batch=(String)pageContext.getAttribute("batch",PageContext.SESSION_SCOPE);
    String deptname=(String)pageContext.getAttribute("deptname",PageContext.SESSION_SCOPE);
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
            display:flex;
        justify-content:center;
        flex-wrap: wrap;
        }
    .gal {
        background-color: lightgrey;
        width:300px;
        padding:5px;
        border:1px solid grey;
        border-radius:10px;
        margin:5px;
        margin-bottom: 50px;
        
        height: 350px;
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
    h2
    {
        text-align:center;
    }
    .cc1
    {
        text-align: left;
        margin-left: 50px;
    }

    .outercontainer
    {
        display:flex;
        justify-content:space-evenly;
        background-color:#038047;
        flex-wrap: wrap;
    }

    .sub
    {
        text-align: center;
        font-size: 20px;
        background-color:#038047;
        padding: 6px 10px;
        margin: 5px;
        color: white;
        
    }
    </style>
</head>
<body>
    <div class="outercontainer">
        <div class="sub">Department : <%= deptname.toUpperCase()  %></div>
        <div class="sub">Batch : <%= batch.toUpperCase()  %></div>
        <div class="sub">Course Code : <%= subcode.toUpperCase()%></div>
        <div class="sub">Course Name : <%=subname.toUpperCase()  %></div>
    </div>
    <hr>
    <center>
    <div class="gallary">
        <div class="gal">
        <h2 class="cc1">Student Name List</h2>
        <ul>
        <li><a href="namelist.jsp"> Student Name List</a></li><br>
        </ul>
        <h2 class="cc1">Course Outcomes</h2>
        <ul>
        <li><a href="courseoutcomes.jsp">Course Outcomes</a></li><br>
        </ul>
        <h2  class="cc1">PO Mappings</h2>
        <ul>
        <li><a href="poMapping.jsp">PO Mappings</a></li><br>
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
        <h2 class="cc1">Direct Attainment</h2>
        <ul>
        <li><a href="final.jsp">Direct Attainment</a></li><br>
        </ul>
        <h2 class="cc1">Indirect Attainment</h2>
        <ul>
        <li><a href="indirectfinal.jsp">Indirect Attainment</a></li><br>
        </ul>
        <h2 class="cc1">Final CO Attainment</h2>
        <ul>
        <li><a href="finalCo.jsp">Final CO Attainment</a></li><br>
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