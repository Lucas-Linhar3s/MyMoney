import 'package:sqflite/sqflite.dart';
import 'package:workspace/app/modules/users/domain/repository/i_repository_users.dart';
import 'package:workspace/app/shared/database/config_database.dart';
import 'package:workspace/app/shared/exception/custom_exceptions.dart';

class RepositoryCardsImpl implements IRepositoryUsers {
  RepositoryCardsImpl._privateConstructor();

  static final RepositoryCardsImpl instance =
      RepositoryCardsImpl._privateConstructor();
  final ConfigDatabase _configDatabase = ConfigDatabase.instance;
  @override
  Future create(Map<String, dynamic> json) async {
    final db = await _configDatabase.database;
    try {
      final response = await db.insert('cards', json);
      if (response != 0) return true;
      return false;
    } on DatabaseException catch (e) {
      throw CustomExceptions(e.result.toString(), {
        "code": e.getResultCode(),
        "duplicate": e.isDuplicateColumnError(),
        "failed_open": e.isOpenFailedError(),
        "syntax_error": e.isSyntaxError(),
      });
    } catch (e) {
      throw CustomExceptions(
          e.toString(), {"code": 500, "error": "Internal Server Error"});
    }
  }

  @override
  Future delete(String id) async {
    final db = await _configDatabase.database;
    try {
      final response =
          await db.delete('cards', where: 'id = ?', whereArgs: [id]);
      if (response != 0) return true;
      return false;
    } on DatabaseException catch (e) {
      throw CustomExceptions(e.result.toString(), {
        "code": e.getResultCode(),
        "duplicate": e.isDuplicateColumnError(),
        "failed_open": e.isOpenFailedError(),
        "syntax_error": e.isSyntaxError(),
      });
    } catch (e) {
      throw CustomExceptions(
          e.toString(), {"code": 500, "error": "Internal Server Error"});
    }
  }

  @override
  Future findAll() async {
    final db = await _configDatabase.database;
    try {
      final response = await db.rawQuery('''
      SELECT
       CRD.id,
       CRD.name,
       (SELECT SUM(value) FROM debts WHERE id_card = CRD.id AND is_paid = 0) AS limite
      FROM cards CRD;
 ''');

      if (response.isEmpty || response[0]["id"] == null) {
        return [];
      }
      return response;
    } on DatabaseException catch (e) {
      throw CustomExceptions(e.result.toString(), {
        "code": e.getResultCode(),
        "duplicate": e.isDuplicateColumnError(),
        "failed_open": e.isOpenFailedError(),
        "syntax_error": e.isSyntaxError(),
      });
    } catch (e) {
      throw CustomExceptions(
          e.toString(), {"code": 500, "error": "Internal Server Error"});
    }
  }

  @override
  Future findByName(String name) async {
    final db = await _configDatabase.database;
    try {
      final response = await db.rawQuery('''
      SELECT
       id,
       name,
       limite
      FROM cards 
      WHERE 
        CASE 
          WHEN name = '' THEN 1
        ELSE name LIKE ? 
        END;
 ''', ["%$name%"]);
      if (response.isEmpty) {
        return [];
      }
      return response;
    } on DatabaseException catch (e) {
      throw CustomExceptions(e.result.toString(), {
        "code": e.getResultCode(),
        "duplicate": e.isDuplicateColumnError(),
        "failed_open": e.isOpenFailedError(),
        "syntax_error": e.isSyntaxError(),
      });
    } catch (e) {
      throw CustomExceptions(
          e.toString(), {"code": 500, "error": "Internal Server Error"});
    }
  }

  @override
  Future update(Map<String, dynamic> json) async {
    final db = await _configDatabase.database;
    try {
      final response = await db
          .update('cards', json, where: 'id = ?', whereArgs: [json['id']]);
      if (response != 0) return true;
      return false;
    } on DatabaseException catch (e) {
      throw CustomExceptions(e.result.toString(), {
        "code": e.getResultCode(),
        "duplicate": e.isDuplicateColumnError(),
        "failed_open": e.isOpenFailedError(),
        "syntax_error": e.isSyntaxError(),
      });
    } catch (e) {
      throw CustomExceptions(
          e.toString(), {"code": 500, "error": "Internal Server Error"});
    }
  }
}
