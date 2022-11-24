<%@page import="java.sql.*"%>
<%
String email=request.getParameter("email");
String password=request.getParameter("password");
int a=0;

        String emailArr[]=email.split("@");
        String batch=emailArr[0].substring(emailArr[0].length()-4,emailArr[0].length()-2);
        String dept=emailArr[0].substring(emailArr[0].length()-2,emailArr[0].length());
        int b1=Integer.parseInt(batch);
        int b2=b1+4;
        batch="20"+b1+"_20"+b2;
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dept,"root","");
    Statement st= con.createStatement();
    String sql="select * from "+batch;
    String teacher="";
    String regno="";
    ResultSet rs=st.executeQuery(sql);
    while(rs.next())
    {
        regno=rs.getString("regno");
        if(rs.getString("email").equals(email)&&regno.equals(password))
        {
            teacher=rs.getString("name");
            a=1;
            break;
        } 
    }
if(a==1)
{
    pageContext.setAttribute("teacher",teacher,PageContext.SESSION_SCOPE);
    pageContext.setAttribute("batch",batch,PageContext.SESSION_SCOPE);
    pageContext.setAttribute("dept",dept,PageContext.SESSION_SCOPE);
    pageContext.setAttribute("regno",regno,PageContext.SESSION_SCOPE);
    response.sendRedirect("student_home.jsp");    
}

else
{ 
    RequestDispatcher rd=request.getRequestDispatcher("student_invalid_login.jsp"); 
    rd.forward(request, response); 
}
%> 