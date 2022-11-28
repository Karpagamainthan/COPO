<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*"%>
<%@ include file="header.jsp" %>
<%
String tab=(String)pageContext.getAttribute("tab",PageContext.SESSION_SCOPE);
String db=(String)pageContext.getAttribute("db",PageContext.SESSION_SCOPE);
String dept=(String)pageContext.getAttribute("dept",PageContext.SESSION_SCOPE);
String batch=tab.substring(2);

%>
<%
if(request.getParameter("submit")!=null)
{   
    try
    {
    String regno=request.getParameter("regno");
    String name=request.getParameter("name");
    String email=request.getParameter("email"); 
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dept,"root","");
    Statement st= con.createStatement();
    String sql="insert into "+batch+"(regno,name,email) values('"+regno+"','"+name+"','"+email+"')";
    st.executeUpdate(sql);
    
    String pass="ponamelist.jsp";
    con.close();

    response.sendRedirect(pass);
}
catch(Exception e)
{
    
    response.sendRedirect("ponamelist.jsp?msg=1");
}
}

%>
<%@ include file="footer.jsp" %>