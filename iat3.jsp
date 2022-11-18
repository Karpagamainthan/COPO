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
    <h1>Internal Assessment 3</h1>
    <div>
        <div id="form">
        <form method="GET" action="iat3_insert.jsp">
            <label for="regno">Reg Number</label><br>
            <input type="text" id="regno" placeholder="Reg Number" name="regno" size="20" required><br>
            <label for="co5">CO5 Marks</label><br>
            <input type="number" id="co5" placeholder="CO5" name="co5" size="30" min="0" max="30" required><br>
            <label for="co6">CO6 Marks</label><br>
            <input type="number" id="co6" placeholder="CO6" name="co6" size="30" min="0" max="20" required><br>
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
                    <th>CO5 (30)</th>
                    <th>CO6 (20)</th>
                    <th>Total (50)</th>
                    <th>Edit</th>
                </tr>
            </thead>
            <%
            int i=1,co5=0,co6=0;
            int cnt5=0,cnt6=0,co5att=0,co6att=0;
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root","");
            Statement st= con.createStatement();
            String sql="select * from iat3 ORDER by regno";
            ResultSet rs=st.executeQuery(sql);
            while(rs.next())
            {
                String id1=rs.getString("id");
                co5=rs.getInt("co5");
                if(co5>=18)
                cnt5++;
                co6=rs.getInt("co6");
                if(co6>=12)
                cnt6++;

            %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("regno")%></td>
                    <td id="stuname"><%=rs.getString("name")%></td>
                    <td><%=co5%></td>
                    <td><%=co6%></td>
                    <td><%=rs.getInt("co5")+rs.getInt("co6")%></td>
                    <td><a href="iat3_update.jsp?id=<%=id1%>">Edit</a></td>
                </tr>
            <%
            i++;
            }
            int n=i-1;
            double att5=(cnt5*1.0/n)*100;
            att5=Math.round(att5*100.0)/100.0;
            double att6=(cnt6*1.0/n)*100;
            att6=Math.round(att6*100.0)/100.0;
            if(att5>=80)
            co5att=3;
            else if(att5>=70)
            co5att=2;
            else if(att5>=60)
            co5att=1;
            else
            co5att=0;
            if(att6>=80)
            co6att=3;
            else if(att6>=70)
            co6att=2;
            else if(att6>=60)
            co6att=1;
            else
            co6att=0;
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
                <td>18</td>
                <td>12</td>
            </tr>
            <tr>
                <td colspan="3" align="right">No of Students Attained</td>
                <td><%=cnt5%></td>
                <td><%=cnt6%></td>
            </tr>
            <tr>
                <td colspan="3" align="right">Attainment %</td>
                <td><%=att5%></td>
                <td><%=att6%></td>
            </tr>
            <tr>
                <td colspan="3"align="right"><b>CO Attainment IAT3<b></td>
                <td><b><%=co5att%></b></td>
                <td><b><%=co6att%></b></td>
            </tr>
        </table>
    </div>
    <%
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root","");
    Statement st1= con1.createStatement();
    String sql1="update final set iat3='"+co5att+"' where co='co5'";
    String sql2="update final set iat3='"+co6att+"' where co='co6'";
    st1.executeUpdate(sql1);
    st1.executeUpdate(sql2);
%>
</body>
</html>
<%@ include file="footer.jsp" %>