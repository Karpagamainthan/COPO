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
{   String regno=request.getParameter("regno");
    String total=request.getParameter("total");
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root","");
    Statement st= con.createStatement();
    String sql="update univ set total='"+total+"' where regno='"+regno+"'";
    st.executeUpdate(sql);
    String pass="univ.jsp";
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
    <center>
        <h1><%="Batch "+tab%></h1> 
        <h1><%=subcode+" - "+subname%></h1><hr></center>
    <h1>Update University Marks</h1>
    <div id="form">
        <form method="POST" action="#">
            <%
            String id=request.getParameter("id");
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root","");
            Statement st= con.createStatement();
            String sql="select * from univ where id="+id;
            ResultSet rs=st.executeQuery(sql);
            while(rs.next())
            {

            %>
            <label for="regno">Reg Number</label><br>
            <input type="text" id="regno" placeholder="Reg Number" value="<%=rs.getString("regno")%>" name="regno" readonly><br>
            <label for="total">Total Marks</label><br>
            <input type="number" id="total" placeholder="Total" name="total" value="<%=rs.getString("total")%>" size="30" min="0" max="100" required><br>
            <%
            }
            %>
            <input type="submit" value="Update" name="submit">   <input type="reset" value="Reset" name="reset">
            </form>
            <center id="main"><a href="univ.jsp">Back To IAT1</a></center>
    </div>
</body>
</html>
<%@ include file="footer.jsp" %>