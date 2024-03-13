import 'package:flutter/material.dart';
import 'package:testphp/app/model/model.dart';
import 'package:testphp/app/notes/edit.dart';
import 'package:testphp/componant/curd.dart';
import 'package:testphp/constant/links.dart';
import 'package:testphp/main.dart';
import '../componant/card_note.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Crud crud = Crud();

  getNotes() async {
    var response = await crud
        .postResponse(linkViewNote, {'id': sharedPref.getString("id")});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Homepage')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("add");
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        child: Column(
          children: [
            FutureBuilder(
              future: getNotes(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: Text("Loading...%%%"));
                }

                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data['data'].length,
                    itemBuilder: (context, i) {
                      return CardNote(
                        noteModel:NoteModel.fromJson( snapshot.data ["data"][i] ),
                       // content: "${snapshot.data['data'][i]["notes_content"]}",
                     // noteModel:NoteModel.fromJson(snapshot.data[i]["notes_content"]),
                      onDelete: () async{
                        var response=await crud.postResponse(linkDeleteNote,  {

                          "id":snapshot.data["data"][i]["notes_id"].toString(),
                          "imagename":snapshot.data["data"][i]["notes_image"].toString()
                        });

if(response['status']=="success"){
  Navigator.of(context).pushReplacementNamed( "home");
}
                      },
                        OnTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EditNote(
                                    note: snapshot.data['data'][i],
                                  )
                                  )
                                  );
                        },
                      );
                    },
                  );
                }

                return Center(child: Text("No data available"));
              },
            ),
          ],
        ),
      ),
    );
  }
}
