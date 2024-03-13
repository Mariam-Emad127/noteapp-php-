<?php

$dsn = "mysql:host=localhost;dbname=course";
$username = "root";
$pass= "";
$option=array(
  PDO::MYSQL_ATTR_INIT_COMMAND =>"SET NAMES UTF8 "
);
try {
$conn = new PDO($dsn,  $username, $pass,$option);
// set the PDO error mode to exception
$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
//functions.php
include "functions.php";
echo "Connected successfully";

}
catch(PDOException $e)
{
echo "Connection failed: " . $e->getMessage();
}

?>