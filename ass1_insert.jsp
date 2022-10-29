<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*"%>
<%@ include file="header.jsp" %>
<%
String tab=(String)pageContext.getAttribute("tab",PageContext.SESSION_SCOPE);
String db=(String)pageContext.getAttribute("db",PageContext.SESSION_SCOPE);
String subcode=(String)pageContext.getAttribute("subcode",PageContext.SESSION_SCOPE);
String subname=(String)pageContext.getAttribute("subname",PageContext.SESSION_SCOPE);
String id=(String)pageContext.getAttribute("id",PageContext.SESSION_SCOPE);
%>




<%
if(request.getParameter("submit")!=null)
{  
    String regno=request.getParameter("regno");
    String co1=request.getParameter("co1");
    String co2=request.getParameter("co2");
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root","");
    Statement st= con.createStatement();
    String sql="update ass1 set co1="+co1+",co2="+co2+" where regno='"+regno+"'";
    st.executeUpdate(sql);
    String pass="ass1.jsp";
    response.sendRedirect(pass);
}
%>
<%@ include file="footer.jsp" %>