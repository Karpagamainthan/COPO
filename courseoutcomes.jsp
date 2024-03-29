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

    String batch=(String)pageContext.getAttribute("batch",PageContext.SESSION_SCOPE);
    String deptname=(String)pageContext.getAttribute("deptname",PageContext.SESSION_SCOPE);
    pageContext.setAttribute("id",id,PageContext.SESSION_SCOPE);
    pageContext.setAttribute("subcode",subcode,PageContext.SESSION_SCOPE);
    pageContext.setAttribute("subname",subname,PageContext.SESSION_SCOPE);
    pageContext.setAttribute("db",db,PageContext.SESSION_SCOPE);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>document</title>
    <style>
       
        form {
            width:50%;
            background-color: gray;
            padding:20px;
            margin-top: 30px;
             margin-bottom: 30px;
        }
        #form{
          
            margin-bottom:60px;
        }
        #form a,#indirect,input[type="submit"]{
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
            float: right;
            margin-right: 2%;
        }
        input {
            margin:10px;
            padding:10px;
        }
        input[type="text"]
        {
            width:80%;
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

        span
        {
            margin-left: 10%;
            display: inline-block;
            font-size: 2em;
            font-weight: bold;  
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
        function validate()
        {
                var a=document.getElementById("co1").value;
                var s="saveCO.jsp"
                if(a==null||a=="")
                {
                    alert("Enter Course Outcome 1");
                    return false;
                }
                s=s+"?co1="+a;
                a=document.getElementById("co2").value;
                if(a==null||a=="")
                {
                    alert("Enter Course Outcome 2");
                    return false;
                }
                s=s+"&co2="+a;
                a=document.getElementById("co3").value;
                if(a==null||a=="")
                {
                    alert("Enter Course Outcome 3");
                    return false;
                }
                s=s+"&co3="+a;
                a=document.getElementById("co4").value;
                if(a==null||a=="")
                {
                    alert("Enter Course Outcome 4");
                    return false;
                }
                s=s+"&co4="+a;
                a=document.getElementById("co5").value;
                if(a==null||a=="")
                {
                    alert("Enter Course Outcome 5");
                    return false;
                }
                s=s+"&co5="+a;
                a=document.getElementById("co6").value;
                if(a==null||a=="")
                {
                    alert("Enter Course Outcome 6");
                    return false;
                }
                s=s+"&co6="+a+"&indirect=1";
                document.getElementById("indirect").href=s;
                return confirm(`All the previous indirect attainments will be deleted.Are you sure?`);
               
            
        }
    </script>
</head>
<body>
    <div class="outercontainer">
            <div class="sub">Department : <%= deptname.toUpperCase()  %></div>
            <div class="sub">Batch : <%= batch.toUpperCase()  %></div>
            <div class="sub">Course Code : <%= subcode.toUpperCase()%></div>
            <div class="sub">Course Name : <%=subname.toUpperCase()  %></div>
        </div>
        <hr>
    <center>
        <a id="indirect" href="saveCO.jsp" onclick="return validate()">New Indirect Survey</a></p>
   
        <div id="form">
        <form method="GET" action="saveCO.jsp" onsubmit="return myfunction()">
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
        %> <textarea placeholder="Course outcome 1" name="co1" rows="2" id="co1" ><%=s%></textarea> 
        <br>
        CO2 : 
        <%
        s=rs.getString("co2");
        %> <textarea placeholder="Course outcome 2" name="co2" rows="2" id="co2"><%=s%></textarea>
        <br>
        CO3 : 
        <%
        s=rs.getString("co3");
         %> <textarea placeholder="Course outcome 3" name="co3" rows="2" id="co3"><%=s%></textarea>
        <br>
        CO4 : 
        <%
        s=rs.getString("co4");
        %> <textarea placeholder="Course outcome 4" name="co4" rows="2" id="co4"><%=s%></textarea>
        <br>
        CO5 : 
        <%
        s=rs.getString("co5");
        %> <textarea placeholder="Course outcome 5" name="co5" rows="2" id="co5"><%=s%></textarea>
        <br>
        CO6 : 
        <%
        s=rs.getString("co6");
        con.close();
        %> <textarea placeholder="Course outcome 6" name="co6" rows="2" id="co6" ><%=s%></textarea>
        <br>
        <input type="submit" value="Save CO" name="submit" >   
        </form>
        <center><a href="subject.jsp?id=<%=id%>&subname=<%=subname%>&subcode=<%=subcode%>">Back To Course</a></center>
    </div>
</center>
    
</body>
</html>
<%@ include file="footer.jsp" %>