<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
<%@ include file="header.jsp" %>
<%
String batch=(String)pageContext.getAttribute("batch",PageContext.SESSION_SCOPE);
String dept=(String)pageContext.getAttribute("dept",PageContext.SESSION_SCOPE);
String regno=(String)pageContext.getAttribute("regno",PageContext.SESSION_SCOPE);
String id=request.getParameter("id");

pageContext.setAttribute("id",id,PageContext.SESSION_SCOPE);
String subject=request.getParameter("subject");
String arr[]=subject.split("-");
String subcode=arr[0];
String subname=arr[1];
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
            width:60%;
            background-color: gray;
            padding:20px;
            margin-top: 30px;
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
       
    </style>
    <script>
      var rows = document.getElementById("table")[0].getElementsByTagName("tr");

    // loops through each row
    for (i = 0; i < rows.length; i++) 
    {
        cells = rows[i].getElementsByTagName('td');
            if (cells[9].innerHTML == 'Assigned')
                rows[i].className = "red";           
 }
    </script>
</head>
<body>
    <center>

        <h1><%=subcode+" - "+subname%></h1><hr>
   
        <div id="form">
            
        <form method="POST" action="saveindirect.jsp">
        <table>
        <tr>
        <th>
        <h1>Course Outcomes</h1></th>
        </tr>
        <%
        Class.forName("com.mysql.jdbc.Driver");
        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/co","root","");
        Statement st= con.createStatement();
        String sql="select * from "+dept+""+batch+" where id="+id;
        ResultSet rs=st.executeQuery(sql);
        rs.next();
        String s;
        %>
        <tr id="r"><td>
            <b>CO1 : </b>
            <%
            s=rs.getString("co1");
            %> <textarea placeholder="Course outcome 1" rows="2" readonly><%=s%></textarea> 
            </td><td>
            <input type="radio" name="co1" id="co1a" value="3" required>Highly satisfied<br>
            <input type="radio" name="co1" id="co1b" value="2" required>Satisfied<br>
            <input type="radio" name="co1" id="co1c" value="1" required>Not satisfied
        </td></tr>
        <tr id="r"><td>
            <b>CO2 : </b>
            <%
            s=rs.getString("co2");
            %> <textarea placeholder="Course outcome 2" rows="2" readonly><%=s%></textarea> 
            </td><td>
            <input type="radio" name="co2" id="co2a" value="3" required>Highly satisfied<br>
            <input type="radio" name="co2" id="co2b" value="2" required>Satisfied<br>
            <input type="radio" name="co2" id="co2c" value="1" required>Not satisfied
        </td></tr>
        <tr id="r"><td>
            <b>CO3 : </b>
            <%
            s=rs.getString("co3");
            %> <textarea placeholder="Course outcome 3" rows="2" readonly><%=s%></textarea> 
            </td><td>
            <input type="radio" name="co3" id="co3a" value="3" required>Highly satisfied<br>
            <input type="radio" name="co3" id="co3b" value="2" required>Satisfied<br>
            <input type="radio" name="co3" id="co3c" value="1" required>Not satisfied
        </td></tr>
        <tr id="r"><td>
            <b>CO4 : </b>
            <%
            s=rs.getString("co4");
            %> <textarea placeholder="Course outcome 4" rows="2" readonly><%=s%></textarea> 
            </td><td>
            <input type="radio" name="co4" id="co4a" value="3" required>Highly satisfied<br>
            <input type="radio" name="co4" id="co4b" value="2" required>Satisfied<br>
            <input type="radio" name="co4" id="co4c" value="1" required>Not satisfied
        </td></tr>
        <tr id="r"><td>
            <b>CO5 : </b>
            <%
            s=rs.getString("co5");
            %> <textarea placeholder="Course outcome 5" rows="2" readonly><%=s%></textarea> 
            </td><td>
            <input type="radio" name="co5" id="co5a" value="3" required>Highly satisfied<br>
            <input type="radio" name="co5" id="co5b" value="2" required>Satisfied<br>
            <input type="radio" name="co5" id="co5c" value="1" required>Not satisfied
        </td></tr>
        <tr><td>
            <b>CO6 : </b>
            <%
            s=rs.getString("co6");
            %> <textarea placeholder="Course outcome 6" rows="2" readonly><%=s%></textarea> 
            </td><td>
            <input type="radio" name="co6" id="co6a" value="3" required>Highly satisfied<br>
            <input type="radio" name="co6" id="co6b"  value="2" required>Satisfied<br>
            <input type="radio" name="co6" id="co6c" value="1" required>Not satisfied
        </td></tr>
        <tr><td></td><td><input type="submit" value="Submit" name="submit" ></td></tr>
        </table>
        </form>
       
    </div>
</center>
    
</body>
</html>
<%@ include file="footer.jsp" %>