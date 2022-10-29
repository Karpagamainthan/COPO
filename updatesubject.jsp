<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ include file="header.jsp" %>
<%
String tab=(String)pageContext.getAttribute("tab",PageContext.SESSION_SCOPE);
%>
<%
if(request.getParameter("submit")!=null)
{   String id=request.getParameter("id");
    String sem=request.getParameter("sem");
    String subcode=request.getParameter("subcode");
    String subname=request.getParameter("subname");
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/co","root","");
    Statement st= con.createStatement();
    String sql="update "+tab+" set sem='"+sem+"',subcode='"+subcode+"',subname='"+subname+"' where id='"+id+"'";
    st.executeUpdate(sql);
    String pass="batch.jsp?tab="+tab;
    response.sendRedirect(pass); 
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
    <h1>Update Data</h1>
    <div id="form">
        <form method="POST" action="#">
            <%
            String id=request.getParameter("id");
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/co","root","");
            Statement st= con.createStatement();
            String sql="select * from "+tab+" where id="+id;
            ResultSet rs=st.executeQuery(sql);
            while(rs.next())
            {

            %>
            <label for="sem">Semester</label><br>
            <input type="number" id="sem" placeholder="Sem" name="sem" size="30" min="1" max="8" value="<%=rs.getString("sem")%>" required><br>
            <label for="subcode">Subject Code</label><br>
            <input type="text" id="subcode" placeholder="Subject Code" name="subcode" size="30" value="<%=rs.getString("subcode")%>" required><br>
            <label for="subname">Subject Title</label><br>
            <input type="text" id="subname" placeholder="Subject Title" name="subname" size="30" value="<%=rs.getString("subname")%>" required><br>
            <%
            }
            %>
            <input type="submit" value="Update" name="submit">   <input type="reset" value="Reset" name="reset">
            </form>
        <center id="main"><a href="itbatches.jsp">Back To Batches</a></center>
    </div>
</body>
</html>
<%@ include file="footer.jsp" %>