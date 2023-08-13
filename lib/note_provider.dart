import 'package:flutter/material.dart';
import 'package:notes/app_database.dart';
import 'note_model.dart';


class NoteProvider extends ChangeNotifier{

  List<NoteModel>  _arrNotes = [];

  AppDataBase db  = AppDataBase.db;


  // to get initial notes when app is opened
   fetchNotes() async{
     _arrNotes = await db.fetchAllNotes();
     notifyListeners();
  }

  // to add note
  addNote(NoteModel newNote) async{
    var check = await db.addNote(newNote);

    if(check){
      // _arrNotes = await db.fetchAllNotes();
      // notifyListeners();
      fetchNotes();
    }
  }
// Update Note
  updateNote(NoteModel updateNote) async{
    var check = await db.updateNote(updateNote);
    if(check){
      // _arrNotes = await db.fetchAllNotes();
      // notifyListeners();
      fetchNotes();
    }
  }
  List<NoteModel> getNotes(){
     return _arrNotes;
  }


}
