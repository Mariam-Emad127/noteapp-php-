<?php
include "connect.php";
 
$stmt=$conn->prepare("SELECT * FROM users ");
$stmt->execute();
$users=$stmt->fetchAll();

//print_r($users);
echo json_encode($response)


?>