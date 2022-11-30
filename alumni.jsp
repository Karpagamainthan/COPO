<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
<%@ include file="header.jsp" %>
<%
    String name=request.getParameter("name");
    String email=request.getParameter("email");
    String deptbatch=request.getParameter("deptbatch");
    String dept=deptbatch.substring(0,2);
    String batch=deptbatch.substring(5);

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-pompatible" pontent="IE=edge">
    <meta name="viewport" pontent="width=device-width, initial-scale=1.0">
    <title>po PO</title>
    <style>
       
        table {
            width:60%;
            background-color: gray;
            padding:20px;
            margin-bottom: 30px;
        }
        #r td
        {
            border-bottom: 1px double white;
            margin-bottom: 5px;
        }
        
        input {
            margin:10px;
            padding:10px;
        }
        input[type="radio"]
        {
            height: 15px;
            width: 15px;
            accent-color:rgb(0, 0, 0);
        }
        textarea
        {
            display: inline;
            font-family: 'Times New Roman', Times, serif;
            font-size: medium;
            resize: none;
           margin:10px;
            padding:10px;
            width:80%;
            vertical-align: middle;
        }
        input[type="submit"]
        {
            margin-left: 40%;
            margin-top: 10%;
            font-weight:bold;
            
            
        }

        .red
        {
            color:red;
        }
        .outerpontainer
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
    <center>

        <div class="outerpontainer">
        <div class="sub">NAME : <%= name  %></div>
        <div class="sub">EMAIL : <%= email  %></div>
        <div class="sub">DEPT : <%= dept  %></div>
        <div class="sub">BATCH : <%= batch  %></div>
    </div>
    <hr>
   
        <div id="form">
            
        <form method="POST" action="savealumni.jsp">
         <input type="hidden" value="<%=name%>" readonly name="name"><br>
         <input type="hidden" value="<%=email%>" readonly name="email"><br>
         <input type="hidden" value="<%=dept%>" readonly name="dept"><br>
          <input type="hidden" value="<%=batch%>" readonly name="batch"><br>
        <table>
        <%
        Class.forName("com.mysql.jdbc.Driver");
        java.sql.Connection pon = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dept+""+batch,"root","");
        Statement st= pon.createStatement();
        String sql="select * from survey where type='alumni'";
        ResultSet rs=st.executeQuery(sql);
        rs.next();
        String s;
        %>
        <tr id="r"><td>
            <b>PO1 : </b>
            <%
            s=rs.getString("po1");
            %> <textarea placeholder="pourse outpome 1" rows="2" readonly><%=s%></textarea> 
            </td><td>
            <input type="radio" name="po1" id="po1a" value="3" required>Highly satisfied<br>
            <input type="radio" name="po1" id="po1b" value="2" required>Satisfied<br>
            <input type="radio" name="po1" id="po1c" value="1" required>Not satisfied
        </td></tr>
        <tr id="r"><td>
            <b>PO2 : </b>
            <%
            s=rs.getString("po2");
            %> <textarea placeholder="pourse outpome 2" rows="2" readonly><%=s%></textarea> 
            </td><td>
            <input type="radio" name="po2" id="po2a" value="3" required>Highly satisfied<br>
            <input type="radio" name="po2" id="po2b" value="2" required>Satisfied<br>
            <input type="radio" name="po2" id="po2c" value="1" required>Not satisfied
        </td></tr>
        <tr id="r"><td>
            <b>PO3 : </b>
            <%
            s=rs.getString("po3");
            %> <textarea placeholder="pourse outpome 3" rows="2" readonly><%=s%></textarea> 
            </td><td>
            <input type="radio" name="po3" id="po3a" value="3" required>Highly satisfied<br>
            <input type="radio" name="po3" id="po3b" value="2" required>Satisfied<br>
            <input type="radio" name="po3" id="po3c" value="1" required>Not satisfied
        </td></tr>
        <tr id="r"><td>
            <b>PO4 : </b>
            <%
            s=rs.getString("po4");
            %> <textarea placeholder="pourse outpome 4" rows="2" readonly><%=s%></textarea> 
            </td><td>
            <input type="radio" name="po4" id="po4a" value="3" required>Highly satisfied<br>
            <input type="radio" name="po4" id="po4b" value="2" required>Satisfied<br>
            <input type="radio" name="po4" id="po4c" value="1" required>Not satisfied
        </td></tr>
        <tr id="r"><td>
            <b>PO5 : </b>
            <%
            s=rs.getString("po5");
            %> <textarea placeholder="pourse outpome 5" rows="2" readonly><%=s%></textarea> 
            </td><td>
            <input type="radio" name="po5" id="po5a" value="3" required>Highly satisfied<br>
            <input type="radio" name="po5" id="po5b" value="2" required>Satisfied<br>
            <input type="radio" name="po5" id="po5c" value="1" required>Not satisfied
        </td></tr>
        <tr id="r"><td>
            <b>po6 : </b>
            <%
            s=rs.getString("po6");
            %> <textarea placeholder="pourse outpome 6" rows="2" readonly><%=s%></textarea> 
            </td><td>
            <input type="radio" name="po6" id="po6a" value="3" required>Highly satisfied<br>
            <input type="radio" name="po6" id="po6b"  value="2" required>Satisfied<br>
            <input type="radio" name="po6" id="po6c" value="1" required>Not satisfied
        </td></tr>
        <tr id="r"><td>
            <b>PO7 : </b>
            <%
            s=rs.getString("po7");
            %> <textarea placeholder="pourse outpome 1" rows="2" readonly><%=s%></textarea> 
            </td><td>
            <input type="radio" name="po7" id="po7a" value="3" required>Highly satisfied<br>
            <input type="radio" name="po7" id="po7b" value="2" required>Satisfied<br>
            <input type="radio" name="po7" id="po7c" value="1" required>Not satisfied
        </td></tr>
        <tr id="r"><td>
            <b>PO8 : </b>
            <%
            s=rs.getString("po8");
            %> <textarea placeholder="pourse outpome 1" rows="2" readonly><%=s%></textarea> 
            </td><td>
            <input type="radio" name="po8" id="po7a" value="3" required>Highly satisfied<br>
            <input type="radio" name="po8" id="po7b" value="2" required>Satisfied<br>
            <input type="radio" name="po8" id="po7c" value="1" required>Not satisfied
        </td></tr>
        <tr id="r"><td>
            <b>PO9 : </b>
            <%
            s=rs.getString("po9");
            %> <textarea placeholder="pourse outpome 1" rows="2" readonly><%=s%></textarea> 
            </td><td>
            <input type="radio" name="po9" id="po7a" value="3" required>Highly satisfied<br>
            <input type="radio" name="po9" id="po7b" value="2" required>Satisfied<br>
            <input type="radio" name="po9" id="po7c" value="1" required>Not satisfied
        </td></tr>
        <tr id="r"><td>
            <b>PO10 : </b>
            <%
            s=rs.getString("po10");
            %> <textarea placeholder="pourse outpome 1" rows="2" readonly><%=s%></textarea> 
            </td><td>
            <input type="radio" name="po10" id="po7a" value="3" required>Highly satisfied<br>
            <input type="radio" name="po10" id="po7b" value="2" required>Satisfied<br>
            <input type="radio" name="po10" id="po7c" value="1" required>Not satisfied
        </td></tr>
        <tr id="r"><td>
            <b>PO11 : </b>
            <%
            s=rs.getString("po11");
            %> <textarea placeholder="pourse outpome 1" rows="2" readonly><%=s%></textarea> 
            </td><td>
            <input type="radio" name="po11" id="po7a" value="3" required>Highly satisfied<br>
            <input type="radio" name="po11" id="po7b" value="2" required>Satisfied<br>
            <input type="radio" name="po11" id="po7c" value="1" required>Not satisfied
        </td></tr>
        <tr id="r"><td>
            <b>PO12 : </b>
            <%
            s=rs.getString("po12");
            %> <textarea placeholder="pourse outpome 1" rows="2" readonly><%=s%></textarea> 
            </td><td>
            <input type="radio" name="po12" id="po7a" value="3" required>Highly satisfied<br>
            <input type="radio" name="po12" id="po7b" value="2" required>Satisfied<br>
            <input type="radio" name="po12" id="po7c" value="1" required>Not satisfied
        </td></tr>
        <tr><td></td><td><input type="submit" value="Submit" name="submit" ></td></tr>
        </table>
        </form>
       
    </div>
</center>
    
</body>
</html>
<%@ include file="footer.jsp" %>