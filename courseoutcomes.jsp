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
    <title>Document</title>
</head>
<body>
    
</body>
</html>
<%@ include file="footer.jsp" %>