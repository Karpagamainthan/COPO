<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.Math"%>
<%@ include file="header.jsp" %>

<%
    String tab=(String)pageContext.getAttribute("tab",PageContext.SESSION_SCOPE);
    String batch=(String)pageContext.getAttribute("batch",PageContext.SESSION_SCOPE);
    String dept=(String)pageContext.getAttribute("dept",PageContext.SESSION_SCOPE);
    String deptname=(String)pageContext.getAttribute("deptname",PageContext.SESSION_SCOPE);
    String db=(String)pageContext.getAttribute("db",PageContext.SESSION_SCOPE);
%>
<!DOCTYPE html> 
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CO PO</title>
    <style>
         table 
         {
            border-collapse: collapse;
            margin-bottom: 30px;
        }
        td,th 
        {
            text-align: center;
            padding:10px;
            border:1px solid grey;
            width:30px;
        }
        #c1
        {
            width:150px;
        }
        .c2
        {
            width:230px;
        }

        .c3
        {
            color:red;
            width:230px;
        }
        #c4
        {
            text-align: right;
        }
        #a1
        {
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
    <div class="outercontainer">
        <div class="sub">Department : <%= deptname.toUpperCase()  %></div>
        <div class="sub">Batch : <%= batch.toUpperCase()  %></div>
    </div>
    <hr>
    
    <center>
        <h1>PO Direct Attainment</h1>
    <table border="1">
        <thead>
            <tr>
                <th>No</th>
                <th>Sem</th>
                <th id="c1">Course Code</th>
                <th class="c2">Course Name</th>
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
        int i=1;

            java.sql.Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+tab,"root","");
            Statement st1= con1.createStatement();
            String sql1="select * from directpo order by sem";
            ResultSet rs1=st1.executeQuery(sql1);
            while(rs1.next())
            {
        %>
            <tr>
                <td><%=i%></td>
                <td><%=rs1.getString("sem")%></td>
                <td><%=rs1.getString("subcode")%></td>
                <td class="c3"><b><%=rs1.getString("subname")%></b></td>
                <td><%= rs1.getFloat("po1")%></td>
                <td><%= rs1.getFloat("po2")%></td>
                <td><%= rs1.getFloat("po3")%></td>
                <td><%= rs1.getFloat("po4")%></td>
                <td><%= rs1.getFloat("po5")%></td>
                <td><%= rs1.getFloat("po6")%></td>
                <td><%= rs1.getFloat("po7")%></td>
                <td><%= rs1.getFloat("po8")%></td>
                <td><%= rs1.getFloat("po9")%></td>
                <td><%= rs1.getFloat("po10")%></td>
                <td><%= rs1.getFloat("po11")%></td>
                <td><%= rs1.getFloat("po12")%></td>
            </tr>
        <%
        i++;
        }
        %>
        <%
          con1.close();
            con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+tab,"root","");
            st1= con1.createStatement();
            sql1="select avg(po1),avg(po2),avg(po3),avg(po4),avg(po5),avg(po6),avg(po7),avg(po8),avg(po9),avg(po10),avg(po11),avg(po12) from directpo";
            rs1=st1.executeQuery(sql1);
            rs1.next();
            Float arr[]=new Float[12];
            for(int j=1;j<=12;j++)
            {
                arr[j-1]=(float)(Math.round(rs1.getFloat(j)*100.0)/100.0);
            }
        %>
        <tr>
            <td colspan="4" id="c4"><b>Direct Attainment</b></td>
             <% 
                for(int j=1;j<=12;j++)
                {
                    sql1="update po set po"+j+"="+arr[j-1]+" where po='direct'";
                    st1.executeUpdate(sql1);
                    %>
                     <td><b><%=arr[j-1]%></b></td>
                    <%
                }

             %>
        </tr>
    </table>
    <a id="a1" href="po_home.jsp?tab=<%=tab%>">Back To <%=tab%></a>
    </center>
</body>
</html>
<%@ include file="footer.jsp" %>