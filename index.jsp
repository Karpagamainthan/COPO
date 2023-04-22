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
            border: 2px solid yellowgreen;
            height: auto;
            width: 250px;
            margin: auto; 
            margin-top: 10%;
            background:yellowgreen;
            opacity:.9;
        }
        h1{
            text-align: center;
        }
        .hr{
            border-top:1px solid black;
            margin-bottom:0;
        }
        button
        {
            font-size:1rem;
            width:200px;
            margin-top:20px;
            margin-bottom:20px;
            margin-left:25px;
            padding:5px;
            background:none;
            border-radius:5px;
            border: 1px solid black;
            cursor:pointer;
        }

        button:hover{
            font-size:0.9rem;
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
        <hr Class="hr">
        <button onclick="document.location='login.jsp'">FACULTY</button>
        <button onclick="document.location='stud_login.jsp'">STUDENT</button>
        <button onclick="document.location='alumnidetails.jsp'">ALUMNI SURVEY</button>
        <button onclick="document.location='parentdetails.jsp'">PARENT SURVEY</button>
    </div>
</body>
</html>
