<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
<%@ include file="header.jsp" %>
<%
    String tab=request.getParameter("tab");
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/co","root","");
    Statement st= con.createStatement();
    String sql="create table "+tab+"(id int AUTO_INCREMENT primary key,sem int,subcode varchar(30),subname varchar(30),co1 varchar(250) default '',co2 varchar(250) default '',co3 varchar(250) default '',co4 varchar(250) default '',co5 varchar(250) default '',co6 varchar(250) default '',enableIndirect int,direct float,indirect float,co float,po float)";
    st.executeUpdate(sql);
    String dept=(String)pageContext.getAttribute("dept",PageContext.SESSION_SCOPE);
    String deptname=(String)pageContext.getAttribute("deptname",PageContext.SESSION_SCOPE);
    con.close();
    response.sendRedirect("deptbatches.jsp?dept="+dept+"&deptname="+deptname);
%>
<%@ include file="footer.jsp" %> 