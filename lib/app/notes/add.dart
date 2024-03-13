import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:testphp/componant/curd.dart';
import 'package:testphp/componant/customtextformatfield.dart';
import 'package:testphp/constant/links.dart';
import 'package:testphp/main.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  TextEditingController title =   TextEditingController();
  TextEditingController content =   TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  Crud crud = Crud();
    File? myfile;

  addNote() {
    var response = crud.postRequestwithFile(linkAddNote, {
      "title": title.text,
      "content": content.text,
      "id": sharedPref.getString("id")
    },myfile!
    );

    setState(() {
      
    });
    if (response["status"] == "success") {
      Navigator.of(context).pushReplacementNamed("home");
    }
 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Add Note"),
      ),
      body: Container(
        child: ListView(children: [
          CustomTextFormAdd(
            hinttext: 'title',
            mycontroller: title,
          ),
          CustomTextFormAdd(
            hinttext: 'content',
            mycontroller: content,
          ),
          MaterialButton(
            onPressed: ()async {
             await addNote();
            },
               child: Text("add"),
                           color: Colors.blue,

          ),
            MaterialButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => Container(
                        height: 100,
                        width: double.infinity,
                        child: Column(children: [
                          InkWell(
                            onTap: () async {
                              XFile? xFile = await ImagePicker()
                                  .pickImage(source: ImageSource.gallery);
                                                                    Navigator.of(context).pop( );

                              myfile = File(xFile!.path);
                            },
                            child: Container(
                                child: Text("Choose Image from gallery")),
                          ),
                          InkWell(
                            onTap: () async {
                              XFile? xFile = await ImagePicker()
                                  .pickImage(source: ImageSource.camera);
                                  Navigator.of(context).pop( );
                              myfile = File(xFile!.path);
                            },
                            child: Container(
                                child: Text("Choose Image from camera")),
                          )
                        ]),
                      ));
            },
            child: Text("Choose Image"),
            color: Colors.blue,
          )
        
        ]),
      ),
    );
  }
}
