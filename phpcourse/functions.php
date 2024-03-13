<?php

define('MB',1048576);
function filterRequest($requestname){
    return htmlspecialchars(strip_tags($_POST[$requestname]));
}


function imageUpload($imageRequest){

    global $msgError;
$imagename  =$_FILES[$imageRequest]["name"];
$imagetmp   =$_FILES[$imageRequest]["tmp_name"];
$imagesize  =$_FILES[$imageRequest]["size"];
$allExt     =array("png","jpg","gif","pdf");
$storearray =explode(".",$imagename);
$ext        =end($storearray);
$ext        =strtolower($ext);

if(!empty($imagename)&&!in_array($ext,$allExt)){

$msgError[]="EXIT";

}
if($imagesize > 2 * MB ){
$msgError="size";

}
if(empty($msgError)){move_uploaded_file($imagetmp,"../upload/".$imagename);
return $imagename;
}
  else{
return "fail";
  }


}


function deleteFile($dir,$imagename){

if(file_exists($dir."/".$imagename)){

unlink($dir."/".$imagename);

}

}