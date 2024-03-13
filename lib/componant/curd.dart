import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';
import 'package:http/http.dart'as http;
class Crud{

 getResponse(String uri)async{
try{
var response=await http.get(Uri.parse(uri) );
if(response.statusCode==200){
    var jsonString = response.body.substring(response.body.indexOf('{'));
       print('JSON string: $jsonString');
       var responseBody = jsonDecode(jsonString);
 
return responseBody;
}else{
  print( "Errorrrrrrrr${response.statusCode}");
}

}
catch(e){
print('dddddddddddddd $e');

}


}


  postResponse(String uri, Map data) async {
   try{
    await Future.delayed(Duration(seconds: 2));

    var response = await http.post(Uri.parse(uri), body: data);
    print('Response body: ${response.body}');
     if (response.statusCode == 200) {
       var jsonString = response.body.substring(response.body.indexOf('{'));
       print('JSON string: $jsonString');
       var responseBody = jsonDecode(jsonString);
     // var responseBody = json.decode(response.body);
      if (responseBody != null && responseBody["status"] == "success") {
        return responseBody;
      } else {
        print("Invalid response data");
      }
    } else {
      print("Error: ${response.statusCode}");
    }
  }

  catch(e){
print('vvvvvvvvv$e');

}


}

postRequestwithFile(String uri, Map data,File file)async{
var request=await http.MultipartRequest("post",Uri.parse(uri));
var length= await file.length();
var stream=http.ByteStream(file.openRead());
var multppartfile=http.MultipartFile( "file", stream, length,filename: basename(file.path));
request.files.add(multppartfile);

data.forEach((key, value) {
request.fields[key]=value;

 });

 var myrequest= await request.send();

var response=await http.Response.fromStream(myrequest);

if(myrequest.statusCode==200){
  return jsonDecode(response.body);
}else{
  print( "Error${myrequest.statusCode}");
}
}

}

//if (responseBody["status"] == "success") {
// print("mmmmmmmmmmmmmmm  ${response.body}");
//var responseBody =jsonDecode(response.body);
//  var responseBody =json.decode(response.body);
//print("11111111111$responseBody" );
//print("rrrrrrrrrrrrrrrrr${json.decode(response.body)}");