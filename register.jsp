<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body{
            height: 100%;            
            background-image:url("logo2.jpg");
            background-repeat: no-repeat;
            background-attachment: fixed;  
            background-size: cover;
        }
        #bro 
        {
            border: 1px solid whitesmoke;
            border-radius: 15px;
            height: 400px;
            width: 450px;
            margin:auto;
            margin-top: 9%;
            background-color: whitesmoke;
            padding: 10px;
        }
       #i1,#i2,#i3,#i4,#i5{
            border-radius: 20px; 
            height: 25px; 
            border: 1px;
            width: 225px;
            background-color: rgb(220, 220, 220);
       }
       #p1,#p3,#p4,#p5{
            margin-left: 60px; 
            margin-top: 20px;
        }
        #p2{
            margin-left: 57px; 
            margin-top: 20px;
        }
       #b1{
            margin-top: -50px;
            margin-left: 130px; 
            border-radius: 15px;
            height: 30px;
            width: 70px;
            border: 1px;
        }

        #b2{
            margin-top: -40px;
            margin-left: 30px; 
            border-radius: 15px;
            height: 30px;
            width: 70px;
            border: 1px;
        }
        
        button:hover {
            box-shadow: 0 2px gray;
            transform: translateY(1px);
        }
        select{
            border-radius: 20px; 
            height: 25px; 
            border: 1px;
            width: 225px;
            background-color: rgb(220, 220, 220);
        }
    </style>
    <script>
        function check()
        {
            if(document.form.password.value!=document.form.cpassword.value)
            {
                alert("Your Password and Confirm Password do not match");
            }
        }
    </script>
    <div id="bro">
    <h1>SignIn</h1>
    <hr>
    <form name="form" action="reg_insert.jsp" method="post">
        <p id="p1"><i class="fa fa-user icon"></i>&nbsp;
            <input id="i1" type="text" name="name" required="required" placeholder="   Name">
        </p>
        <p id="p2"><i class="fas fa-school"></i>&nbsp;
            <select required="required" name="department">
                <option value="Agricultural Engg">Agricultural Engg</option>
                <option value="Biomedical Engg">Biomedical Engg</option>
                <option value="Biotechnology">Biotechnology</option>
                <option value="Civil Engg">Civil Engg</option>
                <option value="Computer Science and Engg">Computer Science and Engg</option>
                <option value="Electrical and Electronics Engg">Electrical and Electronics Engg</option>
                <option value="Electronics and Communication Engg">Electronics and Communication Engg</option>
                <option value="Food Technology">Food Technology </option>
                <option value="Information Technology">Information Technology</option>
                <option value="Mechanical Engg">Mechanical Engg </option>
              </select>
        </p>
        <p id="p3"><i class="fa fa-envelope"></i>&nbsp;
            <input id="i3" type="email" name="email" required="required" placeholder="Email">
        </p>
        <p id="p4"><i class="fa fa-key icon"></i>&nbsp;
            <input id="i4"  type="password" name="password" required="required" placeholder="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
  title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters">
        </p>
        <p id="p5"><i class="fa fa-key icon"></i>&nbsp;
            <input id="i5"  type="password" name="cpassword"required="required" placeholder="Confirm Password" >
        </p>
        <div >
        <button id="b1" type = "reset" value = "Reset" ><b>RESET</b></button>  
        <button id="b2" onclick="check()"><b>SUBMIT</b></button>
        </div>
        </div>
    </form> 
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
   </body>
</html>