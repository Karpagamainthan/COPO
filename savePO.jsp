<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
<%
String po1=request.getParameter("po1");
String po2=request.getParameter("po2");
String po3=request.getParameter("po3");
String po4=request.getParameter("po4");
String po5=request.getParameter("po5");
String po6=request.getParameter("po6");
String po7=request.getParameter("po7");
String po8=request.getParameter("po8");
String po9=request.getParameter("po9");
String po10=request.getParameter("po10");
String po11=request.getParameter("po11");
String po12=request.getParameter("po12");
String type=request.getParameter("type");

String batch=(String)pageContext.getAttribute("batch",PageContext.SESSION_SCOPE);
String dept=(String)pageContext.getAttribute("dept",PageContext.SESSION_SCOPE);


Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dept+""+batch,"root","");
Statement st= con.createStatement();
String sql="update survey set po1='"+po1+"',po2='"+po2+"',po3='"+po3+"',po4='"+po4+"',po5='"+po5+"',po6='"+po6+"',po7='"+po7+"',po8='"+po8+"',po9='"+po9+"',po10='"+po10+"',po11='"+po11+"',po12='"+po12+"' where type='"+type+"'";
st.executeUpdate(sql);

sql="delete from "+type;
st.executeUpdate(sql);
con.close();

response.sendRedirect(""+type+"survey.jsp");


%>