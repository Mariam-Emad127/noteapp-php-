<?php
include "../connect.php";
//include "../functions.php";

$username = filterRequest("username");
$email = filterRequest("email");
$password = filterRequest("password");

$stmt = $conn->prepare("
    INSERT INTO `users` (`username`, `email`, `password`)
    VALUES (?, ?, ?)
");

$stmt->execute(array($username, $email, $password));

$count = $stmt->rowCount();
if ($count > 0) {
   // $response = array("status" => "success");
   echo json_encode(array("status" => "success"));
} else {
    //$response = array("status" => "fail");
    echo json_encode(array("status" => "fail"));

}

//echo json_encode($response);
?>