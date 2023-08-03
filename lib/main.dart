import 'package:flutter/material.dart';
import 'package:notes/add_note.dart';
import 'package:notes/app_database.dart';

void main() {
  runApp(const MyApp());
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

  late AppDataBase myDB;
  List<Map<String, dynamic>> arrNotes = [];




  @override
  initState(){
    super.initState();
    myDB = AppDataBase.db;

    getNotes();
  }


  void  getNotes() async {
    arrNotes = await myDB.fetchAllNotes();
     setState(() {

     });
  }






  void  addNotes (String title, String desc) async {
    bool check = await myDB.addNote(title, desc);

    if(check){
      arrNotes = await myDB.fetchAllNotes();
      setState(() {

      });
    }
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
      'image' : "assets/images/orange.png",
      'title' : "How To Make Your Personal Brand Stand Out Online",
      'date' : "31-07-2023",
    },
    {
      'image' : "assets/images/orange.png",
      'title' : "How To Make Your Personal Brand Stand Out Online",
      'date' : "31-07-2023",
    },

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text("Notes"),),

      body: SingleChildScrollView(
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
                        itemCount: arrNotes.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                            // childAspectRatio: 4/5
                    ), itemBuilder: (context, index){
                      return Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            height:175,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(notesList[index]['image'])),

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
                                child: Text("${arrNotes[index]['title']}",style: TextStyle(fontSize: 20),)),
                          ),
                          Positioned(
                              left:25.0,
                              top:140.0,
                              child: Text("${notesList[index]['date']}"))
                        ],
                      );

                    }),
                  ),

                  SizedBox(
                      width: 350,
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => addNote(db: myDB),));
                      }, child: Text("Add Note")))
                ],
              ),
            )
          ],
        ),
      ),





    );


  }
}
