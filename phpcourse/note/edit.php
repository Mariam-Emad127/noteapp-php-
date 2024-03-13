<?php
include "../connect.php";
 
$title    = filterRequest("title");
$content  = filterRequest("content");
$note_id  = filterRequest("note_id");
$imageName =filterRequest("imagename");


if(isset($_FILES["file"])){

deleteFile("../upload",$imageName);
  $imagename=imageUpload("file");


}
 $stmt = $conn->prepare("
  UPDATE `notes` SET `notes_title`=?, `notes_content`=? ,`notes_image`=?
  WHERE notes_id=?
");
$stmt->execute(array( $title,$content,$imageName,$note_id ));
 

$count = $stmt->rowCount();
if ($count > 0) {
    echo json_encode(array("status" => "success" ));
} else {
     echo json_encode(array("status" => "fail"));

}
?>