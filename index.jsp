<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CO PO</title>
    <style>
    body{
            background-image:url("logo2.jpg");
            background-repeat: no-repeat;
            background-attachment: fixed;  
            background-size: cover;
        }
        #i1{
            border-radius: 5%;
            border: 2px solid black;
            height: 350px;
            width: 250px;
            margin: auto; 
            margin-top: 10%;
            background:greenyellow;
        }
        h1{
            text-align: center;
        }
        button
        {
            background:none;
            border-radius:5%;
            border: 2px solid none;
            margin-top: 35px;
            margin-left: 80px;
            width:100px;
        }
        @media screen and (max-width:500px) {
            body{
                width: auto;
            }
            
        }
        marquee{
            margin-top: 40px;
            margin-left: 10px;
        }
        a
        {
            color:blue;
            text-decoration: none;
        }
        a:hover
        {
            color: brown;
        }

    </style>
    <script>
        let msg="<%= request.getParameter("msg") %>";
        if(msg=="1")
        {
            alert("Thanks for taking survey!!!");
        }
    </script>
</head>
<body>
    <div id="i1">
        <h1>CO & PO </h1>
        <hr>
        <button onclick="document.location='login.jsp'">ADMIN</button>
        <button onclick="document.location='login.jsp'">FACULTY</button>
        <button onclick="document.location='stud_login.jsp'">STUDENT</button>
        <marquee width="90%" direction="right" scrollamount="2"><a href="alumnidetails.jsp"><b>ALUMNI SURVEY</b></a>&nbsp&nbsp&nbsp&nbsp&nbsp</nbsp><a href="parentdetails.jsp"><b>PARENT SURVEY</a></marquee>
    </div>
</body>
</html>
