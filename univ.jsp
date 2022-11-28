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
        input[type="text"],input[type="number"]
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
    <h1>University Examination</h1>
    <div>
        <div id="form">
        <form method="GET" action="univ_insert.jsp">
            <label for="regno">Reg Number</label><br>
            <input type="text" id="regno" placeholder="Reg Number" name="regno" size="20" required><br>
            <label for="total">Total Marks</label><br>
            <input type="number" id="total" placeholder="Total" name="total" size="30" min="0" max="100" required><br>
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
                    <th>Total (100)</th>
                    <th>Edit</th>
                </tr>
            </thead>
            <%
            int i=1,total=0,cnt=0,coatt=0;
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root","");
            Statement st= con.createStatement();
            String sql="select * from univ ORDER by regno";
            ResultSet rs=st.executeQuery(sql);
            while(rs.next())
            {
                String id1=rs.getString("id");
                total=rs.getInt("total");
                if(total>=60)
                cnt++;

            %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("regno")%></td>
                    <td id="stuname"><%=rs.getString("name")%></td>
                    <td><%=total%></td>
                    <td><a href="univ_update.jsp?id=<%=id1%>">Edit</a></td>
                </tr>
            <%
            i++;
            }
            int n=i-1;
            double att=(cnt*1.0/n)*100;
            att=Math.round(att*100.0)/100.0;
            if(att>=80)
            coatt=3;
            else if(att>=70)
            coatt=2;
            else if(att>=60)
            coatt=1;
            else
            coatt=0;
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
                <td>60</td>
            </tr>
            <tr>
                <td colspan="3" align="right">No of Students Attained</td>
                <td><%=cnt%></td>
            </tr>
            <tr>
                <td colspan="3" align="right">Attainment %</td>
                <td><%=att%></td>
            </tr>
            <tr>
                <td colspan="3"align="right"><b>CO Attainment University Exam<b></td>
                <td><b><%=coatt%></b></td>
            </tr>
        </table>
    </div>
    <%
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root","");
    Statement st1= con1.createStatement();
    String sql1="update final set univ='"+coatt+"' where co='co1'";
    String sql2="update final set univ='"+coatt+"' where co='co2'";
    String sql3="update final set univ='"+coatt+"' where co='co3'";
    String sql4="update final set univ='"+coatt+"' where co='co4'";
    String sql5="update final set univ='"+coatt+"' where co='co5'";
    String sql6="update final set univ='"+coatt+"' where co='co6'";
    st1.executeUpdate(sql1);
    st1.executeUpdate(sql2);
    st1.executeUpdate(sql3);
    st1.executeUpdate(sql4);
    st1.executeUpdate(sql5);
    st1.executeUpdate(sql6);
%>
</body>
</html>
<%@ include file="footer.jsp" %>