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
      <a href="deptbatches.jsp?dept=ee"><img src="deptEEE.jpg" alt="DEPT" width="300" height="300"></a>
        <a href="deptbatches.jsp?dept=it"><img src="deptIT.jpg" alt="DEPT" width="300" height="300"></a>
        <a href="deptbatches.jsp?dept=me"><img src="deptMECH.png" alt="DEPT" width="300" height="300"></a>
        <a href="deptbatches.jsp?dept=ec"><img src="deptECE.jpg" alt="DEPT" width="300" height="300"></a>
      </div>

</body>
</html>
<%@ include file="footer.jsp" %>