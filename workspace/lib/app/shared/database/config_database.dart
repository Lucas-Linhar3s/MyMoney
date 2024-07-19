import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:workspace/app/shared/consts/consts.dart';

class ConfigDatabase {
  ConfigDatabase._privateConstructor();

  static final ConfigDatabase instance = ConfigDatabase._privateConstructor();

  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'database.db'),
      onCreate: (db, version) async {
        await db.execute(tableUser);
        await db.execute(tableCards);
        await db.execute(tableTransactions);
      },
      version: 1,
    );
  }

  Future<void> close() async {
    if (_db != null) {
      await _db!.close();
      _db = null;
    }
  }
}
