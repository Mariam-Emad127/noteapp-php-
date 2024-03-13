import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testphp/app/auth/login.dart';
import 'package:testphp/app/auth/signin.dart';
import 'package:testphp/app/home.dart';
import 'package:testphp/app/notes/add.dart';
import 'package:testphp/app/notes/edit.dart';

late SharedPreferences sharedPref ;
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref=await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(


        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const SignUp(),

      initialRoute:sharedPref.getString("id")==null? 'login':"home",
routes: {
'login': (context) =>Login(),
'signin':(context)=>SignUp(),
'home':(context)=>Home(),
'add':(context)=>AddNotes(),
'edit':(context)=>EditNote()


},
    );
  }
}


