<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ include file="header.jsp" %>
<%
    String dept=(String)pageContext.getAttribute("dept",PageContext.SESSION_SCOPE);
    String id=request.getParameter("id");
    String batch=request.getParameter("batch");
    Class.forName("com.mysql.jdbc.Driver");

    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/co","root","");
    Statement st= con.createStatement();
    String sql="delete from "+dept+"batches where id='"+id+"'";
    st.executeUpdate(sql);
    
    sql="select * from "+dept+""+batch;
    ResultSet rs=st.executeQuery(sql);
    while(rs.next())
    {
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306","root","");
        st= con.createStatement();
        String temp=dept+""+batch+"_"+rs.getInt("id");
        sql="drop database "+temp;
        st.executeUpdate(sql);
    }

    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/co","root","");
    st= con.createStatement();
    sql="drop table "+dept+""+batch;
    st.executeUpdate(sql);

    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dept,"root","");
    st= con.createStatement();
    sql="drop table "+batch;
    st.executeUpdate(sql);

    con = DriverManager.getConnection("jdbc:mysql://localhost:3306","root","");
    st= con.createStatement();
    sql="drop database "+dept+""+batch;
    st.executeUpdate(sql);
    
    con.close();
    response.sendRedirect("deptbatches.jsp");
%>
<%@ include file="footer.jsp" %> 