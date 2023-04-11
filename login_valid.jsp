<%@page import="java.sql.*"%>
<%@ include file="encryption.jsp" %>
<%
String email=request.getParameter("email");
String password=request.getParameter("password");//Tct8OiiSXCM1SZGrW/66cg==
int a=0;

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/co","root","");
    Statement st= con.createStatement();
    String sql="select * from register";
    String teacher="";
    ResultSet rs=st.executeQuery(sql);
    while(rs.next())
    {
        String pwd=rs.getString("password");
        if(rs.getString("email").equals(email)&&decrypt(pwd,"siet").equals(password))
        {
            teacher=rs.getString("name");
            a=1;
            break;
        } 
    }
    con.close();
if(a==1 && teacher.equals("Admin"))
{
    pageContext.setAttribute("teacher",teacher,PageContext.SESSION_SCOPE);
    response.sendRedirect("admin_home.jsp");  
}
else if(a==1)
{
    pageContext.setAttribute("teacher",teacher,PageContext.SESSION_SCOPE);
    response.sendRedirect("dept_list.jsp");    
}
else
{ 
    RequestDispatcher rd=request.getRequestDispatcher("invalidlogin.jsp"); 
    rd.forward(request, response); 
}
%> 