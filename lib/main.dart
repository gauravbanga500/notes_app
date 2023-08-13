import 'package:flutter/material.dart';
import 'package:notes/add_note.dart';
import 'package:notes/app_database.dart';
import 'package:notes/note_model.dart';
import 'package:notes/note_provider.dart';
import 'package:notes/notes_detail.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => NoteProvider(),
     child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var titleController = TextEditingController();
  var desController = TextEditingController();

  //late AppDataBase myDB;
  List<NoteModel> arrNotes = [];







  @override
  initState(){
    super.initState();
    //myDB = AppDataBase.db;

  }

  void getInitialNotes(BuildContext context){
    context.read<NoteProvider>().fetchNotes();
  }







  List<Map<String, dynamic>> notesList = [
    {
      'color' : Colors.yellow,
      'image' : "assets/images/orange.png",
      'title' : "How To Make Your Personal Brand  Stand Out Online",
      'date' : "31-07-2023",
    },
    {
      'color' : Colors.pink,
      'image' : "assets/images/orange.png",
      'title' : "How To Make Your Personal Brand Stand Out Online",
      'date' : "31-07-2023",
    },
    {
      'color' : Colors.greenAccent,
      'image' : "assets/images/orange.png",
      'title' : "How To Make Your Personal Brand Stand Out Online",
      'date' : "31-07-2023",
    },
    {
      'color' : Colors.blue,
      'image' : "assets/images/orange.png",
      'title' : "How To Make Your Personal Brand Stand Out Online",
      'date' : "31-07-2023",
    },
    {
      'color' : Colors.red,
      'image' : "assets/images/orange.png",
      'title' : "How To Make Your Personal Brand Stand Out Online",
      'date' : "31-07-2023",
    },
    {
      'color' : Colors.purple,
      'image' : "assets/images/orange.png",
      'title' : "How To Make Your Personal Brand Stand Out Online",
      'date' : "31-07-2023",
    },
    {
      'color' : Colors.purple,
      'image' : "assets/images/orange.png",
      'title' : "How To Make Your Personal Brand Stand Out Online",
      'date' : "31-07-2023",
    },
    {
      'color' : Colors.purple,
      'image' : "assets/images/orange.png",
      'title' : "How To Make Your Personal Brand Stand Out Online",
      'date' : "31-07-2023",
    },
    {
      'color' : Colors.purple,
      'image' : "assets/images/orange.png",
      'title' : "How To Make Your Personal Brand Stand Out Online",
      'date' : "31-07-2023",
    },
    {
      'color' : Colors.purple,
      'image' : "assets/images/orange.png",
      'title' : "How To Make Your Personal Brand Stand Out Online",
      'date' : "31-07-2023",
    },

  ];


  @override
  Widget build(BuildContext context) {
    getInitialNotes(context);
    return Scaffold(
    appBar: AppBar(title: Text("Notes"),),

      body: Consumer<NoteProvider>(
       builder: (_, provider, __){
         return SingleChildScrollView(
           child: Column(
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Align(
                     alignment: Alignment.topLeft,
                     child: Container(
                       margin: EdgeInsets.only(left: 15, top: 15),
                       height: 50,
                       child: Text("Notes", style: TextStyle(fontSize: 25),),
                     ),
                   ),
                   Align(
                     alignment: Alignment.topRight,
                     child: Container(
                         margin: EdgeInsets.only(right: 15, top: 0),
                         height: 50,
                         child: Icon(Icons.search)
                     ),
                   ),
                 ],

               ),
               SingleChildScrollView(
                 child: Column(
                   children: [
                     Container(
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(15)
                       ),
                       height: 560,
                       child: GridView.builder(
                           itemCount: provider.getNotes().length,
                           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                             crossAxisCount: 2,
                             // childAspectRatio: 4/5
                           ), itemBuilder: (_, index){
                             var currData = provider.getNotes()[index];
                         return Stack(
                           children: [
                             Container(
                               margin: EdgeInsets.only(left: 10),
                               height:175,
                               child: ClipRRect(
                                 borderRadius: BorderRadius.circular(10),
                                 child: InkWell(
                                     onTap: (){

                                       // updating the note
                                       //titleController.text = currData.title;
                                       //desController.text = currData.desc;
                                       Navigator.push(context, MaterialPageRoute(builder: (context) => AddNote(isUpdate: true, title: currData.title, desc:currData.desc),));

                                       // showModalBottomSheet(context: context,
                                       //     builder: (context){
                                       //       return Container(
                                       //         padding: EdgeInsets.all(15),
                                       //         height: 300,
                                       //         child: Column(
                                       //           children: [
                                       //             SizedBox(
                                       //               height: 5,
                                       //             ),
                                       //             Text("Update Note", style: TextStyle(fontSize: 25),),
                                       //             SizedBox(
                                       //               height: 15,
                                       //             ),
                                       //             TextField(
                                       //               controller: titleController,
                                       //               decoration: InputDecoration(
                                       //                   hintText: "Enter Title",
                                       //                   border: OutlineInputBorder(
                                       //                     borderRadius: BorderRadius.circular(16),
                                       //                   )
                                       //               ),
                                       //
                                       //             ),
                                       //
                                       //             SizedBox(
                                       //               height: 15,
                                       //             ),
                                       //             TextField(
                                       //               controller: desController,
                                       //               decoration: InputDecoration(
                                       //                   hintText: "Enter Description",
                                       //                   border: OutlineInputBorder(
                                       //                     borderRadius: BorderRadius.circular(16),
                                       //                   )
                                       //               ),
                                       //
                                       //             ),
                                       //
                                       //             ElevatedButton(onPressed: () async{
                                       //               var mTitle = currData.toString();
                                       //               var mDesc =  currData.toString();
                                       //               // await myDB.updateNote(NoteModel(note_id: arrNotes[index].note_id, title: mTitle, desc: mDesc));
                                       //               // getNotes();
                                       //               titleController.text = "";
                                       //               desController.clear();
                                       //               Navigator.pop(context);
                                       //
                                       //             }, child: Text("Update"))
                                       //           ],
                                       //         ),
                                       //       );
                                       //     }
                                       // );
                                     },

                                     child: Image.asset(notesList[index]['image'])


                                 ),
                               ),

                             ),
                             Align(
                               alignment: Alignment.topRight,
                               child: Container(
                                   margin: EdgeInsets.only(right: 15,top: 15),
                                   child: InkWell(
                                       onTap : () async{
                                         await context.read<NoteProvider>().db.deleteNote(currData.note_id!);
                                         // await currData.deleteNote(currData.note_id!,context);
                                         getInitialNotes(context);
                                       },
                                       child: Icon(Icons.delete))
                               ),
                             ),
                             // child: Card(
                             //   color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                             // )// child: Card(
                             //     color: ("${notesList[index]['color']}") as Color
                             // )
                             // Container(
                             //   child: color: Colors.primaries[_random.nextInt(Colors.primaries.length)] ,
                             // ),
                             Padding(
                               padding: const EdgeInsets.all(25.0),
                               child: Container(
                                   margin: EdgeInsets.only(right: 10, bottom: 15),
                                   child: Text("${currData.title}",style: TextStyle(fontSize: 20),)),
                             ),
                             Positioned(
                                 left:25.0,
                                 top:70,
                                 child: Align(
                                   child: Container(
                                       child: Text("${currData.desc}",  style: TextStyle(fontSize: 15,),maxLines: 2, overflow: TextOverflow.clip,textAlign: TextAlign.justify,)),
                                 )),
                             Container(
                                 padding: EdgeInsets.all(8),
                                 margin: EdgeInsets.only(left: 7, top: 90),
                                 width: 100,
                                 child: TextButton(onPressed: (){

                                   Navigator.push(context, MaterialPageRoute(builder: (context) => notesDetail(arrNotesData: currData),));

                                 }, child: Text("Read More"))),
                             Positioned(
                                 left:25.0,
                                 top:140.0,
                                 child: Row(
                                     children: [
                                       Text("${notesList[index]['date']}"),

                                     ]
                                 ))
                           ],
                         );

                       }),
                     ),

                     SizedBox(
                         width: 350,
                         child: ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AddNote(isUpdate: false),));
                         }, child: Text("Add Note"))),


                     SizedBox(
                       width: 50,
                     ),

                   ],
                 ),
               )
             ],
           ),
         );
       },
      )





    );


  }
}
