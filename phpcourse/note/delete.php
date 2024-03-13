<?php
include "../connect.php";
 
 $note_id = filterRequest("id");
 $imageName=filterRequest("imagename");
 

$stmt = $conn->prepare("DELETE FROM notes WHERE notes_id=?  ");
$stmt->execute(array( $note_id ));
 
$count = $stmt->rowCount();
if ($count > 0) {
    deleteFile("../upload",$imageName);
    echo json_encode(array("status" => "success" ));
} else {
     echo json_encode(array("status" => "fail"));

}
?>