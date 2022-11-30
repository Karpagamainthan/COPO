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
String name=request.getParameter("name");
String dept=request.getParameter("dept");
String batch=request.getParameter("batch");
String email=request.getParameter("email");




Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dept+""+batch,"root","");
Statement st= con.createStatement();
String sql="insert into alumni(name,email,po1,po2,po3,po4,po5,po6,po7,po8,po9,po10,po11,po12) values('"+name+"','"+email+"',"+po1+","+po2+","+po3+","+po4+","+po5+","+po6+","+po7+","+po8+","+po9+","+po10+","+po11+","+po12+")";
st.executeUpdate(sql);

sql="select avg(po1),avg(po2),avg(po3),avg(po4),avg(po5),avg(po6),avg(po7),avg(po8),avg(po9),avg(po10),avg(po11),avg(po12) from alumni";
ResultSet rs=st.executeQuery(sql);
rs.next();

    sql="update indirectpo set po1="+rs.getFloat(1)+",po2="+rs.getFloat(2)+",po3="+rs.getFloat(3)+",po4="+rs.getFloat(4)+",po5="+rs.getFloat(5)+",po6="+rs.getFloat(6)+",po7="+rs.getFloat(7)+",po8="+rs.getFloat(8)+",po9="+rs.getFloat(9)+",po10="+rs.getFloat(10)+",po11="+rs.getFloat(11)+",po12="+rs.getFloat(12)+" where type='alumni'";
    st.executeUpdate(sql);

con.close();
response.sendRedirect("index.jsp?msg=1");


%>