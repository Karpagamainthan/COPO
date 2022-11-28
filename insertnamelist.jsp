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
String dept=(String)pageContext.getAttribute("dept",PageContext.SESSION_SCOPE);
String batch=tab.substring(2);

%>
<%
if(request.getParameter("submit")!=null)
{   
    try
    {
    String regno=request.getParameter("regno");
    String name=request.getParameter("name");
    String email=request.getParameter("email"); 
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dept,"root","");
    Statement st= con.createStatement();
    
        ArrayList<String> presentRegno1=new ArrayList<String>();  // present regno in db add to arrayList
        String sql="select * from "+batch+" ORDER by regno";
        ResultSet rs=st.executeQuery(sql);
        while(rs.next())
        {
            presentRegno1.add(rs.getString("regno"));
        }
        if(!presentRegno1.contains(regno))
        {
            sql="insert into "+batch+"(regno,name,email) values('"+regno+"','"+name+"','"+email+"')";
            st.executeUpdate(sql);
        }
    
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root","");
    st= con.createStatement();
    sql="insert into namelist(regno,name,email) values('"+regno+"','"+name+"','"+email+"')";
    String sql1="insert into iat1(regno,name,co1,co2,co3,co4,co5,co6) values('"+regno+"','"+name+"',0,0,0,0,0,0)";
    String sql2="insert into iat2(regno,name,co1,co2,co3,co4,co5,co6) values('"+regno+"','"+name+"',0,0,0,0,0,0)";
    String sql3="insert into iat3(regno,name,co1,co2,co3,co4,co5,co6) values('"+regno+"','"+name+"',0,0,0,0,0,0)";
    String sql4="insert into ass1(regno,name,co1,co2,co3,co4,co5,co6) values('"+regno+"','"+name+"',0,0,0,0,0,0)";
    String sql5="insert into ass2(regno,name,co1,co2,co3,co4,co5,co6) values('"+regno+"','"+name+"',0,0,0,0,0,0)";
    String sql6="insert into ass3(regno,name,co1,co2,co3,co4,co5,co6) values('"+regno+"','"+name+"',0,0,0,0,0,0)";
    String sql7="insert into univ(regno,name,co1,co2,co3,co4,co5,co6) values('"+regno+"','"+name+"',0,0,0,0,0,0)";
    String sql8="insert into indirect(regno,name,status) values('"+regno+"','"+name+"','Assigned')";
    st.executeUpdate(sql);
    st.executeUpdate(sql1);
    st.executeUpdate(sql2);
    st.executeUpdate(sql3);
    st.executeUpdate(sql4);
    st.executeUpdate(sql5);
    st.executeUpdate(sql6);
    st.executeUpdate(sql7);
    st.executeUpdate(sql8);
    String pass="namelist.jsp";
    con.close();

    response.sendRedirect(pass);
}
catch(Exception e)
{
    
    response.sendRedirect("namelist.jsp?msg=1");
}
}

%>
<%@ include file="footer.jsp" %>