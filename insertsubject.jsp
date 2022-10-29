<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
<%@ include file="header.jsp" %>
<%
    String tab=(String)pageContext.getAttribute("tab",PageContext.SESSION_SCOPE);
    String sem=request.getParameter("sem");
    String subcode=request.getParameter("subcode");
    String subname=request.getParameter("subname");
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/co","root","");
    Statement st= con.createStatement();
    String sql="insert into "+tab+"(sem,subcode,subname) values('"+sem+"','"+subcode+"','"+subname+"')";
    st.executeUpdate(sql);
%>
<% 
    int id=0; 
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/co","root","");
    Statement st1= con1.createStatement();
    String sql1="select MAX(id) from "+tab;
    ResultSet rs1=st1.executeQuery(sql1);
    while(rs1.next())
    {
        id=rs1.getInt("MAX(id)");
    }
    response.sendRedirect("createdb.jsp?id="+id);
    
%>
<%@ include file="footer.jsp" %>