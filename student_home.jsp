<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.Math"%>
<%@ include file="header.jsp" %>

<%
String batch=(String)pageContext.getAttribute("batch",PageContext.SESSION_SCOPE);
String dept=(String)pageContext.getAttribute("dept",PageContext.SESSION_SCOPE);
String regno=(String)pageContext.getAttribute("regno",PageContext.SESSION_SCOPE);
%>
<!DOCTYPE html> 
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CO PO</title>
    <style>
         table {
            border-collapse: collapse;
            margin-bottom: 30px;
        }
        td,th {
            padding:10px;
            border:1px solid grey;
            width:60px;
            text-align: center;
        }
        #stuname{
            width:200px;
        }
        #take
        {
            width:150px;
        }
        #a1{
            color:black;
            text-decoration: none;
            background-color: lightslategray;
            border:3px solid black;
            padding:5px;
            margin:8px ;
        }
    </style>
</head>
<body>
    <center>
        <h1><%="Batch "+batch%></h1> <hr>
        
    <table border="1">
        <thead>
            <tr>
                <th>S.No</th>
                <th>Semester</th>
                <th id="stuname">Subject</th>
                <th>Action</th>
            </tr>
        </thead>
        <% 
        int i=1;
        Class.forName("com.mysql.jdbc.Driver");
        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/co","root","");
        Statement st= con.createStatement();
        String sql="select * from "+dept+""+batch+" where enableindirect=1 order by sem";
        ResultSet rs=st.executeQuery(sql);
        while(rs.next())
        {
            String id=rs.getString("id");
            String subject=rs.getString("subcode")+"-"+rs.getString("subname");
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getInt("sem")%></td>
                <td id="stuname"><%=subject%></td>
                <td id="take">
            <%
            java.sql.Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dept+""+batch+"_"+id,"root","");
            Statement st1= con1.createStatement();
            String sql1="select status from indirect where regno="+regno;
            ResultSet rs1=st1.executeQuery(sql1);
            rs1.next();
            if(rs1.getString("status").equals("Assigned"))
            {
                
                %>
                <a href="indirectSurvey.jsp?id=<%=id%>&subject=<%= subject %>">Take Survey</a>
                <%
            }
            else
            {
            %>
            Completed
            <%
            }
            i++;
            con1.close();
            %>
                </td>
            </tr>
            <%
        }
        %>
        
    </table>
    <a id="a1" href="">Back</a>
    </center>
</body>
</html>
<%@ include file="footer.jsp" %>