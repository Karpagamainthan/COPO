<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
<%@ include file="header.jsp" %>
<%
        String dept=request.getParameter("dept");
        String batch=request.getParameter("batch");
        
        String tab=dept+batch;
        Class.forName("com.mysql.jdbc.Driver");
        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/co","root","");
        Statement st= con.createStatement();
        String sql="insert into "+dept+"batches(dept,batch) values('"+dept+"','"+batch+"')";
        st.executeUpdate(sql);

        java.sql.Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dept,"root","");
        Statement st1= con1.createStatement();
        String sql1="create table "+batch+" (`id` int(11) not null auto_increment primary key,`regno` varchar(30) not null,`name` varchar(30) default null,`email` varchar(100) not null) ";
        String sql2="alter table "+batch+" add unique key `emailidindex` (`email`),add unique key `regno` (`regno`)";
        st1.executeUpdate(sql1);
        st1.executeUpdate(sql2);


    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/co","root","");
    st= con.createStatement();
    sql="create table "+tab+"(id int AUTO_INCREMENT primary key,sem int,subcode varchar(30),subname varchar(30),co1 varchar(250) default '',co2 varchar(250) default '',co3 varchar(250) default '',co4 varchar(250) default '',co5 varchar(250) default '',co6 varchar(250) default '',enableIndirect int,direct float default 0,indirect float default 0,co float default 0,po float default 0)";
    st.executeUpdate(sql);

    dept=(String)pageContext.getAttribute("dept",PageContext.SESSION_SCOPE);
    String deptname=(String)pageContext.getAttribute("deptname",PageContext.SESSION_SCOPE);
    
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/","root","");
    st= con.createStatement();
    sql="create database "+tab;
    st.executeUpdate(sql);

    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+tab,"root","");
    st= con.createStatement();
    sql="create table directpo(id int primary key,sem int,subcode varchar(30),subname varchar(30),po1 float default 0,po2 float default 0,po3 float default 0,po4 float default 0,po5 float default 0,po6 float default 0,po7 float default 0,po8 float default 0,po9 float default 0,po10 float default 0,po11 float default 0,po12 float default 0)";
    st.executeUpdate(sql);

    sql="create table indirectpo(type varchar(30),po1 float default 0,po2 float default 0,po3 float default 0,po4 float default 0,po5 float default 0,po6 float default 0,po7 float default 0,po8 float default 0,po9 float default 0,po10 float default 0,po11 float default 0,po12 float default 0)";
    st.executeUpdate(sql);
    sql="insert into indirectpo(type) values('alumni'),('parent')";
    st.executeUpdate(sql);

    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+tab,"root","");
    st= con.createStatement();
    sql="create table po(po varchar(20),weightage int,po1 float default 0,po2 float default 0,po3 float default 0,po4 float default 0,po5 float default 0,po6 float default 0,po7 float default 0,po8 float default 0,po9 float default 0,po10 float default 0,po11 float default 0,po12 float default 0)";
    st.executeUpdate(sql);

    sql="insert into po(po,weightage) values('direct',80),('alumni survey',15),('parent survey',5)";
    st.executeUpdate(sql);
    
    sql="create table survey(type varchar(30),po1 varchar(200) default '',po2 varchar(200) default '',po3 varchar(200) default '',po4 varchar(200) default '',po5 varchar(200) default '',po6 varchar(200) default '',po7 varchar(200) default '',po8 varchar(200) default '',po9 varchar(200) default '',po10 varchar(200) default '',po11 varchar(200) default '',po12 varchar(200) default '')";
    st.executeUpdate(sql);
    sql="insert into survey(type) values('alumni'),('parent')";
    st.executeUpdate(sql);
    
    sql="create table alumni(id int primary key auto_increment,name varchar(30),email varchar(60),po1 float default 0,po2 float default 0,po3 float default 0,po4 float default 0,po5 float default 0,po6 float default 0,po7 float default 0,po8 float default 0,po9 float default 0,po10 float default 0,po11 float default 0,po12 float default 0)";
    st.executeUpdate(sql);
    
    sql="create table parent(id int primary key  auto_increment,name varchar(30),email varchar(60),parent varchar(30),po1 float default 0,po2 float default 0,po3 float default 0,po4 float default 0,po5 float default 0,po6 float default 0,po7 float default 0,po8 float default 0,po9 float default 0,po10 float default 0,po11 float default 0,po12 float default 0)";
    st.executeUpdate(sql);

    con.close();
    response.sendRedirect("deptbatches.jsp?dept="+dept+"&deptname="+deptname+"");
%>
<%@ include file="footer.jsp" %> 