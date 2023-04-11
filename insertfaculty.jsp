<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*"%>
<%@ include file="header.jsp" %>
<%@ include file="encryption.jsp" %>
<%
    String name=request.getParameter("name");
    String department=request.getParameter("department");
    String email=request.getParameter("email");
    String password=encrypt(request.getParameter("password"),"siet");

    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/co","root","");
    Statement st= con.createStatement();
    String sql="select * from register where email='"+email+"'";
    ResultSet rs=st.executeQuery(sql);
    if(rs.next())
    {
        response.sendRedirect("admin_home.jsp?msg=1"); 
    }
    else
    {
        sql="insert into register(name,department,email,password) values('"+name+"','"+department+"','"+email+"','"+password+"')";
        st.executeUpdate(sql);
        response.sendRedirect("admin_home.jsp"); 
    }




%>