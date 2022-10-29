<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
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
      <a href="eeebatches.jsp"><img src="deptEEE.jpg" alt="DEPT" width="300" height="300"></a>
        <a href="itbatches.jsp"><img src="deptIT.jpg" alt="DEPT" width="300" height="300"></a>
        <a href="mechbatches.jsp"><img src="deptMECH.png" alt="DEPT" width="300" height="300"></a>
        <a href="ecebatches.jsp"><img src="deptECE.jpg" alt="DEPT" width="300" height="300"></a>
      </div>

</body>
</html>
<%@ include file="footer.jsp" %>