<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
<%@ include file="header.jsp" %>
<%
    String tab=request.getParameter("tab");
    String batch=tab.substring(2);
    pageContext.setAttribute("tab",tab,PageContext.SESSION_SCOPE);
    pageContext.setAttribute("batch",batch,PageContext.SESSION_SCOPE);
    String deptname=(String)pageContext.getAttribute("deptname",PageContext.SESSION_SCOPE);
    String dept=(String)pageContext.getAttribute("dept",PageContext.SESSION_SCOPE);
%>  
<!DOCTYPE html> 
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CO PO</title>
    <style>
    .gallary 
    {
        display:flex;
        justify-content:space-evenly;
        flex-wrap: wrap;
    }

    .gal 
    {
        background-color: lightgrey;
        width:300px;
        padding:5px;
        border:1px solid grey;
        border-radius:10px;
        margin:5px;
        margin-bottom: 30px;
        float:left;
        height: 300px;
       
    }

    div a 
    {
       text-decoration: none; 
       color:navy;
    }
    li{
        list-style-position: inside;
        text-align:left;
        font-size: 20px;
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
    </div>
    <hr>
    <center>
    <div class="gallary">
        <div class="gal">
        <h2 class="cc1">Student Name List</h2>
        <ul>
        <li><a href="ponamelist.jsp"> Student Name List</a></li><br>
        </ul>
        <h2  class="cc1">PO Mappings</h2>
        <ul>
        <li><a href="allpomappings.jsp">PO Mappings</a></li><br>
        </ul>
        </div>
        <div class="gal">
        <h2  class="cc1">Course Outcomes</h2>
        <ul>
        <li><a href="batch.jsp?tab=<%=tab %>">All Courses</a></li><br>
        </ul>
        <h2 class="cc1">Direct PO Attainment</h2>
        <ul>
        <li><a href="podirect.jsp">Direct PO Attainment</a></li><br>
        </ul>
        </div>
        <div class="gal">
        <h2 class="cc1">Indirect PO Attainment</h2>
        <ul>
        <li><a href="alumnisurvey.jsp">Alumni Survey</a></li><br>
        <li><a href="parentsurvey.jsp">Parent Survey</a></li><br>
        <li><a href="indirectpo.jsp">Indirect PO Attainment</a></li><br>
        </ul>
        <h2 class="cc1">Final PO Attainment</h2>
        <ul>
        <li><a href="finalpo.jsp">Final PO Attainment</a></li><br>
        </ul>
        </div>
    </div>
        <div id="back">
        <a href="deptbatches.jsp?dept=<%=dept%>&deptname=<%=deptname%>">Back To <%= dept.toUpperCase()%></a>
    </div>
    </center>
</body>
</html>
<%@ include file="footer.jsp" %>