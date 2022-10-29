<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ include file="header.jsp" %>
<%
    String id=request.getParameter("id");
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/co","root","");
    Statement st= con.createStatement();
    String sql="delete from itbatches where id='"+id+"'";
    st.executeUpdate(sql);
    response.sendRedirect("itbatches.jsp");
%>
<%@ include file="footer.jsp" %>