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
            margin-bottom: 20px;
        }
        td,th {
            padding:10px;
            width:40px;
        }
        #a1{
            color:black;
            text-decoration: none;
            background-color: lightslategray;
            border:3px solid black;
            padding:5px;
            margin:0px 8px;
        }
        .avg
        {
            text-align: right;
        }

        .c1
        {
            width:100px;
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
    <h2>Alumni Survey</h2>
    <table border="1">
        <thead>
            <tr>
                <th>S.No</th>
                <th>Name</th>
                <th>Email</th>
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
        String sql="select * from alumni";
        ResultSet rs=st.executeQuery(sql);
        int i=1;
        while(rs.next())
        {
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("name")%></td>
                <td><%=rs.getString("email")%></td>
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
            i++;
        }
         
        sql="select avg(po1),avg(po2),avg(po3),avg(po4),avg(po5),avg(po6),avg(po7),avg(po8),avg(po9),avg(po10),avg(po11),avg(po12) from alumni";
        rs=st.executeQuery(sql);
        rs.next();
        sql="update indirectpo set po1="+rs.getFloat(1)+",po2="+rs.getFloat(2)+",po3="+rs.getFloat(3)+",po4="+rs.getFloat(4)+",po5="+rs.getFloat(5)+",po6="+rs.getFloat(6)+",po7="+rs.getFloat(7)+",po8="+rs.getFloat(8)+",po9="+rs.getFloat(9)+",po10="+rs.getFloat(10)+",po11="+rs.getFloat(11)+",po12="+rs.getFloat(12)+" where type='alumni'";
        st.executeUpdate(sql);


        sql="select po1,po2,po3,po4,po5,po6,po7,po8,po9,po10,po11,po12 from indirectpo where type='alumni'";
        rs=st.executeQuery(sql);
        rs.next();
            Float arr[]=new Float[12];
            for(int j=1;j<=12;j++)
            {
                arr[j-1]=(float)(Math.round(rs.getFloat(j)*100.0)/100.0);
            }

            sql="select weightage from po where po='alumni survey'";
            rs=st.executeQuery(sql);
            rs.next();
            int w=rs.getInt(1);
            float w1=(float)(w*0.01);


        %>
        <tr>
            <td colspan="3" class="avg"><b>Average</b></td>
            <% 
                for(int j=1;j<=12;j++)
                {
                    sql="update po set po"+j+"="+Math.round((arr[j-1]*w1)*100.0)/100.0+" where po='alumni survey'";
                    st.executeUpdate(sql);
                    %>
                     <td><b><%=arr[j-1]%></b></td>
                    <%
                }

             %>
        </tr>

    </table>
<hr>
    <h2>Parent Survey</h2>
    <table border="1">
        <thead>
            <tr>
                <th>S.No</th>
                <th class="c1">Parent Name</th>
                <th class="c1">Student Name</th>
                <th>Email</th>
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
        
        
        sql="select * from parent";
        rs=st.executeQuery(sql);
        i=1;
        while(rs.next())
        {
            %>
            <tr>
                <td><%=i%></td>
                <td class="c1"><%=rs.getString("parent")%></td>
                <td class="c1"><%=rs.getString("name")%></td>
                <td><%=rs.getString("email")%></td>
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
            i++;
        }

        sql="select avg(po1),avg(po2),avg(po3),avg(po4),avg(po5),avg(po6),avg(po7),avg(po8),avg(po9),avg(po10),avg(po11),avg(po12) from parent";
        rs=st.executeQuery(sql);
        rs.next();
        sql="update indirectpo set po1="+rs.getFloat(1)+",po2="+rs.getFloat(2)+",po3="+rs.getFloat(3)+",po4="+rs.getFloat(4)+",po5="+rs.getFloat(5)+",po6="+rs.getFloat(6)+",po7="+rs.getFloat(7)+",po8="+rs.getFloat(8)+",po9="+rs.getFloat(9)+",po10="+rs.getFloat(10)+",po11="+rs.getFloat(11)+",po12="+rs.getFloat(12)+" where type='parent'";
        st.executeUpdate(sql);

        sql="select po1,po2,po3,po4,po5,po6,po7,po8,po9,po10,po11,po12 from indirectpo where type='parent'";
        rs=st.executeQuery(sql);
        rs.next();
            for(int j=1;j<=12;j++)
            {
                arr[j-1]=(float)(Math.round(rs.getFloat(j)*100.0)/100.0);
            }

            sql="select weightage from po where po='parent survey'";
            rs=st.executeQuery(sql);
            rs.next();
            w=rs.getInt(1);
            w1=(float)(w*0.01);


        %>
        <tr>
            <td colspan="4" class="avg"><b>Average</b></td>
            <% 
            for(int j=1;j<=12;j++)
            {
                sql="update po set po"+j+"="+Math.round((arr[j-1]*w1)*100.0)/100.0+" where po='parent survey'";
                st.executeUpdate(sql);
                %>
                 <td><b><%=arr[j-1]%></b></td>
                <%
            }

         %>
           
        </tr>
        <%
        con.close();
        %>

    </table>
    <a id="a1" href="po_home.jsp?tab=<%=tab%>">Back To <%=batch%></a>
    </center>
</body>
</html>
<%@ include file="footer.jsp" %>