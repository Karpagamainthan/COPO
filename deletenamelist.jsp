<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*"%>
<%@ include file="header.jsp" %>
<%
String tab=(String)pageContext.getAttribute("tab",PageContext.SESSION_SCOPE);
String db=(String)pageContext.getAttribute("db",PageContext.SESSION_SCOPE);
String subcode=(String)pageContext.getAttribute("subcode",PageContext.SESSION_SCOPE);
String subname=(String)pageContext.getAttribute("subname",PageContext.SESSION_SCOPE);
String id=request.getParameter("id");
Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root","");
    Statement st= con.createStatement();
    String sql="delete from namelist where id='"+id+"'";
    String sql1="delete from iat1 where id='"+id+"'";
    String sql2="delete from iat2 where id='"+id+"'";
    String sql3="delete from iat3 where id='"+id+"'";
    String sql4="delete from ass1 where id='"+id+"'"; 
    String sql5="delete from ass2 where id='"+id+"'";
    String sql6="delete from ass3 where id='"+id+"'";
    String sql7="delete from univ where id='"+id+"'";
    st.executeUpdate(sql);
    st.executeUpdate(sql1);
    st.executeUpdate(sql2);
    st.executeUpdate(sql3);
    st.executeUpdate(sql4);
    st.executeUpdate(sql5);
    st.executeUpdate(sql6);
    st.executeUpdate(sql7);
    String pass="namelist.jsp";
    con.close();
    response.sendRedirect(pass);
%>
<%@ include file="footer.jsp" %>