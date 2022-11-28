<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
<%@ include file="header.jsp" %>
<%
    String db=request.getParameter("db");
    String tab=(String)pageContext.getAttribute("tab",PageContext.SESSION_SCOPE);
    String batch=(String)pageContext.getAttribute("batch",PageContext.SESSION_SCOPE);
    String dept=(String)pageContext.getAttribute("dept",PageContext.SESSION_SCOPE);
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root","");
    Statement st= con.createStatement();
    String sql="create table `namelist` (`id` int(11) not null auto_increment primary key,`regno` varchar(30) not null unique,`name` varchar(30) default null,`email` varchar(100) not null  unique) ";
    String sql1="create table iat1(id int AUTO_INCREMENT primary key,regno varchar(30)  unique,name varchar(30),co1 int,co2 int,co3 int,co4 int,co5 int,co6 int,total int)";
    String sql2="create table iat2(id int AUTO_INCREMENT primary key,regno varchar(30)  unique,name varchar(30),co1 int,co2 int,co3 int,co4 int,co5 int,co6 int,total int)";
    String sql3="create table iat3(id int AUTO_INCREMENT primary key,regno varchar(30)  unique,name varchar(30),co1 int,co2 int,co3 int,co4 int,co5 int,co6 int,total int)";
    String sql4="create table ass1(id int AUTO_INCREMENT primary key,regno varchar(30)  unique,name varchar(30),co1 int,co2 int,co3 int,co4 int,co5 int,co6 int,total int)";
    String sql5="create table ass2(id int AUTO_INCREMENT primary key,regno varchar(30)  unique,name varchar(30),co1 int,co2 int,co3 int,co4 int,co5 int,co6 int,total int)";
    String sql6="create table ass3(id int AUTO_INCREMENT primary key,regno varchar(30)  unique,name varchar(30),co1 int,co2 int,co3 int,co4 int,co5 int,co6 int,total int)";
    String sql7="create table univ(id int AUTO_INCREMENT primary key,regno varchar(30)  unique,name varchar(30),co1 int,co2 int,co3 int,co4 int,co5 int,co6 int,total int)";
    String sql8="create table final(co varchar(30),iat1 int,iat2 int,iat3 int,ass1 int,ass2 int,ass3 int,univ int)";

    String sql9="insert into final(co,iat1,iat2,iat3,ass1,ass2,ass3,univ) values('co1',0,0,0,0,0,0,0)";
    String sql10="insert into final(co,iat1,iat2,iat3,ass1,ass2,ass3,univ) values('co2',0,0,0,0,0,0,0)";
    String sql11="insert into final(co,iat1,iat2,iat3,ass1,ass2,ass3,univ) values('co3',0,0,0,0,0,0,0)";
    String sql12="insert into final(co,iat1,iat2,iat3,ass1,ass2,ass3,univ) values('co4',0,0,0,0,0,0,0)";
    String sql13="insert into final(co,iat1,iat2,iat3,ass1,ass2,ass3,univ) values('co5',0,0,0,0,0,0,0)";
    String sql14="insert into final(co,iat1,iat2,iat3,ass1,ass2,ass3,univ) values('co6',0,0,0,0,0,0,0)";
    
    st.executeUpdate(sql);
    st.executeUpdate(sql1);
    st.executeUpdate(sql2);
    st.executeUpdate(sql3);
    st.executeUpdate(sql4);
    st.executeUpdate(sql5);
    st.executeUpdate(sql6);
    st.executeUpdate(sql7);
    st.executeUpdate(sql8);
    st.executeUpdate(sql9);
    st.executeUpdate(sql10);
    st.executeUpdate(sql11); 
    st.executeUpdate(sql12);
    st.executeUpdate(sql13);
    st.executeUpdate(sql14);

    sql="insert into namelist(regno,name,email) select regno,name,email from "+dept+"."+batch;
    st.executeUpdate(sql);

    sql="insert into iat1(regno,name) select regno,name from "+dept+"."+batch;
    st.executeUpdate(sql);

    sql="insert into iat2(regno,name) select regno,name from "+dept+"."+batch;
    st.executeUpdate(sql);

    sql="insert into iat3(regno,name) select regno,name from "+dept+"."+batch;
    st.executeUpdate(sql);

    sql="insert into ass1(regno,name) select regno,name from "+dept+"."+batch;
    st.executeUpdate(sql);

    sql="insert into ass2(regno,name) select regno,name from "+dept+"."+batch;
    st.executeUpdate(sql);

    sql="insert into ass3(regno,name) select regno,name from "+dept+"."+batch;
    st.executeUpdate(sql);

    sql="insert into univ(regno,name) select regno,name from "+dept+"."+batch;
    st.executeUpdate(sql);

    String sql16="create table indirect(id int AUTO_INCREMENT primary key,regno varchar(30)  unique,name varchar(30),co1 int,co2 int,co3 int,co4 int,co5 int,co6 int,status varchar(20))";
    st.executeUpdate(sql16);

    sql="insert into indirect(regno,name) select regno,name from "+dept+"."+batch;
    st.executeUpdate(sql);

    sql="create table po(co int primary key,po1 float default 0,po2 float default 0,po3 float default 0,po4 float default 0,po5 float default 0,po6 float default 0,po7 float default 0,po8 float default 0,po9 float default 0,po10 float default 0,po11 float default 0,po12 float default 0)";
    st.executeUpdate(sql);

    sql="insert into po(co) values (1),(2),(3),(4),(5),(6),(7),(8)";
    st.executeUpdate(sql);
    con.close();
    response.sendRedirect("batch.jsp?tab="+tab);
%>
<%@ include file="footer.jsp" %>