<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
<%@ include file="header.jsp" %>
<%
    String tab=request.getParameter("tab");
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/co","root","");
    Statement st= con.createStatement();
    String sql="create table "+tab+"(id int AUTO_INCREMENT primary key,sem int,subcode varchar(30),subname varchar(30))";
    st.executeUpdate(sql);
    response.sendRedirect("itbatches.jsp");
%>
<%@ include file="footer.jsp" %>