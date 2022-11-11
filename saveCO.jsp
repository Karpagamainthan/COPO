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
String indirect=request.getParameter("indirect");
String id=(String)pageContext.getAttribute("id",PageContext.SESSION_SCOPE);
String tab=(String)pageContext.getAttribute("tab",PageContext.SESSION_SCOPE);
String db=(String)pageContext.getAttribute("db",PageContext.SESSION_SCOPE);

Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/co","root","");
Statement st= con.createStatement();
String sql="update "+tab+" set co1='"+co1+"',co2='"+co2+"',co3='"+co3+"',co4='"+co4+"',co5='"+co5+"',co6='"+co6+"' where id="+id;
st.executeUpdate(sql);
if(indirect!=null)
{
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root","");
    st=con.createStatement();
    sql="update indirect set co1=0,co2=0,co3=0,co4=0,co5=0,co6=0,total=0";
    st.executeUpdate(sql);
}

response.sendRedirect("courseoutcomes.jsp");


%>