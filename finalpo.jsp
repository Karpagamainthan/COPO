<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.Math"%>
<%@ include file="header.jsp" %>

<%
String tab=(String)pageContext.getAttribute("tab",PageContext.SESSION_SCOPE);
String db=(String)pageContext.getAttribute("db",PageContext.SESSION_SCOPE);

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
            margin-bottom: 40px;
        }
        td,th {
            padding:10px;
            width:50px;
            text-align: center;
        }
        #a1{
            color:black;
            text-decoration: none;
            background-color: lightslategray;
            border:3px solid black;
            padding:5px;
            margin:0px 8px;

        }
        .c1
        {
            width: 100px;
        }
        #c2
        {
            text-align: right;
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
    </div>
    <hr>
    <table border="1">
        <thead>
            <tr>
                <th class="c1">Method</th>
                <th>Weightage %</th>
                <th>PO1</th>
                <th>PO2</th>
                <th>PO3</th>
                <th>PO4</th>
                <th>PO5</th>
                <th>PO6</th>
                <th>PO7</th>
                <th>PO8</th>
                <th>PO9</th>
                <th>PO10</th>
                <th>PO11</th>
                <th>PO12</th>
            </tr>
        </thead>
        <% 
        
        Class.forName("com.mysql.jdbc.Driver");
        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+tab,"root","");
        Statement st= con.createStatement();
        String sql="select * from po";
        ResultSet rs=st.executeQuery(sql);
        while(rs.next())
        {
            %>
            <tr>
                <td><%=rs.getString("po")%></td>
                <td><%=rs.getString("weightage")%>%</td>
                <td><%=rs.getFloat("PO1")%></td>
                <td><%=rs.getFloat("PO2")%></td>
                <td><%=rs.getFloat("PO3")%></td>
                <td><%=rs.getFloat("PO4")%></td>
                <td><%=rs.getFloat("PO5")%></td>
                <td><%=rs.getFloat("PO6")%></td>
                <td><%=rs.getFloat("PO7")%></td>
                <td><%=rs.getFloat("PO8")%></td>
                <td><%=rs.getFloat("PO9")%></td>
                <td><%=rs.getFloat("PO10")%></td>
                <td><%=rs.getFloat("PO11")%></td>
                <td><%=rs.getFloat("PO12")%></td>
            </tr>

            <%
        }
        
        %>
        <tr>
            <td colspan="2" id="c2"><b>PO Attainment</b></td>
            <%
                sql="select sum(po1),sum(po2),sum(po3),sum(po4),sum(po5),sum(po6),sum(po7),sum(po8),sum(po9),sum(po10),sum(po11),sum(po12) from po";
                rs=st.executeQuery(sql);
                rs.next();
                for(int i=1;i<=12;i++)
                {
                    %>
                        <td><b><%=Math.round(rs.getFloat(i)*100.0)/100.0%></b></td>
                    <%
                }
                con.close();
            %>
        </tr>
    </table>
    <a id="a1" href="po_home.jsp?tab=<%=tab%>">Back To <%=batch%></a>
    </center>
</body>
</html>
<%@ include file="footer.jsp" %>