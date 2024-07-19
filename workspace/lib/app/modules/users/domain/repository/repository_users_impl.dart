import 'package:sqflite/sqflite.dart';
import 'package:workspace/app/modules/users/domain/repository/i_repository_users.dart';
import 'package:workspace/app/shared/database/config_database.dart';
import 'package:workspace/app/shared/exception/custom_exceptions.dart';

class RepositoryUsersImpl implements IRepositoryUsers {
  RepositoryUsersImpl._privateConstructor();

  static final RepositoryUsersImpl instance =
      RepositoryUsersImpl._privateConstructor();
  final ConfigDatabase _configDatabase = ConfigDatabase.instance;
  @override
  Future create(Map<String, dynamic> json) async {
    final db = await _configDatabase.database;
    try {
      final response = await db.insert('users', json);
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
          await db.delete('users', where: 'id = ?', whereArgs: [id]);
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
       id,
       name,
       phone
      FROM users;
 ''');
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
  Future findByName(String name) async {
    final db = await _configDatabase.database;
    try {
      final response = await db.rawQuery('''
      SELECT
       id,
       name,
       phone
      FROM users 
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
          .update('users', json, where: 'id = ?', whereArgs: [json['id']]);
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
