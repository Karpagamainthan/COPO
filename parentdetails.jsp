<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CO PO</title>
    <style>
        
        form {
           
            background-color: gray;
            padding:20px;
            
        }
        #form
        {
            width:430px;
            margin: auto;
        }
        #form a{
            color:black;
            text-decoration: none;
            background-color: lightslategray;
            border:3px solid black;
            padding:5px;
        }
        label,input,select {
            margin:10px;
            padding:5px;
        }
        input[type="text"],input[type="email"]
        {
           width:200px;
        }
        input[type="submit"]
        {
            text-align: right;
        }
        select{
            width:210px;
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
    <%
     String arr[]={"IT","EC","EE","ME"};

    %>
        <div class="outercontainer">
            <div class="sub">PARENT SURVEY</div>
        </div>
        <hr>
        <div id="form">
        <form action="parent.jsp" method="post">
            <table>
            <tr><td>
            <label for="name">Parent Name </label></td><td>
            <input type="text" name="parent" id="name" placeholder="Enter Name" required><br></td></tr>
            <tr><td>
            <label for="name">Student Name</label></td><td>
            <input type="text" name="name" id="name" placeholder="Enter Name" required><br></td></tr>
            <tr><td>
            <label for="email">Email Address</label></td><td>
            <input type="email" name="email" id="email" placeholder="Enter Email" required><br></td></tr>
            <tr><td>
            <label for="deptbatch">Dept & Batch</label></td><td>
            <select name="deptbatch" id="deptbatch">
                <%
                    for(int i=0;i<arr.length;i++)
                    {
                        String dept=arr[i];
                        Class.forName("com.mysql.jdbc.Driver");
                        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/co","root","");
                        Statement st= con.createStatement();
                        String sql="select * from "+dept+"batches";
                        ResultSet rs=st.executeQuery(sql);
                        while(rs.next())
                        {
                            String t=dept.toUpperCase()+" - "+rs.getString("batch");
                            %>
                            <option value="<%=t%>"><%=t%></option>
                            <%
                        }
                    }
                %>
            </select><br></td></tr>
            <tr><td></td><td>
            <center><input type="submit" name="submit" value="Submit"></center>
        </td></tr>
        </table>
        </form>
    </div>
</body>
</html>
<%@ include file="footer.jsp" %>