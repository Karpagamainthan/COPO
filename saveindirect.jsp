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
String db=dept+""+batch+"_"+id;
String tab=dept+""+batch;

Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dept+""+batch+"_"+id,"root","");
Statement st= con.createStatement();
String sql="update indirect set co1='"+co1+"',co2='"+co2+"',co3='"+co3+"',co4='"+co4+"',co5='"+co5+"',co6='"+co6+"',status='Completed' where regno="+regno;
st.executeUpdate(sql);

sql="select avg(co1),avg(co2),avg(co3),avg(co4),avg(co5),avg(co6) from indirect";
ResultSet rs=st.executeQuery(sql);
rs.next();
float avg=rs.getFloat(1)+rs.getFloat(2)+rs.getFloat(3)+rs.getFloat(4)+rs.getFloat(5)+rs.getFloat(6);
avg=avg/6;

con = DriverManager.getConnection("jdbc:mysql://localhost:3306/co","root","");
st= con.createStatement();
sql="update "+dept+""+batch+" set indirect="+avg+" where id="+id;
st.executeUpdate(sql);

con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root","");
st= con.createStatement();
float a=avg;
for(int i=1;i<=12;i++)
{
sql="update po set po"+i+"=round(po"+i+"*"+a+",2) where co=8";
st.executeUpdate(sql);
}

sql="select * from po where co=8";
rs=st.executeQuery(sql);
rs.next();

con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+tab,"root","");
st= con.createStatement();
for(int i=1;i<=12;i++)
{
float c=rs.getFloat("po"+i);
sql="update directpo set po"+i+"="+c+" where id="+id;
st.executeUpdate(sql);
}

con.close();
response.sendRedirect("student_home.jsp");


%>