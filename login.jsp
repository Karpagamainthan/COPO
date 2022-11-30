<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>CO PO</title>
    <style>
    a{
        text-decoration: none;
        color:blue;
    }
        body{
            background-image:url("logo2.jpg");
            background-repeat: no-repeat; 
            background-attachment: fixed;  
            background-size: cover;
        }
        #main{
            border: 2px solid navy;
            height: 300px;
            width: 450px;
            margin: auto;
            margin-top: 10%;
            padding: -1px;
            border-radius: 15px;
            background-color:whitesmoke;
        }
        #i1{
            border-radius: 20px; 
            height: 25px; 
            border: 1px;
            width: 225px;
            background-color: rgb(220, 220, 220);
        }
        #i2{
            border-radius: 20px; 
            height: 25px; 
            border: 1px;
            width: 225px;
            background-color: rgb(220, 220, 220);
        }
        #i3{
            margin-top: 0px;
            border-radius: 15px;
            height: 40px;
            width: 80px;
            border: 1px;
            
        }
        
        #i3:hover {
            box-shadow: 0 2px gray;
            transform: translateY(1px);
        }
        #i4{
            margin-top: 60px;
            text-align: center;
            padding: 15PX;
        }
        #p1
        {margin-left: 100px; 
            margin-top: 20px;
        }
        #p2
        {
            margin-left: 100px; 
            margin-top: 20px;
        }
        h1{
            margin-left: 15px;
        }
    </style>
</head>
<body>
    <div id="main">
        <h1>Login</h1>
        <hr>
        <form action="login_valid.jsp" method="post">
            <div>
                <p id="p1" ><i class="fa fa-user icon"></i>&nbsp;
                <input id="i1" type="email" name="email" required="required" placeholder="   Email"></p>
            </div>
            <div>
                <p id="p1"><i class="fa fa-key icon"></i>
                <input id="i2"  type="password" name="password" required="required" placeholder="   Password"></p>
            </div>
            <div>
                <center><input id="i3" type="submit" value="Submit"></center>
            </div>    <hr>
        </form>
        
    </div>
</body>
</html>