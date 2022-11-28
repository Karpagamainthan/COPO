<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*"%>
<%@ include file="header.jsp" %>
<%
String tab=(String)pageContext.getAttribute("tab",PageContext.SESSION_SCOPE);
String db=(String)pageContext.getAttribute("db",PageContext.SESSION_SCOPE);

String msg=request.getParameter("msg");
    
    String dept=(String)pageContext.getAttribute("dept",PageContext.SESSION_SCOPE);
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
        }
        td,th {
            padding:10px;
            width:100px;
        }
        #stuname {
            width:200px;
        }
        form {
            width:320px;
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
        .outercontainer
        {
            display:flex;
            justify-content:space-evenly;
            background-color:#038047;
            flex-wrap: wrap;
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
        a:active
        {
            color:red;
        }
    </style>
    <script>
        let msg="<%= msg %>";
        if(msg=="1")
        {
            alert("Student Register Number and Email ID must be unique");
        }
    </script>
</head>
<body> 
    <div class="outercontainer">
        <div class="sub">Department : <%= deptname.toUpperCase()  %></div>
        <div class="sub">Batch : <%= batch.toUpperCase()  %></div>
    </div>
    <hr>
    
    <h1>Student Name List</h1>
    <div>
        <div id="form">
            <form method="POST" action="poaddExcelDetails.jsp">
                <label for="location"> Enter the file location</label>
                <input type="text" name="location" id="location" placeholder="C:new folder/filename.xls"/><br>
                <label>*File should contain Regno,Name and Email</label>
                <input type="submit" value="Submit" />
            </form>
        <form method="GET" action="poinsertnamelist.jsp">
            <label for="regno">Reg Number</label><br>
            <input type="text" id="regno" placeholder="Reg Number" name="regno" size="30" required><br>
            <label for="name">Student Name</label><br>
            <input type="text" id="name" placeholder="Student Name" name="name" size="30" required><br>
            <label for="email">Student Email</label><br>
            <input type="text" id="email" placeholder="Student email" name="email" size="30" required><br>
            <input type="submit" value="Add Student" name="submit">  
            <input type="reset" value="Reset" name="reset">
        </form>
        
        <center><a id="subname1" href="po_home.jsp?tab=<%=tab%>">Back To <%=batch%></a></td></center>
        <br>
    </div>
        <table border="1">
            <thead>
                <tr>
                    <th>S.No</th>
                    <th>Reg No</th>
                    <th id="stuname">Student Name</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <%
            int i=1;
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dept,"root","");
            Statement st= con.createStatement();
            String sql="select * from "+batch+" ORDER by regno";
            ResultSet rs=st.executeQuery(sql);
            while(rs.next())
            {
                String id1=rs.getString("id");
            %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("regno")%></td>
                    <td id="stuname"><%=rs.getString("name")%></td>
                    <td><a href="deleteponamelist.jsp?id=<%=id1%>"  onclick="return confirm('Are you sure you want to delete the student')">Delete</a></td>
                </tr>
            <%
            i++;
            }
            con.close();
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