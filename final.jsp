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
                <th>CO</th>
                <th>IAT 1</th>
                <th>IAT 2</th>
                <th>IAT 3</th>
                <th>Assignment 1</th>
                <th>Assignment 2</th>
                <th>Assignment 3</th>
                <th>Internal</th>
                <th>Assignment</th>
                <th>University</th>
            </tr>
        </thead>
        <% 
        int iat=0,ass=0,univ=0;
        Class.forName("com.mysql.jdbc.Driver");
        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root","");
        Statement st= con.createStatement();
        String sql="select * from final";
        ResultSet rs=st.executeQuery(sql);
        while(rs.next())
        {
        %>
            <tr>
                <td><%=rs.getString("co")%></td>
                <td><%=rs.getInt("iat1")%></td>
                <td><%=rs.getInt("iat2")%></td>
                <td><%=rs.getInt("iat3")%></td>
                <td><%=rs.getInt("ass1")%></td>
                <td><%=rs.getInt("ass2")%></td>
                <td><%=rs.getInt("ass3")%></td>
                <td><%=rs.getInt("iat1")+rs.getInt("iat2")+rs.getInt("iat3")%></td>
                <td><%=rs.getInt("ass1")+rs.getInt("ass2")+rs.getInt("ass3")%></td>
                <td><%=rs.getInt("univ")%></td>
                <%
                    iat=iat+(rs.getInt("iat1")+rs.getInt("iat2")+rs.getInt("iat3"));
                    ass=ass+(rs.getInt("ass1")+rs.getInt("ass2")+rs.getInt("ass3"));
                    univ=rs.getInt("univ");
                %>
            </tr>
        <%
        }
        double iatavg=(iat*1.0/6);
        iatavg=Math.round(iatavg*100.0)/100.0;
        double assavg=(ass*1.0/6);
        assavg=Math.round(assavg*100.0)/100.0;
        double univavg=Math.round(univ*1.0);
        double att1=iatavg*20*0.01;
        att1=Math.round(att1*100.0)/100.0;
        double att2=assavg*10*0.01;
        att2=Math.round(att2*100.0)/100.0;
        double att3=univavg*70*0.01;
        att3=Math.round(att3*100.0)/100.0;
        double totalatt=(att1+att2+att3);
        totalatt=Math.round(totalatt*100.0)/100.0;
        
        %>
        <tr>
            <td colspan="7" align="right">Average</td>
            <td><%=iatavg%></td>
            <td><%=assavg%></td>
            <td><%=univavg%></td>
        </tr>
        <tr>
            <td colspan="7" align="right">Weightage</td>
            <td>20%</td>
            <td>10%</td>
            <td>70%</td>
        </tr>
        <tr>
            <td colspan="7" align="right">Attainment</td>
            <td><%=att1%></td>
            <td><%=att2%></td>
            <td><%=att3%></td>
        </tr>
        <tr>
            <td colspan="7" align="right"><b>CO Direct Attainment</b></td>
            <td colspan="3"><b><%=totalatt%></b></td>
            <%
           
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/co","root","");
            st= con.createStatement();
            sql="update "+tab+" set direct="+totalatt+" where id="+id;
            st.executeUpdate(sql);
            con.close();

            %>
        </tr>
    </table>
    <a id="a1" href="subject.jsp?id=<%=id%>&subname=<%=subname%>&subcode=<%=subcode%>">Back To Course</a>
    </center>
</body>
</html>
<%@ include file="footer.jsp" %>