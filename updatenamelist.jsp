<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*"%>
<%@ include file="header.jsp" %>
<%
String tab=(String)pageContext.getAttribute("tab",PageContext.SESSION_SCOPE);
String db=(String)pageContext.getAttribute("db",PageContext.SESSION_SCOPE);
String subcode=(String)pageContext.getAttribute("subcode",PageContext.SESSION_SCOPE);
String subname=(String)pageContext.getAttribute("subname",PageContext.SESSION_SCOPE);
%>
<%
if(request.getParameter("submit")!=null)
{   String id=request.getParameter("id"); 
    String regno=request.getParameter("regno");
    String name=request.getParameter("name");
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root","");
    Statement st= con.createStatement();
    String sql="update namelist set regno='"+regno+"',name='"+name+"' where id='"+id+"'";
    String sql1="update iat1 set regno='"+regno+"',name='"+name+"' where id='"+id+"'";
    String sql2="update iat2 list set regno='"+regno+"',name='"+name+"' where id='"+id+"'";
    String sql3="update iat3 set regno='"+regno+"',name='"+name+"' where id='"+id+"'";
    String sql4="update ass1 set regno='"+regno+"',name='"+name+"' where id='"+id+"'";
    String sql5="update ass2 set regno='"+regno+"',name='"+name+"' where id='"+id+"'";
    String sql6="update ass3 set regno='"+regno+"',name='"+name+"' where id='"+id+"'";
    String sql7="update univ set regno='"+regno+"',name='"+name+"' where id='"+id+"'";
    st.executeUpdate(sql);
    st.executeUpdate(sql1);
    st.executeUpdate(sql2);
    st.executeUpdate(sql3);
    st.executeUpdate(sql4);
    st.executeUpdate(sql5);
    st.executeUpdate(sql6);
    st.executeUpdate(sql7);
    String pass="namelist.jsp";
    response.sendRedirect(pass);
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CO PO</title>
    <style>
       form {
            width:250px;
            background-color: gray;
            padding:20px;
            margin-right:100px;
            margin-bottom: 30px;
        }
        #form{
            float:left;
        }
        #form a{
            color:black;
            text-decoration: none;
            background-color: lightslategray;
            border:3px solid black;
            padding:5px;
            margin:0px 8px;
        }
        label,input {
            margin:10px;
        }
        input[type="text"]
        {
            padding:5px;
        }
        #main
        {
            padding-bottom: 5%;
        }
    </style>
</head>
<body>
    <center>
        <h1><%="Batch "+tab%></h1> 
        <h1><%=subcode+" - "+subname%></h1><hr></center>
    <h1>Update Data</h1>
    <div id="form">
        <form method="POST" action="#">
            <%
            String id=request.getParameter("id");
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root","");
            Statement st= con.createStatement();
            String sql="select * from namelist where id="+id;
            ResultSet rs=st.executeQuery(sql);
            while(rs.next())
            {

            %>
            <label for="regno">Reg Number</label><br>
            <input type="text" id="regno" placeholder="Reg Number" value="<%=rs.getString("regno")%>" name="regno" required><br>
            <label for="name">Student Name</label><br>
            <input type="text" id="name" placeholder="Student Name" value="<%=rs.getString("name")%>" name="name" required><br><br>
            <%
            }
            %>
            <input type="submit" value="Update" name="submit">   <input type="reset" value="Reset" name="reset">
            </form>
            <center  id="main"><a href="namelist.jsp">Back To Namelist</a></center>
            <br>
    </div>
</body>
</html>
<%@ include file="footer.jsp" %>