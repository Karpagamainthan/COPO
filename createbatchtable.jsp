<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
<%@ include file="header.jsp" %>
<%
    String tab=request.getParameter("tab");
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/co","root","");
    Statement st= con.createStatement();
    String sql="create table "+tab+"(id int AUTO_INCREMENT primary key,sem int,subcode varchar(30),subname varchar(30),co1 varchar(250) default '',co2 varchar(250) default '',co3 varchar(250) default '',co4 varchar(250) default '',co5 varchar(250) default '',co6 varchar(250) default '',enableIndirect int,direct float default 0,indirect float default 0,co float default 0,po float default 0)";
    st.executeUpdate(sql);

    String dept=(String)pageContext.getAttribute("dept",PageContext.SESSION_SCOPE);
    String deptname=(String)pageContext.getAttribute("deptname",PageContext.SESSION_SCOPE);
    
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/","root","");
    st= con.createStatement();
    sql="create database "+tab;
    st.executeUpdate(sql);

    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+tab,"root","");
    st= con.createStatement();
    sql="create table directpo(id int primary key,sem int,subcode varchar(30),subname varchar(30),po1 float default 0,po2 float default 0,po3 float default 0,po4 float default 0,po5 float default 0,po6 float default 0,po7 float default 0,po8 float default 0,po9 float default 0,po10 float default 0,po11 float default 0,po12 float default 0)";
    st.executeUpdate(sql);

    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+tab,"root","");
    st= con.createStatement();
    sql="create table indirectpo(id int primary key,sem int,subcode varchar(30),subname varchar(30),po1 float default 0,po2 float default 0,po3 float default 0,po4 float default 0,po5 float default 0,po6 float default 0,po7 float default 0,po8 float default 0,po9 float default 0,po10 float default 0,po11 float default 0,po12 float default 0)";
    st.executeUpdate(sql);

    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+tab,"root","");
    st= con.createStatement();
    sql="create table po(po varchar(20),po1 float default 0,po2 float default 0,po3 float default 0,po4 float default 0,po5 float default 0,po6 float default 0,po7 float default 0,po8 float default 0,po9 float default 0,po10 float default 0,po11 float default 0,po12 float default 0)";
    st.executeUpdate(sql);

    sql="insert into po(po) values('direct'),('indirect'),('final')";
    st.executeUpdate(sql);

    con.close();
    response.sendRedirect("deptbatches.jsp?dept="+dept+"&deptname="+deptname);
%>
<%@ include file="footer.jsp" %> 