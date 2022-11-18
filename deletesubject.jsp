<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ include file="header.jsp" %>
<%
    String tab=(String)pageContext.getAttribute("tab",PageContext.SESSION_SCOPE);
    String id=request.getParameter("id");
    Class.forName("com.mysql.jdbc.Driver");

    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/","root","");
    Statement st= con.createStatement();
    String sql="drop database "+tab+"_"+id+"";
    st.executeUpdate(sql);

    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/co","root","");
    st= con.createStatement();
    sql="delete from "+tab+" where id='"+id+"'";
    st.executeUpdate(sql);
    response.sendRedirect("batch.jsp?tab="+tab);
%>
<%@ include file="footer.jsp" %> 