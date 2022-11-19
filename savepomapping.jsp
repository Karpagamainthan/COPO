<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
<%

String id=(String)pageContext.getAttribute("id",PageContext.SESSION_SCOPE);
String tab=(String)pageContext.getAttribute("tab",PageContext.SESSION_SCOPE);
String db=(String)pageContext.getAttribute("db",PageContext.SESSION_SCOPE);

Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root","");
Statement st= con.createStatement();
for(int i=1;i<=6;i++)
{
String sql="update po set po1="+request.getParameter("co"+i+"po1")+",po2="+request.getParameter("co"+i+"po2")+",po3="+request.getParameter("co"+i+"po3")+",po4="+request.getParameter("co"+i+"po4")+",po5="+request.getParameter("co"+i+"po5")+",po6="+request.getParameter("co"+i+"po6")+",po7="+request.getParameter("co"+i+"po7")+",po8="+request.getParameter("co"+i+"po8")+",po9="+request.getParameter("co"+i+"po9")+",po10="+request.getParameter("co"+i+"po10")+",po11="+request.getParameter("co"+i+"po11")+",po12="+request.getParameter("co"+i+"po12")+" where co="+i;
st.executeUpdate(sql);
}
for(int i=1;i<=12;i++)
{
String sql="update po set po"+i+"=ROUND((SELECT ((select sum(po"+i+") from po)-(select po"+i+" from po where co=7))/6),2) where co=7";
st.executeUpdate(sql);
}

response.sendRedirect("poMapping.jsp");


%>