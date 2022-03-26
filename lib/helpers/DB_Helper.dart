import 'package:my_app_template/models/note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB_Helper {
  static Database? _db;
  static final int _version = 1;
  static final String _notesTableName = "Notes";

  // if you want to use this file
  // you must add to main.dart
  // WidgetsFlutterBinding.ensureInitialized();
  // await DB_Helper.initDataBase();

  static Future<void> initDataBase() async {
    print('initDataBase');
    if (_db != null) {
      return;
    }
    try {
      _db = await openDatabase(join(await getDatabasesPath(), 'sample_db.db'),
          onCreate: ((db, version) async {
        await db.execute(
            """create table ${_notesTableName} (id INTEGER PRIMARY KEY, note TEXT)""");
      }), version: _version);
    } catch (e) {
      print(e);
    }
  }

  // Notes controll
  static Future<void> insertNote(Note note) async {
    await _db?.insert(_notesTableName, note.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Note>> getNotes() async {
    final List<Map<String, dynamic>> notes;
    late List<Note> notesObj;
    notes = await _db!.query(_notesTableName);
    notesObj = List.generate(notes.length, (index) {
      return Note(id: notes[index]['id'], note: notes[index]['note']);
    });
    return notesObj;
  }

  static Future<void> deleteNote(int id) async {
    await _db!.delete(_notesTableName, where: "id=?", whereArgs: [id]);
  }

  // static Future<void> deleteNoteWithBundleName(String bundleName) async {
  //   print(bundleName);
  //   await _db!.delete(_notesTableName,
  //       where: "bundleName=?", whereArgs: [bundleName]);
  // }
  // end Questions control

}
