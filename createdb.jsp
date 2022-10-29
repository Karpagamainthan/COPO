<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
<%@ include file="header.jsp" %>
<%
    String tab=(String)pageContext.getAttribute("tab",PageContext.SESSION_SCOPE);
    String id=request.getParameter("id");
    String db=tab+"_"+id;
    Connection con=null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306","root","");
    Statement st=con.createStatement();
    String sql="create database "+db;
    st.executeUpdate(sql);
    response.sendRedirect("createnamelisttable.jsp?db="+db);
%>
<%@ include file="footer.jsp" %> 