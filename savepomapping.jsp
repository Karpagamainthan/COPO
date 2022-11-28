<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
<%

String id=(String)pageContext.getAttribute("id",PageContext.SESSION_SCOPE);
String tab=(String)pageContext.getAttribute("tab",PageContext.SESSION_SCOPE);
String db=(String)pageContext.getAttribute("db",PageContext.SESSION_SCOPE);

Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/co","root","");
Statement st= con.createStatement();
String sql="select co from "+tab+" where id="+id;
ResultSet rs=st.executeQuery(sql);
rs.next();
float a=rs.getFloat("co");

con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root","");
st= con.createStatement();
for(int i=1;i<=6;i++)
{
sql="update po set po1="+request.getParameter("co"+i+"po1")+",po2="+request.getParameter("co"+i+"po2")+",po3="+request.getParameter("co"+i+"po3")+",po4="+request.getParameter("co"+i+"po4")+",po5="+request.getParameter("co"+i+"po5")+",po6="+request.getParameter("co"+i+"po6")+",po7="+request.getParameter("co"+i+"po7")+",po8="+request.getParameter("co"+i+"po8")+",po9="+request.getParameter("co"+i+"po9")+",po10="+request.getParameter("co"+i+"po10")+",po11="+request.getParameter("co"+i+"po11")+",po12="+request.getParameter("co"+i+"po12")+" where co="+i;
st.executeUpdate(sql);
}

for(int i=1;i<=12;i++)
{
sql="update po set po"+i+"=ROUND((SELECT ((select sum(po"+i+") from po where co in (1,2,3,4,5,6))/6),2) where co in (7,8)";
st.executeUpdate(sql);
}



for(int i=1;i<=12;i++)
{
sql="update po set po"+i+"=po"+i+"*"+a+" where co=8";
st.executeUpdate(sql);
}


con.close();
response.sendRedirect("poMapping.jsp");


%>