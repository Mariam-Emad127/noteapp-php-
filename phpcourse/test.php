<?php
#$fileName="image.jpg";

#$strtoarray=explode('.',$fileName);

#$ext=end($strtoarray);

#$allExt=array("png","jpg","gif");

#if(in_array($ext,$allExt )){

#echo"YES";


#}else{
#echo"NO";

#}


#$file=$_FILES["file"];
#echo "<pre>";
 #print_r($_FILES["file"]);
 #echo "</pre>";

include "connect.php";
imageUpload("file");
