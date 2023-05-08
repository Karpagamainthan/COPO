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
        HSSFSheet sheet = wb.getSheetAt(6);
        Row row;
        int i=1;
        for( i=6; i<=sheet.getLastRowNum(); i++)
        {  
            row = (Row) sheet.getRow(i);  //sheet number
           if( row.getCell(1)==null) 
            { 
                rollno = "0";
            }  //suppose excel cell is empty then its set to 0 the variable
            else 
                rollno = row.getCell(1).toString();   //else copies cell data to name variable\

            rollno=new String(rollno);
            rollno = rollno.replace(".","").replace("E11"," ").trim();
            while(rollno.length()!=12)
                rollno=rollno+"0";

            name=name=regno_name.get(Long.parseLong(rollno));;
            
            if( row.getCell(3)==null)                      sem = 0;
            else                                            sem = Float.parseFloat(row.getCell(3).toString());


            out.println(rollno+"   :   "+sem+"<br>");
            String regno=rollno;
            Class.forName("com.mysql.jdbc.Driver");

            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root","");
            st= con.createStatement();
            if(regno_name.containsKey(Long.parseLong(rollno)))
            {
                String sql=null;
                out.println("<br>");
                
                
                sql="insert into univ(regno,name,total) values('"+regno+"','"+name+"','"+sem+"')";
                st.executeUpdate(sql);            
        }
        
        }
%>
