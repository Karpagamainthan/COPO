<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ include file="header.jsp" %>
<%
String tab=(String)pageContext.getAttribute("tab",PageContext.SESSION_SCOPE);
String batch=tab.substring(2);
String deptname=(String)pageContext.getAttribute("deptname",PageContext.SESSION_SCOPE);
pageContext.setAttribute("batch",batch,PageContext.SESSION_SCOPE); 
%>
<%
if(request.getParameter("submit")!=null)
{   String id=request.getParameter("id");
    String sem=request.getParameter("sem");
    String subcode=request.getParameter("subcode");
    String subname=request.getParameter("subname");

     String co1=request.getParameter("co1");
    String co2=request.getParameter("co2");
    String co3=request.getParameter("co3");
    String co4=request.getParameter("co4");
    String co5=request.getParameter("co5");
    String co6=request.getParameter("co6");

    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/co","root","");
    Statement st= con.createStatement();
    String sql="update "+tab+" set sem='"+sem+"',subcode='"+subcode+"',subname='"+subname+"',co1='"+co1+"',co2='"+co2+"',co3='"+co3+"',co4='"+co4+"',co5='"+co5+"',co6='"+co6+"' where id='"+id+"'";

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
        .outercontainer
    {
        display:flex;
        justify-content:space-evenly;
        background-color:#038047;
    }

    .sub
    {
        text-align: center;
        font-size: 20px;
        background-color:#038047;
        padding: 6px 10px;
        margin: 5px;
        color: white;
        
    }
    </style>
</head>
<body>
    <div class="outercontainer">
        <div class="sub">Department : <%= deptname.toUpperCase()  %></div>
        <div class="sub">Batch : <%= batch.toUpperCase()  %></div>
    </div>
    <hr>
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

            <label for="co1">CO1</label><br>
            <input type="text" id="co1" name="co1" size="30" value="<%=rs.getString("co1")%>" required> 
            <label for="co2">CO2</label><br>
            <input type="text" id="co2" name="co2" size="30" value="<%=rs.getString("co2")%>" required> 
            <label for="co3">CO3</label><br>
            <input type="text" id="co3" name="co3" size="30" value="<%=rs.getString("co3")%>" required> 
            <label for="co4">CO4</label><br>
            <input type="text" id="co4" name="co4" size="30" value="<%=rs.getString("co4")%>" required> 
            <label for="co5">CO5</label><br>
            <input type="text" id="co5" name="co5" size="30" value="<%=rs.getString("co5")%>" required> 
            <label for="co6">CO6</label><br>
            <input type="text" id="co6" name="co6" size="30" value="<%=rs.getString("co6")%>" required> 


            <%
            }
            %>
            <input type="submit" value="Update" name="submit">   <input type="reset" value="Reset" name="reset">
            </form>
        <center id="main"><a href="batch.jsp?tab=<%=tab%>">Back To Batches</a></center>
    </div>
</body>
</html>
<%@ include file="footer.jsp" %>