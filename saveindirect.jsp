<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
<%
String co1=request.getParameter("co1");
String co2=request.getParameter("co2");
String co3=request.getParameter("co3");
String co4=request.getParameter("co4");
String co5=request.getParameter("co5");
String co6=request.getParameter("co6");

String batch=(String)pageContext.getAttribute("batch",PageContext.SESSION_SCOPE);
String dept=(String)pageContext.getAttribute("dept",PageContext.SESSION_SCOPE);
String regno=(String)pageContext.getAttribute("regno",PageContext.SESSION_SCOPE);
String id=(String)pageContext.getAttribute("id",PageContext.SESSION_SCOPE);


Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dept+""+batch+"_"+id,"root","");
Statement st= con.createStatement();
String sql="update indirect set co1='"+co1+"',co2='"+co2+"',co3='"+co3+"',co4='"+co4+"',co5='"+co5+"',co6='"+co6+"',status='Completed' where regno="+regno;
st.executeUpdate(sql);

con.close();
response.sendRedirect("student_home.jsp");


%>