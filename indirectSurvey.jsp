<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
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
       
    </style>
    <script>
        function validate()
        {
                var a=CO PO.getElementById("co1").value;
                var s="saveCO.jsp"
                if(a==null||a=="")
                {
                    alert("Enter Course Outcome 1");
                    return false;
                }
                s=s+"?co1="+a;
                a=CO PO.getElementById("co2").value;
                if(a==null||a=="")
                {
                    alert("Enter Course Outcome 2");
                    return false;
                }
                s=s+"&co2="+a;
                a=CO PO.getElementById("co3").value;
                if(a==null||a=="")
                {
                    alert("Enter Course Outcome 3");
                    return false;
                }
                s=s+"&co3="+a;
                a=CO PO.getElementById("co4").value;
                if(a==null||a=="")
                {
                    alert("Enter Course Outcome 4");
                    return false;
                }
                s=s+"&co4="+a;
                a=CO PO.getElementById("co5").value;
                if(a==null||a=="")
                {
                    alert("Enter Course Outcome 5");
                    return false;
                }
                s=s+"&co5="+a;
                a=CO PO.getElementById("co6").value;
                if(a==null||a=="")
                {
                    alert("Enter Course Outcome 6");
                    return false;
                }
                s=s+"&co6="+a+"&indirect=1";
                CO PO.getElementById("indirect").href=s;
                confirm(`All the previous indirect attainments will be deleted.Are you sure?`);
               
            
        }
    </script>
</head>
<body>
    <center>

        <h1><%=subcode+" - "+subname%></h1><hr>
   
        <div id="form">
            
        <form method="POST" action="" onsubmit="return myfunction()">
        <table>
        <tr>
        <th>
        <h1>Course Outcomes</h1></th>
        </tr>
        <%
        Class.forName("com.mysql.jdbc.Driver");
        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/co","root","");
        Statement st= con.createStatement();
        String sql="select * from "+tab+" where id="+id;
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