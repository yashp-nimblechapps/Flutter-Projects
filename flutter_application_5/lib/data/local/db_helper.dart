import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DBHelper {
  DBHelper._();
  static DBHelper getInstance = DBHelper._();

  static const String TABLE_NOTE = "notes";
  static const String COLUMN_NOTE_SNO = "s_no";
  static const String COLUMN_NOTE_TITLE = "title";
  static const String COLUMN_NOTE_DESC = "description";

  Database? myDB;

  Future<Database> getDB() async {
    myDB ??= await openDB();
    return myDB!;

    /*if(myDB!=null){
      return myDB;
    }else{
      myDB = await openDB();
      return myDB!;
    }*/
  
  }

  Future<Database> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    final dbPath = join(dir.path, "noteDB2.db");

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE $TABLE_NOTE (
          $COLUMN_NOTE_SNO INTEGER PRIMARY KEY AUTOINCREMENT,
          $COLUMN_NOTE_TITLE TEXT,
          $COLUMN_NOTE_DESC TEXT
        )
        ''');
      },
    );
  }

  // all queries insert, update, delete

  // insertion
  Future<bool> addNote({required String mTitle,required String mDesc,}) async {
    final db = await getDB();
    
    int rowsEffected  = await db.insert(TABLE_NOTE, {
      COLUMN_NOTE_TITLE: mTitle,
      COLUMN_NOTE_DESC: mDesc,
    });
    return rowsEffected > 0;
  }

  //reading all data
  Future<List<Map<String, dynamic>>> getAllNotes() async {
    final db = await getDB();
    return await db.query(TABLE_NOTE);
  }

  // update data
  Future<bool> updateNote({required String mTitle, required String mDesc, required int sno}) async {
    var db = await getDB();

    int rowsEffected = await db.update(TABLE_NOTE, {
      COLUMN_NOTE_TITLE : mTitle,
      COLUMN_NOTE_DESC : mDesc 
    }, where: "$COLUMN_NOTE_SNO = $sno");

    return rowsEffected>0;
  }

  // delete data
  Future<bool> deleteNote({required int sno}) async {
    var db = await getDB();

    int rowsEffected = await db.delete(TABLE_NOTE, where: "$COLUMN_NOTE_SNO = $sno", whereArgs: ['$sno']);
    return rowsEffected>0;
  }
}


