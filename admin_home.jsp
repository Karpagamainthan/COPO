<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*"%>
<%@ include file="header.jsp" %>
<%
String msg=request.getParameter("msg");
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
        a:active
        {
            color: red;
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
        label,input,button,select {
            margin:10px;
        }
        input[type="text"],input[type="email"],input[type="password"],select 
        {
            padding:5px;
        }
        .c1
        {
            width:60px;
            text-align: center;
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
    </style>
    <script>
        let msg="<%=msg %>";
        if(msg=="1")
        {
            alert("Email ID should be unique.");
        }
    </script>
</head>
<body> 
    <div class="outercontainer">
        <div></div>
    </div>
    <hr>
    
    <h1>Faculty List</h1>
    <div>
        <div id="form">
           
        <form method="POST" action="insertfaculty.jsp">
            <label for="name">Name</label><br>
            <input type="text" id="name" placeholder="Name" name="name" size="30" required><br>
            <label for="department"> Department</label><br>
            <select required="required" name="department" id="department">
                <option value="Agricultural Engg">Agricultural Engg</option>
                <option value="Biomedical Engg">Biomedical Engg</option>
                <option value="Biotechnology">Biotechnology</option>
                <option value="Civil Engg">Civil Engg</option>
                <option value="Computer Science and Engg">Computer Science and Engg</option>
                <option value="Electrical and Electronics Engg">Electrical and Electronics Engg</option>
                <option value="Electronics and Communication Engg">Electronics and Communication Engg</option>
                <option value="Food Technology">Food Technology </option>
                <option value="Information Technology">Information Technology</option>
                <option value="Mechanical Engg">Mechanical Engg </option>
              </select>
              <label for="email"> Email</label><br>
              <input type="text" id="email" placeholder="Email" name="email" size="30" required><br>
            <label for="pwd">Password</label><br>
            <input type="password" id="pwd" placeholder="Password" name="password" size="30" required><br>
            <input type="submit" value="Add Faculty" name="submit">  
            <input type="reset" value="Reset" name="reset">
        </form>
        
        <center><a id="subname1" href="index.jsp">Back</a></td></center>
        <br>
    </div>
        <table border="1">
            <thead>
                <tr>
                    <th class="c1">S.No</th>
                    <th>Name</th>
                    <th>Department</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th class="c1">Delete</th>
                </tr>
            </thead>
            <%
            int i=1;
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/co","root","");
            Statement st= con.createStatement();
            String sql="select * from register ORDER by department";
            ResultSet rs=st.executeQuery(sql);
            while(rs.next())
            {
                String id1=rs.getString("id");
            %>
                <tr>
                    <td class="c1"><%=i%></td>
                    <td><%=rs.getString("name")%></td>
                    <td><%=rs.getString("department")%></td>
                    <td><%=rs.getString("email")%></td>
                    <td><%=rs.getString("password")%></td>
                    <td class="c1"><a href="deletefaculty.jsp?id=<%=id1%>"  onclick="return confirm('Are you sure you want to delete the faculty')">Delete</a></td>
                </tr>
            <%
            i++;
            }
            con.close();
            %>
        </table>
    </div>
</body>
</html>
<%@ include file="footer.jsp" %>