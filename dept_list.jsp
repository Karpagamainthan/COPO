<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CO PO</title>
    <style>
    /* hello ajith */
        body {
          text-align: center;
        }
        .flex-container {
          display: flex;
          flex-wrap: wrap;
          justify-content: space-around;
        }
        
        .flex-container > a {
          margin: 10px; 
          text-align: center;
          font-size: 30px;
        }
        </style>
</head>
<body>
<%@ include file="header.jsp" %>
    <h1>WELCOME</h1>
    <h2>SELECT YOUR DEPARTMENT</h2>
    <div class="flex-container">
        <div class="sub"><a href="deptbatches.jsp?dept=ee&deptname=Electrical and Electronics "><img src="deptEEE.jpg" alt="DEPT" width="300" height="300"></a></div>
        <div class="sub"><a href="deptbatches.jsp?dept=it&deptname=Information Technology"><img src="deptIT.jpg" alt="DEPT" width="300" height="300"></a></div>
        <div class="sub"><a href="deptbatches.jsp?dept=me&deptname=Mechanical"><img src="deptMECH.png" alt="DEPT" width="300" height="300"></a></div>
        <div class="sub"><a href="deptbatches.jsp?dept=ec&deptname=Electronics and Communication"><img src="deptECE.jpg" alt="DEPT" width="300" height="300"></a></div>
      </div>

</body>
</html>
<%@ include file="footer.jsp" %>