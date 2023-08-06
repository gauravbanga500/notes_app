import 'package:flutter/material.dart';




class notesDetail extends StatefulWidget {
  var arrNotesData;

  notesDetail({required this.arrNotesData});

  @override
  State<notesDetail> createState() => _notesDetailState();
}

class _notesDetailState extends State<notesDetail> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes Detail"),
      ),

      body: Column(
        children: [
          Container(
              padding: EdgeInsets.all(15),
              child: Text(widget.arrNotesData,style: TextStyle(fontSize: 25),)),
        ],
      ),
    );
  }
}
