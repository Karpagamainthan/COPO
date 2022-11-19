<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*"%>
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
            border:1px solid grey;
            border-collapse: collapse;
            margin-bottom: 30px;
        }
        td,th {
            padding:10px;
            width:100px;
        }
        #stuname {
            width:200px;
        }
        #coform {
            width:500px;
            background-color: gray;
            padding:20px;
            margin-right:60px;
            margin-bottom: 30px;
        }
        .container
        {
            display:flex;

        }
       
        input[type="submit"],#form a{
            color:black;
            text-decoration: none;
            background-color: lightslategray;
            border:3px solid black;
            padding:5px;
            margin:0px 8px;
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
        input[type=number]
        {
            width: 30px;
            font-size:medium;
            border: none;
        }
    </style>
</head>
<body> 
    <center>
        <h1><%=tab+"   "+subcode+" - "+subname%></h1><hr></center>
        
    <div class="container">
        <div id="form">
            <h1>Course Outcomes</h1>
            <form id="coform">
                
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
                %> <textarea placeholder="Course outcome 1" name="co1" rows="2" id="co1" readonly ><%=s%></textarea> 
                <br>
                CO2 : 
                <%
                s=rs.getString("co2");
                %> <textarea placeholder="Course outcome 2" name="co2" rows="2" id="co2" readonly><%=s%></textarea>
                <br>
                CO3 : 
                <%
                s=rs.getString("co3");
                 %> <textarea placeholder="Course outcome 3" name="co3" rows="2" id="co3" readonly><%=s%></textarea>
                <br>
                CO4 : 
                <%
                s=rs.getString("co4");
                %> <textarea placeholder="Course outcome 4" name="co4" rows="2" id="co4" readonly><%=s%></textarea>
                <br>
                CO5 : 
                <%
                s=rs.getString("co5");
                %> <textarea placeholder="Course outcome 5" name="co5" rows="2" id="co5" readonly><%=s%></textarea>
                <br>
                CO6 : 
                <%
                s=rs.getString("co6");
                %> <textarea placeholder="Course outcome 6" name="co6" rows="2" id="co6"  readonly ><%=s%></textarea>
                <br>
                </form>
        <center><a id="subname1" href="subject.jsp?id=<%=id%>&subname=<%=subname%>&subcode=<%=subcode%>">Back To Course</a></td></center>
        <br>
    </div>
    <div id="table">
        <h1>PO Mapping</h1>
        <form action="savepomapping.jsp" method="GET">
        <table border="1">
            <thead>
                <tr>
                    <th>CO</th>
                    <th>PO1</th>
                    <th>PO2</th>
                    <th>PO3</th>
                    <th>PO4</th>
                    <th>PO5</th>
                    <th>PO6</th>
                    <th>PO7</th>
                    <th>PO8</th>
                    <th>PO9</th>
                    <th>PO10</th>
                    <th>PO11</th>
                    <th>PO12</th>
                </tr>
            </thead>
            <%
            int i=1;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root","");
            st= con.createStatement();
            sql="select * from po ORDER by co";
             rs=st.executeQuery(sql);
            while(rs.next())
            {
                if(i==7)
                break;
            %>
                <tr>
                    <td><b><%=rs.getInt("co")%></b></td>
                    <td><input type="number" min="0" max="3" name="co<%=i%>po1" value="<%=rs.getInt("po1")%>"></td>
                    <td><input type="number" min="0" max="3" name="co<%=i%>po2" value="<%=rs.getInt("po2")%>"></td>
                    <td><input type="number" min="0" max="3" name="co<%=i%>po3" value="<%=rs.getInt("po3")%>"></td>
                    <td><input type="number" min="0" max="3" name="co<%=i%>po4" value="<%=rs.getInt("po4")%>"></td>
                    <td><input type="number" min="0" max="3" name="co<%=i%>po5" value="<%=rs.getInt("po5")%>"></td>
                    <td><input type="number" min="0" max="3" name="co<%=i%>po6" value="<%=rs.getInt("po6")%>"></td>
                    <td><input type="number" min="0" max="3" name="co<%=i%>po7" value="<%=rs.getInt("po7")%>"></td>
                    <td><input type="number" min="0" max="3" name="co<%=i%>po8" value="<%=rs.getInt("po8")%>"></td>
                    <td><input type="number" min="0" max="3" name="co<%=i%>po9" value="<%=rs.getInt("po9")%>"></td>
                    <td><input type="number" min="0" max="3" name="co<%=i%>po10" value="<%=rs.getInt("po10")%>"></td>
                    <td><input type="number" min="0" max="3" name="co<%=i%>po11" value="<%=rs.getInt("po11")%>"></td>
                    <td><input type="number" min="0" max="3" name="co<%=i%>po12" value="<%=rs.getInt("po12")%>"></td>   
                </tr>
            <%
            i++;
            }
            %>
            <tr><td colspan="13"><center><input type="submit" value="Save Mapping"></center></td></tr>
            <tr>
                <td><b>AVG</b></td>
                <td><b><%=rs.getFloat("po1")%></b></td>
                <td><b><%=rs.getFloat("po2")%></b></td>
                <td><b><%=rs.getFloat("po3")%></b></td>
                <td><b><%=rs.getFloat("po4")%></b></td>
                <td><b><%=rs.getFloat("po5")%></b></td>
                <td><b><%=rs.getFloat("po6")%></b></td>
                <td><b><%=rs.getFloat("po7")%></b></td>
                <td><b><%=rs.getFloat("po8")%></b></td>
                <td><b><%=rs.getFloat("po9")%></b></td>
                <td><b><%=rs.getFloat("po10")%></b></td>
                <td><b><%=rs.getFloat("po11")%></b></td>
                <td><b><%=rs.getFloat("po12")%></b></td>    
            </tr>
             
        </table>
        
    </form>
    </div>
    </div>
</body>
</html>
<%@ include file="footer.jsp" %>