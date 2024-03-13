import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:testphp/componant/curd.dart';
import 'package:testphp/componant/customtextformatfield.dart';
import 'package:testphp/constant/links.dart';

class EditNote extends StatefulWidget {
  final note;
  const EditNote({super.key, this.note});

  @override
  State<EditNote> createState() => _AddNotesState();
}

class _AddNotesState extends State<EditNote> {
  TextEditingController title =   TextEditingController();
  TextEditingController content =   TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  File? myfile;
  Crud crud = Crud();
  bool isLoading = false;
  editNote() async {
    isLoading = true;
    setState(() {});
    var response = await crud.postResponse(linkEditNote, {
      "title": title.text,
      "content": content.text,
      "note_id": widget.note["notes_id"].toString(),
      "imagename": widget.note["imagename"].toString(),

    });
    isLoading = true;
    setState(() {});
    if (response["status"] == "success") {
      Navigator.of(context).pushReplacementNamed("home");
    }
//return response;
  }

  void initState() {
    title.text = widget.note["notes_title"];
    content.text = widget.note["notes_content"];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note"),
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
            onPressed: () async{
             await editNote();
            },
            child: Text("Add"),
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
