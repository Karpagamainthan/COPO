<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*"%>
<%@ include file="header.jsp" %>
<%
String tab=(String)pageContext.getAttribute("tab",PageContext.SESSION_SCOPE);
String db=(String)pageContext.getAttribute("db",PageContext.SESSION_SCOPE);
String batch=(String)pageContext.getAttribute("batch",PageContext.SESSION_SCOPE);
String dept=(String)pageContext.getAttribute("dept",PageContext.SESSION_SCOPE);
String id=request.getParameter("id");
Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dept,"root","");
    Statement st= con.createStatement();
    String sql="delete from "+batch+" where id='"+id+"'";
    st.executeUpdate(sql);
    
    String pass="ponamelist.jsp";
    con.close();
    response.sendRedirect(pass);
%>
<%@ include file="footer.jsp" %>