import 'package:flutter/material.dart';
import 'package:testphp/componant/customimage.dart';
import 'package:testphp/constant/links.dart';
import 'package:testphp/main.dart';
import '../../componant/curd.dart';
import '../../componant/custombutton.dart';
import '../../componant/customtextformatfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _SignUpState();
}

class _SignUpState extends State<Login> {
   TextEditingController conemail    =  TextEditingController();
  TextEditingController conpassword =  TextEditingController();

  GlobalKey<FormState> formState = GlobalKey<FormState>();
Crud crud =Crud();
  flogin( ) async {

    var response = await crud.postResponse(linkLogin, {
       'email': conemail.text,
      'password': conpassword.text,
    } );

     if ( response["status" ] == "success") {
       sharedPref.setString( "id", response["data"]["id"].toString());
       sharedPref.setString( "username", response["data"]["username"].toString());
       sharedPref.setString( "email", response["data"]["email"].toString());

      Navigator.of(context).pushNamedAndRemoveUntil("home", (route) => false);
    } else {
      print("false signin");
    }
  }
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(children: [
          Form(
            key:formState ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              const  SizedBox(height: 50),
         const    CustomImage(),
              const  SizedBox(height: 50),
               
                const Text(
                  "Email",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 10),
                CustomTextFormAdd(
                    hinttext: "ُEnter Your Email",
                    mycontroller: conemail ,
                  
                    ),
                SizedBox(height: 10),
                const Text(
                  "Password",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 10),
                CustomTextFormAdd(
                    hinttext: "ُEnter Your Password",
                    mycontroller: conpassword,
                    ),
                // Container(
                //   margin: const EdgeInsets.only(top: 10, bottom: 20),
                //   alignment: Alignment.topRight,
                //   child: const Text(
                //     "Forgot Password ?",
                //     style: TextStyle(
                //       fontSize: 14,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          CustomButtonAuth(
              title: "LOGIN",
              onPressed: () async {
flogin();
//Navigator.of(context).pushNamed( "home");
              }),


          Container(height: 20),
          // Text("Don't Have An Account ? Resister" , textAlign: TextAlign.center,)
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed("signin");
            },

            child: const Center(
              child: Text.rich(TextSpan(children: [
                TextSpan(
                  text: "Have An Account ? ",
                ),
                ]
    )
            )
            ))

          //       TextSpan(
          //           text: "Login",
          //           style: TextStyle(
          //               color: Colors.orange, fontWeight: FontWeight.bold)),
              ]
        )
      ),
      //       ),
      //     )
      //   ]),
      // ),
    );
  }
}