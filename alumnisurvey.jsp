<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
<%@ include file="header.jsp" %>
<%
String tab=(String)pageContext.getAttribute("tab",PageContext.SESSION_SCOPE);
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
                var a=document.getElementById("po1").value;
                var s="savePO.jsp"
                if(a==null||a=="")
                {
                    alert("Enter Program Outcome 1");
                    return false;
                }
                s=s+"?po1="+a;
                a=document.getElementById("po2").value;
                if(a==null||a=="")
                {
                    alert("Enter Program Outcome 2");
                    return false;
                }
                s=s+"&po2="+a;
                a=document.getElementById("po3").value;
                if(a==null||a=="")
                {
                    alert("Enter Program Outcome 3");
                    return false;
                }
                s=s+"&po3="+a;
                a=document.getElementById("po4").value;
                if(a==null||a=="")
                {
                    alert("Enter Program Outcome 4");
                    return false;
                }
                s=s+"&po4="+a;
                a=document.getElementById("po5").value;
                if(a==null||a=="")
                {
                    alert("Enter Program Outcome 5");
                    return false;
                }
                s=s+"&po5="+a;
                a=document.getElementById("po6").value;
                if(a==null||a=="")
                {
                    alert("Enter Program Outcome 6");
                    return false;
                }
                s=s+"&po6="+a+"&type=alumni";
                a=document.getElementById("po7").value;
                if(a==null||a=="")
                {
                    alert("Enter Program Outcome 7");
                    return false;
                }
                s=s+"&po7="+a+"&type=alumni";
                a=document.getElementById("po8").value;
                if(a==null||a=="")
                {
                    alert("Enter Program Outcome 8");
                    return false;
                }
                s=s+"&po8="+a+"&type=alumni";
                a=document.getElementById("po9").value;
                if(a==null||a=="")
                {
                    alert("Enter Program Outcome 9");
                    return false;
                }
                s=s+"&po9="+a+"&type=alumni";
                a=document.getElementById("po10").value;
                if(a==null||a=="")
                {
                    alert("Enter Program Outcome 10");
                    return false;
                }
                s=s+"&po10="+a+"&type=alumni";
                a=document.getElementById("po11").value;
                if(a==null||a=="")
                {
                    alert("Enter Program Outcome 11");
                    return false;
                }
                s=s+"&po11="+a+"&type=alumni";
                a=document.getElementById("po12").value;
                if(a==null||a=="")
                {
                    alert("Enter Program Outcome 12");
                    return false;
                }
                s=s+"&po12="+a+"&type=alumni";
                return confirm(`All the previous alumni submissions will be deleted.Are you sure?`);
               
            
        }
    </script>
</head>
<body>
    <div class="outercontainer">
            <div class="sub">Department : <%= deptname.toUpperCase()  %></div>
            <div class="sub">Batch : <%= batch.toUpperCase()  %></div>
            
        </div>
        <hr>
    <center>
        
   
        <div id="form">
        <form method="GET" onsubmit="return validate()" action="savePO.jsp" >
        <h1>Alumni Course End Survey</h1>
        <%
        Class.forName("com.mysql.jdbc.Driver");
        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dept+""+batch,"root","");
        Statement st= con.createStatement();
        String sql="select * from survey where type='alumni'";
        ResultSet rs=st.executeQuery(sql);
        rs.next();
        String s;
        %>
        PO1 : 
        <%
        s=rs.getString("po1");
        %> <textarea placeholder="Program outcome 1" name="po1" rows="2" id="po1" ><%=s%></textarea> 
        <br>
        PO2 : 
        <%
        s=rs.getString("po2");
        %> <textarea placeholder="Program outcome 2" name="po2" rows="2" id="po2"><%=s%></textarea>
        <br>
        PO3 : 
        <%
        s=rs.getString("po3");
         %> <textarea placeholder="Program outcome 3" name="po3" rows="2" id="po3"><%=s%></textarea>
        <br>
        PO4 : 
        <%
        s=rs.getString("po4");
        %> <textarea placeholder="Program outcome 4" name="po4" rows="2" id="po4"><%=s%></textarea>
        <br>
        PO5 : 
        <%
        s=rs.getString("po5");
        %> <textarea placeholder="Program outcome 5" name="po5" rows="2" id="po5"><%=s%></textarea>
        <br>
        PO6 : 
        <%
        s=rs.getString("po6");
       
        %> <textarea placeholder="Program outcome 6" name="po6" rows="2" id="po6" ><%=s%></textarea>
        <br>
        PO7 : 
        <%
        s=rs.getString("po7");
        %> <textarea placeholder="Program outcome 7" name="po7" rows="2" id="po7" ><%=s%></textarea> 
        <br>
        PO8 : 
        <%
        s=rs.getString("po8");
        %> <textarea placeholder="Program outcome 8" name="po8" rows="2" id="po8"><%=s%></textarea>
        <br>
        PO9 : 
        <%
        s=rs.getString("po9");
         %> <textarea placeholder="Program outcome 9" name="po9" rows="2" id="po9"><%=s%></textarea>
        <br>
        PO10 : 
        <%
        s=rs.getString("po10");
        %> <textarea placeholder="Program outcome 10" name="po10" rows="2" id="po10"><%=s%></textarea>
        <br>
        PO11 : 
        <%
        s=rs.getString("po11");
        %> <textarea placeholder="Program outcome 11" name="po11" rows="2" id="po11"><%=s%></textarea>
        <br>
        PO12 : 
        <%
        s=rs.getString("po12");
        con.close();
        %> <textarea placeholder="Program outcome 12" name="po12" rows="2" id="po12"><%=s%></textarea>
        <br>
        <input type="hidden" value="alumni" name="type">
        <input type="submit" value="Enable Alumni Survey" name="submit" >   
        </form>
        <center><a href="po_home.jsp?tab=<%=tab%>">Back To <%=tab%></a></center>
    </div>
</center>
    
</body>
</html>
<%@ include file="footer.jsp" %>