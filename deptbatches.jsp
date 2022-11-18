<%@ page import="java.sql.*"%>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.util.*" %>
<%@ include file="header.jsp" %>
<%
if(request.getParameter("submit")!=null)
{
    String dept=request.getParameter("dept");
    String batch=request.getParameter("batch");
    String tab=dept+batch;
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/co","root","");
    Statement st= con.createStatement();
    String sql="insert into "+dept+"batches(dept,batch) values('"+dept+"','"+batch+"')";
    st.executeUpdate(sql);

    java.sql.Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dept,"root","");
    Statement st1= con1.createStatement();
    String sql1="create table "+batch+" (`id` int(11) not null auto_increment primary key,`regno` varchar(30) not null,`name` varchar(30) default null,`email` varchar(100) not null) ";
    String sql2="alter table "+batch+" add unique key `emailidindex` (`email`),add unique key `regno` (`regno`)";
    st1.executeUpdate(sql1);
    st1.executeUpdate(sql2);

    String pass="createbatchtable.jsp?tab="+tab;
    response.sendRedirect(pass);
}
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
          width:400px;
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
        }
        label,input {
            margin:10px;
        }
        input[type="text"]
        {
            padding:5px;
        }
        </style>
</head>
<body>
    <%
    String dept=request.getParameter("dept");
    if(dept!=null)
    pageContext.setAttribute("dept",dept,PageContext.SESSION_SCOPE); 

    dept=(String)pageContext.getAttribute("dept",PageContext.SESSION_SCOPE);
    %>
    <div>
        <h1>Create New Batch</h1>
        <div id="form">
        <form action="#" method="post">
            <label for="dept">Department</label><br>
            <input type="text" name="dept" id="dept" value="<%=dept%>" ><br>
            <label for="batch">Enter Batch</label><br>
            <input type="text" name="batch" id="batch" placeholder="2000_2004" pattern="[0-9]{4}_[0-9]{4}"  required><br>
            <input type="submit" name="submit" value="Create">
        </form>
        <center><a href="dept_list.jsp">Back To Departments</a></center>
        </div>
        <table border="1">
            <thead>
                <tr>
                    <th>Batches</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <%
             
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/co","root","");
            Statement st= con.createStatement();
            String sql="select * from "+dept+"batches ORDER by batch";
            ResultSet rs=st.executeQuery(sql);
            while(rs.next())
            {
                String id=rs.getString("id");
                String batch1=rs.getString("batch");
                String dept1=rs.getString("dept");
                String tab1=dept1+batch1;
            %>
                <tr>
                    <td><a href="batch.jsp?tab=<%=tab1%>"><%=batch1%></a></td>
                    <td><a href="deletebatch.jsp?id=<%=id%>&batch=<%=batch1%>" onclick="return confirm('Are you sure you want to delete the batch')">Delete</a></td>
                </tr>
            <%
            }
            %>

        </table>
    </div>
</body>
</html>
<%@ include file="footer.jsp" %>