<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*"%>
<%@ include file="header.jsp" %>
<%
String tab=request.getParameter("tab");
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
          width:600px;
        }
        td,th {
            padding:10px;
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
        
        #subname1 {
            text-decoration: none;
            color:red;
        }
    </style>
</head>
<body>
    <center><h1><%="Batch "+tab%></h1></center>
    <h1>Create New Subject</h1>
    <div>
        <div id="form">
        <form method="GET" action="insertsubject.jsp">
            <label for="sem">Semester</label><br>
            <input type="number" id="sem" placeholder="Sem" name="sem" size="30" min="1" max="8" required><br>
            <label for="subcode">Subject Code</label><br>
            <input type="text" id="subcode" placeholder="Subject Code" name="subcode" size="30" required><br>
            <label for="subname">Subject Title</label><br>
            <input type="text" id="subname" placeholder="Subject Title" name="subname" size="30" required><br>

            <label for="co1">CO1</label><br>
            <input type="text" id="co1" name="co1" size="30" required> 
            <label for="co2">CO2</label><br>
            <input type="text" id="co2" name="co2" size="30" required> 
            <label for="co3">CO3</label><br>
            <input type="text" id="co3" name="co3" size="30" required> 
            <label for="co4">CO4</label><br>
            <input type="text" id="co4" name="co4" size="30" required> 
            <label for="co5">CO5</label><br>
            <input type="text" id="co5" name="co5" size="30" required> 
            <label for="co6">CO6</label><br>
            <input type="text" id="co6" name="co6" size="30" required> 

            <input type="submit" value="Create Subject" name="submit">   <input type="reset" value="Reset" name="reset">
        </form>
        <center><a href="itbatches.jsp">Back To Batches</a></center>
    </div>
        <table border="1">
            <thead>
                <tr>
                    <th>Semester</th>
                    <th>Subject Code</th>
                    <th>Subject Title</th>
                    <th>CO1</th>
                    <th>CO2</th>
                    <th>CO3</th>
                    <th>CO4</th>
                    <th>CO5</th>
                    <th>CO6</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <%
            pageContext.setAttribute("tab",tab,PageContext.SESSION_SCOPE);  
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/co","root","");
            Statement st= con.createStatement();
            String sql="select * from "+tab+" ORDER by sem";
            ResultSet rs=st.executeQuery(sql);
            while(rs.next())
            {
                String id=rs.getString("id");
            %>
                <tr>
                    <td><%=rs.getString("sem")%></td>
                    <td><%=rs.getString("subcode")%></td>
                    <td><a id="subname1" href="subject.jsp?id=<%=rs.getString("id")%>&subname=<%=rs.getString("subname")%>&subcode=<%=rs.getString("subcode")%>"><%=rs.getString("subname")%></a></td>
                    <td><%=rs.getString("co1")%></td>
                    <td><%=rs.getString("co2")%></td>
                    <td><%=rs.getString("co3")%></td>
                    <td><%=rs.getString("co4")%></td>
                    <td><%=rs.getString("co5")%></td>
                    <td><%=rs.getString("co6")%></td>
                    <td><a href="updatesubject.jsp?id=<%=id%>">Edit</a></td>
                    <td><a href="deletesubject.jsp?id=<%=id%>">Delete</a></td>
                </tr>
            <%
            }
            %>
        </table>
    </div>
</body>
</html>
<%@ include file="footer.jsp" %>