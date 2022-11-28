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
String batch=(String)pageContext.getAttribute("batch",PageContext.SESSION_SCOPE);
String deptname=(String)pageContext.getAttribute("deptname",PageContext.SESSION_SCOPE);
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
    <center>
        <div class="outercontainer">
        <div class="sub">Department : <%= deptname.toUpperCase()  %></div>
        <div class="sub">Batch : <%= batch.toUpperCase()  %></div>
        <div class="sub">Course Code : <%= subcode.toUpperCase()%></div>
        <div class="sub">Course Name : <%=subname.toUpperCase()  %></div>
    </div>
    <hr>
    <table border="1">
        <thead>
            <tr>
                <th>Method</th>
                <th>Attainment</th>
                <th>Weightage %</th>
                <th>Final Attainment</th>
            </tr>
        </thead>
        <% 
        
        Class.forName("com.mysql.jdbc.Driver");
        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/co","root","");
        Statement st= con.createStatement();
        String sql="select direct,indirect from "+tab+" where id="+id;
        ResultSet rs=st.executeQuery(sql);
        rs.next();
        float a,b;
        a=rs.getFloat("direct");
        double a1=a*0.8;
        a1=Math.round(a1*100.0)/100.0;
        b=rs.getFloat("indirect");
        double b1=b*0.2;
        b1=Math.round(b1*100.0)/100.0;

        double c1=a1+b1;
        c1=Math.round(c1*100.0)/100.0;

        sql="update "+tab+" set co="+c1+" where id="+id;
        st.executeUpdate(sql);
        con.close();
        %>
        <tr>
            <td>Direct</td>
            <td><%= a%></td>
            <td>80</td>
            <td><%=a1 %></td>
        </tr>
        <tr>
            <td>Indirect</td>
            <td><%= b%></td>
            <td>20</td>
            <td><%=b1 %></td>
        </tr>
        <tr>
            <td colspan="3" align="right"><b>
                Course Outcome Attainment
            </b></td>
            <td><b><%=c1 %></b></td>
        </tr>
    </table>
    <a id="a1" href="subject.jsp?id=<%=id%>&subname=<%=subname%>&subcode=<%=subcode%>">Back To Course</a>
    </center>
</body>
</html>
<%@ include file="footer.jsp" %>