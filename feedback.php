<?php 

session_start();
// include("feedback-server.php");
$conn = mysqli_connect('localhost','root','','project');

$show_feedback = mysqli_query($conn, "CALL display_fb");
// while ($row = mysqli_fetch_array($show_feedback)){     
//     print_r($row);
// }
?>

<!DOCTYPE html>
<html>

<head>
    <title>Mess feedback</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="styles/style.css">
</head>

<body style="background-image: url('home.jpg');">

    <!--Nav-bar-->
    <nav class="navbar navbar-expand-lg navbar-white bg-white">
        <a class="navbar-brand" id="big" href="#"><b>MESS FEEDBACK</b></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav ml-auto">

                <a class="nav-item nav-link" href="home.php"><i class="fa fa-fw fa-home"></i>Home</i></a>
                <a class="nav-item nav-link" href="user.php"><i class="fa fa-fw fa-user"></i><?php echo $_SESSION['username']; ?></i></a>
                <a class="nav-item nav-link" href="logout.php"><i class="fa fa-fw fa-power-off"></i>Logout</i></a>
            </div>
        </div>
    </nav>

    <!-- Form-->

    <div class="fb-container">
        <div class="food-fb">
            <h3 class="text-fb"><b>Give Feedback</b></h3><hr style="background-color:black; width:370px">
            <form method="POST" action="feedback-server.php">
              <center><p>Give suggestions about the food quality</p><input type="text" class="feedback-form" placeholder="comment:" name="food_fb" id="comment"></center><br>
              <center><p>Give suggestions about the service quality</p> <input type="text" class="feedback-form" placeholder="comment:" name="service_fb" id="comment"></center><br>
              <center><p>Give suggestions about the staff</p> <input type="text" class="feedback-form" placeholder="comment:" name="staff_fb" id="comment"></center>

                <div>
                    <p style="line-height: 70px; text-align: center;"><button type="submit" class="btn btn-primary mb-2">Submit</button>
                </div>
            </form>
        </div>
    </div>



<!-- <table>
    <tr>User ID</tr>
        <?php while ($row = mysqli_fetch_array($show_feedback))
        {
        ?>
        <td><?php echo $row["id"]; ?></td>
        <?php        
        } 
        ?>
      </tr> 
    <tr>Name </tr>
    <?php while ($row = mysqli_fetch_array($show_feedback))
        {
        ?>
        <td><?php echo $row["name"]; ?></td>
        <?php        
        } 
        ?>
    </tr>
    <tr>food feedback</tr>
    <?php while ($row = mysqli_fetch_array($show_feedback))
        {
        ?>
        <td><?php echo $row["food_quality"]; ?></td>
        <?php        
        } 
        ?>
        </tr>
    <tr>service feedback</tr>
    <?php while ($row = mysqli_fetch_array($show_feedback))
        {
        ?>
        <td><?php echo $row["service"]; ?></td>
        <?php        
        } 
        ?>
        </tr>
    <tr>staff feedback</tr>
    <?php while ($row = mysqli_fetch_array($show_feedback))
        {
        ?>
        <td><?php echo $row["staff_feedback"]; ?></td>
        <?php        
        } 
        ?>
    </tr>
    </table>


</table> -->

    <br>
    <br>
    <!-- Footer -->
    <div>
        <footer class="page-footer bg-dark">
            <div>
                <p style="color:white" class="h6 text-center footer-copyright p-4">Crafted with <span style="color: deeppink">Love</span></p>
                <div class="contact-footer">
                    <span>Contact Us</span>
                    <span>Email : <a href="mailto:jitmess@gmail.com">jitmess@gmail.com</a> Phone number : <a href="tel:9620403128">9620403128</a></span>
                </div>
            </div>
        </footer>
    </div>

</body>

</html>