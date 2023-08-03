import 'package:flutter/material.dart';
import 'package:notes/app_database.dart';
import 'main.dart';


class addNote extends StatefulWidget {
  AppDataBase db;
  addNote({required this.db});

  @override
  State<addNote> createState() => _addNoteState();
}



class _addNoteState extends State<addNote> {

  var titleController = TextEditingController();
  var descController =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            height: 100,
            child: TextField(
              controller: titleController,
              style: TextStyle(fontSize: 25),
              decoration: InputDecoration(
                hintText: "Title",
                
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            height: 250,
            child: TextField(
              maxLines: 10,
              controller: descController,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                hintText: "Description",

              ),
            ),
          ),

          SizedBox(
             width: 350 ,
              child: ElevatedButton(onPressed: (){
                var title = titleController.text.toString();
                var desc = descController.text.toString();

                 widget.db.addNote(title, desc);
                 titleController.text = "";
                 descController.clear();
                 Navigator.pop(context);
              }, child: Text("Save")))

      ],
    ),

    );
  }


}
