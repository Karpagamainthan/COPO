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
    <title>Document</title>
    <style>
        table {
            border-collapse: collapse;
        }
        td,th {
            padding:10px;
            border:1px solid grey;
            width:80px;
        }
        #stuname{
            width:200px;
        }
        #bench {
            width:160px;
        }
        #benchmark{
            margin-top: 30px;
        }
        form {
            width:250px;
            background-color: gray;
            padding:20px;
            margin-right:100px;
            margin-bottom: 30px;
        }
        #form{
            float:left;
            margin-bottom:60px;
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
        input[type="text"],input[type="number"]
        {
            padding:5px;
        }
    </style>
</head>
<body>
    <center>
        <h1><%="Batch "+tab%></h1> 
        <h1><%=subcode+" - "+subname%></h1><hr></center>
    <h1>Assignment 1</h1>
    <div>
        <div id="form">
        <form method="GET" action="ass1_insert.jsp">
            <label for="regno">Reg Number</label><br>
            <input type="text" id="regno" placeholder="Reg Number" name="regno" size="20" required><br>
            <label for="co1">CO1 Marks</label><br>
            <input type="number" id="co1" placeholder="CO1" name="co1" size="30" min="0" max="20" required><br>
            <label for="co2">CO2 Marks</label><br>
            <input type="number" id="co2" placeholder="CO2" name="co2" size="30" min="0" max="30" required><br>
            <input type="submit" value="Enter" name="submit">   <input type="reset" value="Reset" name="reset">
        </form>
        <center><a href="subject.jsp?id=<%=id%>&subname=<%=subname%>&subcode=<%=subcode%>">Back To Course</a></center>
        <table id="benchmark">
            <tr><th colspan="2">Benchmark</th></tr>
            <tr><td id="bench">Attainment % >=80</td><td>3</td></tr>
            <tr><td id="bench">Attainment % >=70</td><td>2</td></tr>
            <tr><td id="bench">Attainment % >=60</td><td>1</td></tr>

        </table>

    </div>
        <table>
            <thead>
                <tr>
                    <th>S.No</th>
                    <th>Reg No</th>
                    <th id="stuname">Student Name</th>
                    <th>CO1 (20)</th>
                    <th>CO2 (30)</th>
                    <th>Total (50)</th>
                    <th>Edit</th>
                </tr>
            </thead>
            <%
            int i=1,co1=0,co2=0;
            int cnt1=0,cnt2=0,co1att=0,co2att=0;
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root","");
            Statement st= con.createStatement();
            String sql="select * from ass1 ORDER by regno";
            ResultSet rs=st.executeQuery(sql);
            while(rs.next())
            {
                String id1=rs.getString("id");
                co1=rs.getInt("co1");
                if(co1>=12)
                cnt1++;
                co2=rs.getInt("co2");
                if(co2>=18)
                cnt2++;

            %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("regno")%></td>
                    <td id="stuname"><%=rs.getString("name")%></td>
                    <td><%=co1%></td>
                    <td><%=co2%></td>
                    <td><%=rs.getInt("co1")+rs.getInt("co2")%></td>
                    <td><a href="ass1_update.jsp?id=<%=id1%>">Edit</a></td>
                </tr>
            <%
            i++;
            }
            int n=i-1;
            double att1=(cnt1*1.0/n)*100;
            att1=Math.round(att1*100.0)/100.0;
            double att2=(cnt2*1.0/n)*100;
            att2=Math.round(att2*100.0)/100.0;
            if(att1>=80)
            co1att=3;
            else if(att1>=70)
            co1att=2;
            else if(att1>=60)
            co1att=1;
            else
            co1att=0;
            if(att2>=80)
            co2att=3;
            else if(att2>=70)
            co2att=2;
            else if(att2>=60)
            co2att=1;
            else
            co2att=0;
            %>
            <tr>
            <td colspan="2" align="right">No of Students</td>
            <td align="center"><%=n%></td>
            </tr>
            <tr>
                <td colspan="2" align="right">Target %</td>
                <td align="center">60</td>
            </tr>
            <tr>
                <td colspan="3" align="right">Target Value</td>
                <td>12</td>
                <td>18</td>
            </tr>
            <tr>
                <td colspan="3" align="right">No of Students Attained</td>
                <td><%=cnt1%></td>
                <td><%=cnt2%></td>
            </tr>
            <tr>
                <td colspan="3" align="right">Attainment %</td>
                <td><%=att1%></td>
                <td><%=att2%></td>
            </tr>
            <tr>
                <td colspan="3"align="right"><b>CO Attainment Assignment1<b></td>
                <td><b><%=co1att%></b></td>
                <td><b><%=co2att%></b></td>
            </tr>
        </table>
    </div>
    <%
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root","");
    Statement st1= con1.createStatement();
    String sql1="update final set ass1='"+co1att+"' where co='co1'";
    String sql2="update final set ass1='"+co2att+"' where co='co2'";
    st1.executeUpdate(sql1);
    st1.executeUpdate(sql2);
%>
</body>
</html>
<%@ include file="footer.jsp" %>