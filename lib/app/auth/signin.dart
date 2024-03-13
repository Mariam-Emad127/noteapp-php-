 import 'package:flutter/material.dart';
import 'package:testphp/componant/curd.dart';
import 'package:testphp/componant/customimage.dart';
import 'package:testphp/constant/links.dart';
import '../../componant/custombutton.dart';
import '../../componant/customtextformatfield.dart';
 
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late String username, email, password;

  TextEditingController conusername =   TextEditingController();
  TextEditingController conemail =   TextEditingController();
  TextEditingController conpassword =   TextEditingController();

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  Crud crud = Crud();

   fsignUp() async {
    try {
      var response = await crud.postResponse(
        linkSignup,
        {
          'username': conusername.text,
          'email': conemail.text,
          'password': conpassword.text,
        },

      );

      if (response != null && response["status"] == "success") {
        Navigator.of(context).pushNamedAndRemoveUntil("home", (route) => false);
      } else {
        print("false signin");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  // postResponse( ) async {
  //   try{
  //     await Future.delayed(Duration(seconds: 2));
  //
  //     var response = await http.post(Uri.parse(linkSignup), body:  {
  //       'username': conusername.text,
  //                'email': conemail.text,
  //                'password': conpassword.text,
  //     });
  //     print('Response body: ${response.body}');
  //     // Extract the JSON portion of the response body
  //     var jsonString = response.body.substring(response.body.indexOf('{'));
  //     print('JSON string: $jsonString');
  //     var responseBody = jsonDecode(jsonString);
  //
  //
  //   //  if (response.statusCode == 200) {
  //     //  var responseBody = jsonDecode(response.body);
  //       if (responseBody != null && responseBody["status"] == "success") {
  //         print('Responsebody: $responseBody');
  //         return responseBody;
  //       } else {
  //         print("Invalid response data");
  //
  //       print("Error: ${response.statusCode}");
  //     }
  //   }
  //
  //   catch(e){
  //     print('vvvvvvvvv$e');
  //
  //   }
  //
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(20),
          child: ListView(children: [
            Form(
              key: formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  CustomImage(),
                  SizedBox(height: 20),
                  const Text("SignUp",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  CustomTextFormAdd(
                    hinttext: "ُEnter Your username",
                    onsave: (val) {
                      username = val;
                    },
                    mycontroller: conusername,
                  ),
                  SizedBox(height: 5),
                  CustomTextFormAdd(
                    hinttext: "ُEnter Your Email",
                    onsave: (val) {
                      email = val;
                    },
                    mycontroller: conemail,
                  ),
                  SizedBox(height: 10),
                  const Text(
                    "Password",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  CustomTextFormAdd(
                    hinttext: "ُEnter Your Password",
                    onsave: (val) {
                      password = val;
                    },
                    mycontroller: conpassword,
                  ),
                  CustomButtonAuth(
                      title: "SignUp",
                      onPressed: () async {
                        await fsignUp( );
                       // Navigator.of(context).pushNamed( "home");

                      }),
                ],
              ),
            ),
          ])),
    );
  }
}
