import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';



class AppDataBase{

  AppDataBase._();

  static final  AppDataBase db = AppDataBase._();


  Database? _database;



  //note
  static final NOTE_TABLE = "note";
  static final NOTE_ID  = "note_id";
  static final NOTE_TITLE = "title";
  static final NOTE_DESC = "desc";



  Future<Database> getDB() async{
    if(_database !=  null){
    return _database!;
    } else{
      return await initDB();
    }
  }

  Future<Database> initDB() async {

    Directory documentDirectory = await getApplicationDocumentsDirectory();
    var dbPath = join(documentDirectory.path, "noteDB.db");


    return openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async{
        db.execute("Create table $NOTE_TABLE ($NOTE_ID integer primary key autoincrement,$NOTE_TITLE text, $NOTE_DESC text )");
      }
    );



  }

  Future<bool> addNote(String title, String desc ) async{

    var db = await getDB();

    int rowseffect = await db.insert(NOTE_TABLE, {NOTE_TITLE : title, NOTE_DESC: desc, });

      if(rowseffect>0){
        return true;
      }else{
        return false;
      }


  }

  Future<List<Map< String, dynamic>>> fetchAllNotes ()  async {
    var db = await getDB();

    List<Map<String,dynamic>> notes  = await db.query(NOTE_TABLE);
    return notes;

  }


}


