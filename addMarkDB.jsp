<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
<%@ include file="header.jsp" %>

<%@page import="org.apache.poi.poifs.filesystem.*"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@page import="org.apache.poi.*"%>
<%@page import="java.io.*"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.ObjectOutputStream"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@page import="org.apache.poi.ss.usermodel.Cell"%>
<%@page import="org.apache.poi.ss.usermodel.Row"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFSheet"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFWorkbook"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.io.FilenameUtils"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>

<%
String tab=(String)pageContext.getAttribute("tab",PageContext.SESSION_SCOPE);
String db=(String)pageContext.getAttribute("db",PageContext.SESSION_SCOPE);
out.println(tab+" "+db);
String subcode=(String)pageContext.getAttribute("subcode",PageContext.SESSION_SCOPE);
String subname=(String)pageContext.getAttribute("subname",PageContext.SESSION_SCOPE);
String id=(String)pageContext.getAttribute("id",PageContext.SESSION_SCOPE);
String batch=(String)pageContext.getAttribute("batch",PageContext.SESSION_SCOPE);
String deptname=(String)pageContext.getAttribute("deptname",PageContext.SESSION_SCOPE);

%>

<%
    String location=request.getParameter("location");
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root","");
    Statement st= con.createStatement();
    HashMap<Long, String> regno_name = new HashMap<Long, String>();
    String sql1="select * from namelist ORDER by regno";
    ResultSet rs1=st.executeQuery(sql1);
    while(rs1.next())
    {
        regno_name.put(Long.parseLong(rs1.getString("regno")), rs1.getString("name"));
    }
     
        String name,rollno;
        float ico1,ico2,ico3,ico4,ico5,ico6,aco1,aco2,aco3,aco4,aco5,aco6,sem;
        PreparedStatement pstm = null ;
        FileInputStream input = new FileInputStream(location);
        POIFSFileSystem fs = new POIFSFileSystem(input); //creating a new poi reference to the given excel file
        HSSFWorkbook wb = new HSSFWorkbook(fs);
        HSSFSheet sheet = wb.getSheetAt(0);
        Row row;
        int i=1;
        out.println(sheet.getLastRowNum());
        for( i=1; i<=sheet.getLastRowNum(); i++)
        {  
            row = (Row) sheet.getRow(i);  //sheet number
            if( row.getCell(0)==null) 
            { 
                rollno = "0";
            }  //suppose excel cell is empty then its set to 0 the variable
            else 
                rollno = row.getCell(0).toString();   //else copies cell data to name variable\

            rollno=new String(rollno);
            rollno = rollno.replace(".","").replace("E11"," ").trim();
            while(rollno.length()!=12)
                rollno=rollno+"0";

            name=name=regno_name.get(Long.parseLong(rollno));;
            if( row.getCell(2)==null)                       ico1 = 0;
            else if( row.getCell(2).toString().equals("dis"))          ico1 = -1;
            else                                            ico1 = Float.parseFloat(row.getCell(2).toString());

            if( row.getCell(3)==null)                       ico2 = 0;
            else if( row.getCell(3).toString().equals("dis"))          ico2 = -1;
            else                                            ico2 = Float.parseFloat(row.getCell(3).toString());

            if( row.getCell(4)==null)                       ico3 = 0;
            else if( row.getCell(4).toString().equals("dis"))          ico3 = -1;
            else                                            ico3 = Float.parseFloat(row.getCell(4).toString());

            if( row.getCell(5)==null)                       ico4 = 0;
            else if( row.getCell(5).toString().equals("dis"))          ico4 = -1;
            else                                            ico4 = Float.parseFloat(row.getCell(5).toString());

            if( row.getCell(6)==null)                       ico5 = 0;
            else if( row.getCell(6).toString().equals("dis"))          ico5 = -1;
            else                                            ico5 = Float.parseFloat(row.getCell(6).toString());

            if( row.getCell(7)==null)                       ico6 = 0;
            else if( row.getCell(7).toString().equals("dis"))          ico6 = -1;
            else                                            ico6 = Float.parseFloat(row.getCell(7).toString());

            if( row.getCell(8)==null)                       aco1 = 0;
            else if( row.getCell(8).toString().equals("dis"))          aco1 = -1;
            else                                            aco1 = Float.parseFloat(row.getCell(8).toString());

            if( row.getCell(9)==null)                       aco2 = 0;
            else if( row.getCell(9).toString().equals("dis"))          aco2 = -1;
            else                                            aco2 = Float.parseFloat(row.getCell(9).toString());

            if( row.getCell(10)==null)                      aco3 = 0;
            else if( row.getCell(10).toString().equals("dis"))         aco3 = -1;
            else                                            aco3 = Float.parseFloat(row.getCell(10).toString());

            if( row.getCell(11)==null)                      aco4 = 0;
            else if( row.getCell(11).toString().equals("dis"))         aco4 = -1;
            else                                            aco4 = Float.parseFloat(row.getCell(11).toString());

            if( row.getCell(12)==null)                      aco5 = 0;
            else if( row.getCell(12).toString().equals("dis"))         aco5 = -1;
            else                                            aco5 = Float.parseFloat(row.getCell(12).toString());

            if( row.getCell(13)==null)                      aco6 = 0;
            else if( row.getCell(13).toString().equals("dis"))         aco6 = -1;
            else                                            aco6 = Float.parseFloat(row.getCell(13).toString());

            if( row.getCell(14)==null)                      sem = 0;
            else if( row.getCell(14).toString().equals("dis"))         sem = -1;
            else                                            sem = Float.parseFloat(row.getCell(14).toString());


            
            String regno=rollno;
            Class.forName("com.mysql.jdbc.Driver");

            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root","");
            st= con.createStatement();
            if(regno_name.containsKey(Long.parseLong(rollno)))
            {
                String sql=null;
                if(ico1!=-1&&ico2!=-1){
                sql="insert into iat1(regno,name,co1,co2,co3,co4,co5,co6) values('"+regno+"','"+name+"','"+ico1+"','"+ico2+"',0,0,0,0)";
                st.executeUpdate(sql);}
                if(ico3!=-1&&ico4!=-1){
                sql="insert into iat2(regno,name,co1,co2,co3,co4,co5,co6) values('"+regno+"','"+name+"',0,0,'"+ico3+"','"+ico4+"',0,0)";
                st.executeUpdate(sql);}
                if(ico5!=-1&&ico6!=-1){
                sql="insert into iat3(regno,name,co1,co2,co3,co4,co5,co6) values('"+regno+"','"+name+"',0,0,0,0,'"+ico5+"','"+ico6+"')";
                st.executeUpdate(sql);}

                if(aco1!=-1&&aco2!=-1){
                sql="insert into ass1(regno,name,co1,co2,co3,co4,co5,co6) values('"+regno+"','"+name+"','"+aco1+"','"+aco2+"',0,0,0,0)";
                st.executeUpdate(sql);}
                if(aco3!=-1&&aco4!=-1){
                sql="insert into ass2(regno,name,co1,co2,co3,co4,co5,co6) values('"+regno+"','"+name+"',0,0,'"+ico3+"','"+ico4+"',0,0)";
                st.executeUpdate(sql);}
                if(aco5!=-1&&aco6!=-1){
                sql="insert into ass3(regno,name,co1,co2,co3,co4,co5,co6) values('"+regno+"','"+name+"',0,0,0,0,'"+ico5+"','"+ico6+"')";
                st.executeUpdate(sql);}

                if(sem!=-1){
                sql="insert into univ(regno,name,total) values('"+regno+"','"+name+"','"+sem+"')";
                st.executeUpdate(sql);}
            }
        }
        String pass="iat1.jsp"; 
    
    
    
%>
