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
       
        #coform {
            width:50%;
            background-color: gray;
            padding:20px;
            margin-top: 30px;
             margin-bottom: 30px;
        }
        #form{
          
            margin-bottom:60px;
        }
        #form a,#indirect input{
            color:black;
            text-decoration: none;
            background-color: lightslategray;
            border:3px solid black;
            padding:5px;
            margin:0px 8px;
        }
        #indirect
        {
            display:inline-block;
            float:right;
            margin-top:5px;
            margin-right: 3px;
        }
        #indirect input
        {
           
            float: right;
            margin-right: 2%;
        }
        #coform input {
            margin:10px;
            padding:10px;
        }
        #coform input[type="text"]
        {
            width:80%;
        }
        #coform textarea
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
        span
        {
            margin-left: 10%;
            display: inline-block;
            font-size: 2em;
            font-weight: bold;  
        }
       
    </style>
    <script>
        function myfunction()
        {
            alert("hi");
        }
        function validate()
        {
            
        }
    </script>
</head>
<body>
    <center>

        <span><%=subcode+" - "+subname%></span><form id="indirect" action="enableIndirect.jsp" onsubmit="return validate()"><input type="submit" value="Re-enable Indirect Survey"/></form><hr>
   
        <div id="form">
        <form id="coform" method="GET" action="saveCO.jsp" onsubmit="return myfunction()">
        <h1>Course Outcomes</h1>
        <%
        Class.forName("com.mysql.jdbc.Driver");
        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/co","root","");
        Statement st= con.createStatement();
        String sql="select * from "+tab+" where id="+id;
        ResultSet rs=st.executeQuery(sql);
        rs.next();
        String s;
        %>
        CO1 : 
        <%
        s=rs.getString("co1");
        if(s!=null) { %> <textarea placeholder="Course outcome 1" name="co1" rows="2" ><%=s%></textarea><% }
        else { %><textarea placeholder="Course outcome 1" name="co1" rows="2" ></textarea><% } %>
        <br>
        CO2 : 
        <%
        s=rs.getString("co2");
        if(s!=null) { %> <textarea placeholder="Course outcome 2" name="co2" rows="2" ><%=s%></textarea><% }
        else { %><textarea placeholder="Course outcome 2" name="co2" rows="2" ></textarea><% } %>
        <br>
        CO3 : 
        <%
        s=rs.getString("co3");
        if(s!=null) { %> <textarea placeholder="Course outcome 3" name="co3" rows="2" ><%=s%></textarea><% }
        else { %><textarea placeholder="Course outcome 3" name="co3" rows="2" ></textarea><% } %>
        <br>
        CO4 : 
        <%
        s=rs.getString("co4");
        if(s!=null) { %> <textarea placeholder="Course outcome 4" name="co4" rows="2" ><%=s%></textarea><% }
        else { %><textarea placeholder="Course outcome 4" name="co4" rows="2" ></textarea><% } %>
        <br>
        CO5 : 
        <%
        s=rs.getString("co5");
        if(s!=null) { %> <textarea placeholder="Course outcome 5" name="co5" rows="2" ><%=s%></textarea><% }
        else { %><textarea placeholder="Course outcome 5" name="co5" rows="2" ></textarea><% } %>
        <br>
        CO6 : 
        <%
        s=rs.getString("co6");
        if(s!=null) { %> <textarea placeholder="Course outcome 6" name="co6" rows="2" ><%=s%></textarea><% }
        else { %><textarea placeholder="Course outcome 6" name="co6" rows="2" ></textarea><% } %>
        <br>
        <input type="submit" value="Save CO" name="submit" onsubmit="return myfunction()">   <input type="reset" value="Reset" name="reset">
        </form>
        <center><a href="subject.jsp?id=<%=id%>&subname=<%=subname%>&subcode=<%=subcode%>">Back To Course</a></center>
    </div>
</center>
    
</body>
</html>
<%@ include file="footer.jsp" %>