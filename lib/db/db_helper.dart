import 'package:salat_tracker/models/salat_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

// CREATE TABLE salat (
// id INTEGER PRIMARY KEY AUTOINCREMENT,
// date TEXT NOT NULL UNIQUE,
// fazr INTEGER DEFAULT 0,
// duhr INTEGER DEFAULT 0,
// asr INTEGER DEFAULT 0,
// magrib INTEGER DEFAULT 0,
// esha INTEGER DEFAULT 0
// );
class DbHelper {
  final String _createTableContact = '''create table $tblSalat(
  $tblSalatColId integer primary key,
  $tblSalatColDate text not null unique,
  $tblSalatColFazr INTEGER,
  $tblSalatColDuhr INTEGER,
  $tblSalatColAsr INTEGER,
  $tblSalatColMagrib INTEGER,
  $tblSalatColEsha INTEGER)''';

  Future<Database> _open() async {
    final root = await getDatabasesPath();
    final dbPath = path.join(root, 'salat.db');

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(_createTableContact);
      },
    );
  }

  Future<int> insertOrUpdate(SalatModel salat) async {
    final db = await _open();

    final existingEntry = await db.query(
      tblSalat,
      where: '$tblSalatColDate = ?',
      whereArgs: [salat.date],
    );

    if (existingEntry.isEmpty) {
      // No entry exists, insert a new row with default values
      return await db.insert(tblSalat, salat.toMap());
    } else {
      return await db.update(
        tblSalat,
        salat.toMap(),
        where: '$tblSalatColDate = ?',
        whereArgs: [salat.date],
      );
    }
  }

  Future<SalatModel> getSingleData(String date) async{
    final db = await _open();
    final existingEntry = await db.query(
      tblSalat,
      where: '$tblSalatColDate = ?',
      whereArgs: [date],
    );

    if(existingEntry.isNotEmpty ) return SalatModel.fromMap(existingEntry.first);
    return SalatModel(date: date);
  }
}
