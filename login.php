<?php
	session_start();
	include 'includes/conn.php';

	if(isset($_POST['login'])){
		$voter = $_POST['voter'];
		$password = $_POST['password'];
		$form = array();
		$form['voter'] = $voter;
    	$form['password'] = $password;

    	$result = $form;

		$sql = "SELECT * FROM voters WHERE student_id = '$voter'";
		$query = $conn->query($sql);

		if($query->num_rows < 1){
			$_SESSION['error'] = 'Cannot find voter with the ID';
			$result[0] = 0;
			$result[1] = 0;
		}
		else{
			$row = $query->fetch_assoc();
			if(password_verify($password, $row['password'])){
				$_SESSION['voter'] = $row['id'];
				$result[0] = 1;
				$result[1] = 1;
			}
			else{
				$result[0] = 0;
				$result[1] = 0;
				$_SESSION['error'] = 'Incorrect password';
			}
		}
		
	}
	else{
		$_SESSION['error'] = 'Input voter credentials first';
	}


date_default_timezone_set('GMT');

///Something to write to txt log
$log  = "|".date("   n-j-Y   |   g:i a")."  |  ".$voter." |      ".($result[0]=='1'?'Success':'Failed ')."     |".PHP_EOL.
		
        
        
        "--------------------------------------------------------------------".PHP_EOL;
//Save string to log, use FILE_APPEND to append.
file_put_contents('./log_'.date("j.n.Y").'.txt', $log, FILE_APPEND);


	header('location: index.php');

?>