<%@page import="java.sql.*"%>
<%
String email=request.getParameter("email");
String password=request.getParameter("password");
int a=0;
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/co","root","");
    Statement st= con.createStatement();
    String sql="select * from register";
    String teacher="";
    ResultSet rs=st.executeQuery(sql);
    while(rs.next())
    {
        if(rs.getString("email").equals(email)&&rs.getString("password").equals(password))
        {
            teacher=rs.getString("name");
            a=1;
            break;
        } 
    }
if(a==1)
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