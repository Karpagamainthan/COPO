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
    String co1=request.getParameter("co1");
    String co2=request.getParameter("co2");
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root","");
    Statement st= con.createStatement();
    String sql="update iat1 set co1='"+co1+"',co2='"+co2+"' where regno='"+regno+"'";
    st.executeUpdate(sql);
    String pass="iat1.jsp"; 
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
    <h1>Update IAT 1 Marks</h1>
    <div id="form">
        <form method="POST" action="#">
            <%
            String id=request.getParameter("id");
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root","");
            Statement st= con.createStatement();
            String sql="select * from iat1 where id="+id;
            ResultSet rs=st.executeQuery(sql);
            while(rs.next())
            {

            %>
            <label for="regno">Reg Number</label><br>
            <input type="text" id="regno" placeholder="Reg Number" value="<%=rs.getString("regno")%>" name="regno" readonly><br>
            <label for="co1">CO1 Marks</label><br>
            <input type="number" id="co1" placeholder="CO1" name="co1" value="<%=rs.getString("co1")%>" size="30" min="0" max="30" required><br>
            <label for="co2">CO2 Marks</label><br>
            <input type="number" id="co2" placeholder="CO2" name="co2" value="<%=rs.getString("co2")%>" size="30" min="0" max="20" required><br><br>
            <%
            }
            %>
            <input type="submit" value="Update" name="submit">   <input type="reset" value="Reset" name="reset">
            </form>
            <center id="main"><a href="iat1.jsp">Back To IAT1</a></center>
    </div>
</body>
</html>
<%@ include file="footer.jsp" %>