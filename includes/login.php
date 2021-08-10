<?php
session_start();
	// To Connect to the Database
	$conn = mysqli_connect('localhost','root','','project') or die ("Could not connect to Database!");

	// DB User Id
	$user=$_POST['User'];

	// DB Password
	$password=$_POST['Pass'];

	if(empty($user)||empty($password)){
		header("location:../header.php?EmptyFields");
		exit();
	}
	else{
		$db= mysqli_select_db($conn, "project");
		$query=mysqli_query($conn, "Select * from user where username='$user' && password='$password'");
		$row=mysqli_num_rows($query);
		if($row==1)
		{
		   $_SESSION['username'] = $user;
		   header("Location: ../home.php");
		}
		else
		{
		  $error="Username or Password Invalid!";
		  header("Location:../header.php?Invalid");
		}
	}
?>








