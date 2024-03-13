import 'package:flutter/material.dart';
import 'package:testphp/app/model/model.dart';
import 'package:testphp/constant/links.dart';


class CardNote extends StatelessWidget {
 final void Function()?OnTap;
/*  final String title;
 final String content; 
 , required this.title, required this.content
 */
 final void Function()?onDelete;  
 final NoteModel noteModel;
    CardNote({super.key, this.OnTap, this.onDelete, required this.noteModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: OnTap,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //'assets/images/logo.png'
            Expanded(flex: 2, child: Image.network("$imageServerRoot/${noteModel.notesImage}",height: 100,width: 100,)),
            Expanded(
                flex: 1,
                child: ListTile(
                  title: Text("${noteModel.notesTitle}"),
                  subtitle: Text("${noteModel.notesContent}"),
                  trailing:IconButton(icon:  Icon(Icons.delete), onPressed: onDelete,),
                  
                ))
          ],
        ),
      ),
    );
  }
}
