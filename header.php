<!DOCTYPE html>
<html>
<head>
    <title>Mess Feedback</title>
    <link rel="stylesheet" type="text/css" href="styles/login.css">
</head>
<body style="background-image: url('log.jpg'); background-position:0% 100% ;">

    <div class="login-box">
        <h1>JIT MESS</h1>
        <h2>Login</h2>
        <form action="includes/login.php" method="post">
            <h4>Username</h4>
            <input type="text" name="User" placeholder="Enter User-Name" id="username1" value=""><span id="message2" style="color:yellow"></span>
            <h4>Password</h4>
            <input type="password" name="Pass" placeholder="Enter Password" id="password1" value=""><span id="message3" style="color:yellow"></span>
            <input type="submit" name="login-submit" value="Login">
            <a href="forgot.php" class="frgt-btn">Forgot password?</a>
        </form>
    </div>
</body>

</html>