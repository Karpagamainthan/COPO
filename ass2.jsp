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
        input[type="text"]
        {
            padding:5px;
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
        <div class="sub">Course Code : <%= subcode.toUpperCase()%></div>
        <div class="sub">Course Name : <%=subname.toUpperCase()  %></div>
    </div>
    <hr>
    <h1>Assignment 2</h1>
    <div>
        <div id="form">
        <form method="GET" action="ass2_insert.jsp">
            <label for="regno">Reg Number</label><br>
            <input type="text" id="regno" placeholder="Reg Number" name="regno" size="20" required><br>
            <label for="co3">CO3 Marks</label><br>
            <input type="number" id="co3" placeholder="CO3" name="co3" size="30" min="0" max="20" required><br>
            <label for="co4">CO4 Marks</label><br>
            <input type="number" id="co4" placeholder="CO4" name="co4" size="30" min="0" max="30" required><br>
            <input type="submit" value="Enter" name="submit">   <input type="reset" value="Reset" name="reset">
        </form>
        <center><a href="subject.jsp?id=<%=id%>&subname=<%=subname%>&subcode=<%=subcode%>">Back To Course</a></td></center>
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
                    <th>CO3 (20)</th>
                    <th>CO4 (30)</th>
                    <th>Total (50)</th>
                    <th>Edit</th>
                </tr>
            </thead>
            <%
            int i=1,co3=0,co4=0;
            int cnt3=0,cnt4=0,co3att=0,co4att=0;
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root","");
            Statement st= con.createStatement();
            String sql="select * from ass2 ORDER by regno";
            ResultSet rs=st.executeQuery(sql);
            while(rs.next())
            {
                String id1=rs.getString("id");
                co3=rs.getInt("co3");
                if(co3>=12)
                cnt3++;
                co4=rs.getInt("co4");
                if(co4>=18)
                cnt4++;

            %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("regno")%></td>
                    <td id="stuname"><%=rs.getString("name")%></td>
                    <td><%=co3%></td>
                    <td><%=co4%></td>
                    <td><%=rs.getInt("co3")+rs.getInt("co4")%></td>
                    <td><a href="ass2_update.jsp?id=<%=id1%>">Edit</a></td>
                </tr>
            <%
            i++;
            }
            int n=i-1;
            double att3=(cnt3*1.0/n)*100;
            att3=Math.round(att3*100.0)/100.0;
            double att4=(cnt4*1.0/n)*100;
            att4=Math.round(att4*100.0)/100.0;
            if(att3>=80)
            co3att=3;
            else if(att3>=70)
            co3att=2;
            else if(att3>=60)
            co3att=1;
            else
            co3att=0;
            if(att4>=80)
            co4att=3;
            else if(att4>=70)
            co4att=2;
            else if(att4>=60)
            co4att=1;
            else
            co4att=0;
            %>
            <tr>
            <td colspan="2">No of Students</td>
            <td align="center"><%=n%></td>
            </tr>
            <tr>
                <td colspan="2">Target %</td>
                <td align="center">60</td>
            </tr>
            <tr>
                <td colspan="3">Target Value</td>
                <td>12</td>
                <td>18</td>
            </tr>
            <tr>
                <td colspan="3">No of Students Attained</td>
                <td><%=cnt3%></td>
                <td><%=cnt4%></td>
            </tr>
            <tr>
                <td colspan="3">Attainment %</td>
                <td><%=att3%></td>
                <td><%=att4%></td>
            </tr>
            <tr>
                <td colspan="3"><b>CO Attainment Assignment2<b></td>
                <td><b><%=co3att%></b></td>
                <td><b><%=co4att%></b></td>
            </tr>
        </table>
    </div>
    <%
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root","");
    Statement st1= con1.createStatement();
    String sql1="update final set ass2='"+co3att+"' where co='co3'";
    String sql2="update final set ass2='"+co4att+"' where co='co4'";
    st1.executeUpdate(sql1);
    st1.executeUpdate(sql2);
%>
</body>
</html>
<%@ include file="footer.jsp" %>