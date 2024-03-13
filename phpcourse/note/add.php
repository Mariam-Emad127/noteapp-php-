<?php
include "../connect.php";
 
$title    = filterRequest("title");
$content  = filterRequest("content");
$id       = filterRequest("id");
 

$imagename=imageUpload("file");

if($imagename != "fail"){

$stmt = $conn->prepare(" 
  INSERT INTO `notes`(`notes_title`,`notes_content`,`notes_user`,`notes_image`)  
  VALUES (?,?,?,?)
 ");
$stmt->execute(array( $title,$content,$id,$imagename ));
$data= $stmt->fetch(PDO::FETCH_ASSOC); 

$count = $stmt->rowCount();
if ($count > 0) {
    echo json_encode(array("status" => "success" ));
} else {
     echo json_encode(array("status" => "fail"));

}}
?>