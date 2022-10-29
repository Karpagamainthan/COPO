<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*"%>
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
            border:1px solid grey;
          border-collapse: collapse;
        }
        td,th {
            padding:10px;
            width:100px;
        }
        #stuname {
            width:200px;
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
        }
        #form a{
            color:black;
            text-decoration: none;
            background-color: lightslategray;
            border:3px solid black;
            padding:5px;
            margin:0px 8px;
        }
        label,input,button {
            margin:10px;
        }
        input[type="text"]
        {
            padding:5px;
        }
    </style>
</head>
<body> 
    <center>
        <h1><%="Batch "+tab%></h1> 
        <h1><%=subcode+" - "+subname%></h1><hr></center>
    <h1>Student Name List</h1>
    <div>
        <div id="form">
        <form method="GET" action="insertnamelist.jsp">
            <label for="regno">Reg Number</label><br>
            <input type="text" id="regno" placeholder="Reg Number" name="regno" size="30" required><br>
            <label for="name">Student Name</label><br>
            <input type="text" id="name" placeholder="Student Name" name="name" size="30" required><br>
            <label for="email">Student Email</label><br>
            <input type="text" id="email" placeholder="Student email" name="email" size="30" required><br>
            <input type="submit" value="Add Student" name="submit">  
            <br><a href="sample.jsp">Add Student from excel file</a>
            <input type="reset" value="Reset" name="reset">
        </form>
        <center><a id="subname1" href="subject.jsp?id=<%=id%>&subname=<%=subname%>&subcode=<%=subcode%>">Back To Course</a></td></center>
        <br>
    </div>
        <table border="1">
            <thead>
                <tr>
                    <th>S.No</th>
                    <th>Reg No</th>
                    <th id="stuname">Student Name</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <%
            int i=1;
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root","");
            Statement st= con.createStatement();
            String sql="select * from namelist ORDER by regno";
            ResultSet rs=st.executeQuery(sql);
            while(rs.next())
            {
                String id1=rs.getString("id");
            %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("regno")%></td>
                    <td id="stuname"><%=rs.getString("name")%></td>
                    <td><a href="updatenamelist.jsp?id=<%=id1%>">Edit</a></td>
                    <td><a href="deletenamelist.jsp?id=<%=id1%>">Delete</a></td>
                </tr>
            <%
            i++;
            }
            %>
            <tr>
                <td colspan="3" align="right"><b>Total No of Students</b></td>
                <td colspan="2"><b><%=i-1%></b></td>
            </tr>
        </table>
    </div>
</body>
</html>
<%@ include file="footer.jsp" %>