<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.Math"%>
<%@ include file="header.jsp" %>

<%
String tab=(String)pageContext.getAttribute("tab",PageContext.SESSION_SCOPE);
String db=(String)pageContext.getAttribute("db",PageContext.SESSION_SCOPE);
String subcode=(String)pageContext.getAttribute("subcode",PageContext.SESSION_SCOPE);
String subname=(String)pageContext.getAttribute("subname",PageContext.SESSION_SCOPE);
String id=(String)pageContext.getAttribute("id",PageContext.SESSION_SCOPE);
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
            border:1px solid grey;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        td,th {
            padding:10px;
            width:100px;
        }
        #a1{
            color:black;
            text-decoration: none;
            background-color: lightslategray;
            border:3px solid black;
            padding:5px;
            margin:0px 8px;
        }
    </style>
</head>
<body>
    <center>
        <h1><%="Batch "+tab%></h1> 
        <h1><%=subcode+" - "+subname%></h1><hr>
    <table border="1">
        <thead>
            <tr>
                <th>No</th>
                <th>Reg No</th>
                <th>Name</th>
                <th>CO1</th>
                <th>CO2</th>
                <th>CO3</th>
                <th>CO4</th>
                <th>CO5</th>
                <th>CO6</th>
                <th>Status</th>
                <th>Re-Enable</th>
            </tr>
        </thead>
        <% 
        int i=1;
        Class.forName("com.mysql.jdbc.Driver");
        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root","");
        Statement st= con.createStatement();
        String sql="select * from indirect";
        ResultSet rs=st.executeQuery(sql);
        while(rs.next())
        {
        %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("regno")%></td>
                <td><%=rs.getString("name")%></td>
                <td><%=rs.getInt("co1")%></td>
                <td><%=rs.getInt("co2")%></td>
                <td><%=rs.getInt("co3")%></td>
                <td><%=rs.getInt("co4")%></td>
                <td><%=rs.getInt("co5")%></td>
                <td><%=rs.getInt("co6")%></td>
                <td><%=rs.getString("status")%></td>
                <td><a href="enableSurvey.jsp?id=<%=rs.getInt("id")%>"</a></td>
            </tr>
        <%
        i++;
        }
        sql="select avg(co1),avg(co2),avg(co3),avg(co4),avg(co5),avg(co6) from indirect";
        rs=st.executeQuery(sql);
        rs.next();
        
        %>
        <tr>
            <td colspan="3" align="right">Average</td>
            <td><%=rs.getFloat(1)%></td>
            <td><%=rs.getFloat(2)%></td>
            <td><%=rs.getFloat(3)%></td>
            <td><%=rs.getFloat(4)%></td>
            <td><%=rs.getFloat(5)%></td>
            <td><%=rs.getFloat(6)%></td>
        </tr>
        <tr>
            <td colspan="3" align="right"><b>CO Indirect Attainment</b></td>
            <%
            rs=st.executeQuery(sql);
            rs.next();
            float avg=rs.getFloat(1)+rs.getFloat(2)+rs.getFloat(3)+rs.getFloat(4)+rs.getFloat(5)+rs.getFloat(6);
            avg=avg/6;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/co","root","");
            st= con.createStatement();
            sql="update "+tab+" set indirect="+avg+" where id="+id;
            st.executeUpdate(sql);
            con.close();
            %>
            <td colspan="6" align="left"><b><%=avg%></b></td>
        </tr>
    </table>
    <a id="a1" href="subject.jsp?id=<%=id%>&subname=<%=subname%>&subcode=<%=subcode%>">Back To Course</a>
    </center>
</body>
</html>
<%@ include file="footer.jsp" %>