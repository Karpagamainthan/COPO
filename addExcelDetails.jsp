<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
<%@ include file="header.jsp" %>
<%@page import="org.apache.poi.hwpf.HWPFDocument"%>
<%@page import="org.apache.poi.hwpf.extractor.WordExtractor"%>
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
String subcode=(String)pageContext.getAttribute("subcode",PageContext.SESSION_SCOPE);
String subname=(String)pageContext.getAttribute("subname",PageContext.SESSION_SCOPE);
String id=(String)pageContext.getAttribute("id",PageContext.SESSION_SCOPE);
%>

<%
    String location=request.getParameter("location");
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root","");
    Statement st= con.createStatement();

     try
     {
        String name,rollno,email=null;
        PreparedStatement pstm = null ;
        FileInputStream input = new FileInputStream(location);
        POIFSFileSystem fs = new POIFSFileSystem(input); //creating a new poi reference to the given excel file
        HSSFWorkbook wb = new HSSFWorkbook(fs);
        HSSFSheet sheet = wb.getSheetAt(0);
        Row row;
        int i=1;
        ArrayList<String> presentRegno=new ArrayList<>();  // present regno in db add to arrayList
        String sql="select * from namelist ORDER by regno";
        ResultSet rs=st.executeQuery(sql);
        while(rs.next())
        {
            presentRegno.add(rs.getString("regno"));
        }
        for( i=1; i<=sheet.getLastRowNum(); i++)
        {  
            row = (Row) sheet.getRow(i);  //sheet number
            if( row.getCell(0)==null) 
            { 
                rollno = "0";
            }  //suppose excel cell is empty then its set to 0 the variable
            else 
                rollno = row.getCell(0).toString();   //else copies cell data to name variable
            if( row.getCell(1)==null) 
            { name = "0"; }
            else name= row.getCell(1).toString();
            if( row.getCell(2)==null) 
            { email = "0";   }
            else  email   = row.getCell(2).toString();
            rollno=new String(rollno);
            rollno = rollno.replace(".","").replace("E11"," ").trim();
            while(rollno.length()!=12)
                rollno=rollno+"0";

            String emailArr[]=email.split("@");
            String batch=emailArr[0].substring(emailArr[0].length()-4,emailArr[0].length()-2);
            String dept=emailArr[0].substring(emailArr[0].length()-2,emailArr[0].length());
            int b1=Integer.parseInt(batch);
            int b2=b1+4;
            batch="20"+b1+"_20"+b2;
            java.sql.Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dept,"root","");
            Statement st1= con1.createStatement();
            ArrayList<String> presentRegno1=new ArrayList<>();  // present regno in db add to arrayList
            String sql1="select * from "+batch+" ORDER by regno";
            ResultSet rs1=st1.executeQuery(sql1);
            while(rs1.next())
            {
                presentRegno1.add(rs1.getString("regno"));
            }
            if(!presentRegno1.contains(rollno))
            {
                presentRegno1.add(rollno);
                String sq="INSERT INTO "+batch+"(name,regno,email) VALUES('"+name+"','"+rollno+"','"+email+"')";
                st1.executeUpdate(sq);
            }

            if(!presentRegno.contains(rollno))
            {
                presentRegno.add(rollno);
                String sq="INSERT INTO namelist(name,regno,email) VALUES('"+name+"','"+rollno+"','"+email+"')";
                st.executeUpdate(sq);
            }
        }
    }
    catch(Exception e){
        out.println(e);
    }
   response.sendRedirect("namelist.jsp");
%>