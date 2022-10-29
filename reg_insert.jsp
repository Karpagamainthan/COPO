<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String name=request.getParameter("name");
String department=request.getParameter("department");
String email=request.getParameter("email");
String password=request.getParameter("password");
String cpassword=request.getParameter("cpassword");
if(password.equals(cpassword))
{
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/co","root","");
    Statement st= con.createStatement();
    String sql="insert into register(name,department,email,password) values('"+name+"','"+department+"','"+email+"','"+password+"')";
    st.executeUpdate(sql);
    response.sendRedirect("reg-login.jsp"); 
}
else
{  
    response.sendRedirect("register.jsp"); 
}
%>