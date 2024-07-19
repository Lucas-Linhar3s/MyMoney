import 'package:sqflite/sqflite.dart';
import 'package:workspace/app/modules/debts/domain/repository/i_repository_debts.dart';
import 'package:workspace/app/shared/database/config_database.dart';
import 'package:workspace/app/shared/exception/custom_exceptions.dart';

class RepositoryDebtsImpl implements IRepositoryDebts {
  RepositoryDebtsImpl._privateConstructor();

  static final RepositoryDebtsImpl instance =
      RepositoryDebtsImpl._privateConstructor();
  final ConfigDatabase _configDatabase = ConfigDatabase.instance;
  @override
  Future create(Map<String, dynamic> json) async {
    final db = await _configDatabase.database;
    try {
      final response = await db.insert('debts', json);
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
          await db.delete('debts', where: 'id = ?', whereArgs: [id]);
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
  Future findByIDCards(String idCards) async {
    final db = await _configDatabase.database;
    try {
      final response = await db.rawQuery('''
      SELECT
      DBT.id,
      DBT.description,
      DBT.value,
      DBT.parcels,
      DBT.is_paid,
      DBT.id_card,
      DBT.id_user,
      CRD.name as name_card,
      USR.name as name_user,
      (SELECT SUM(value) FROM debts WHERE id_card = DBT.id_card AND is_paid = 0) AS value_total
      FROM debts DBT
      LEFT JOIN users USR ON USR.id = DBT.id_user
      LEFT JOIN cards CRD ON CRD.id = DBT.id_card
      WHERE DBT.id_card = ?;
 ''', [idCards]);
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
  Future findByIDUsers(String idUsers) async {
    final db = await _configDatabase.database;
    try {
      final response = await db.rawQuery('''
      SELECT
      DBT.id,
      DBT.description,
      DBT.value,
      DBT.parcels,
      DBT.is_paid,
      DBT.id_card,
      DBT.id_user,
      CRD.name as name_card,
      USR.name as name_user,
      (SELECT SUM(value) FROM debts WHERE id_user = DBT.id_user AND is_paid = 0) AS value_total
      FROM debts DBT
      LEFT JOIN users USR ON USR.id = DBT.id_user
      LEFT JOIN cards CRD ON CRD.id = DBT.id_card
      WHERE DBT.id_user = ?;
 ''', [idUsers]);
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
      final response = await db.update("debts", {"is_paid": json["is_paid"]},
          where: "id = ?", whereArgs: [json['id']]);
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
  Future getUsers() async {
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
  Future getCards() async {
    final db = await _configDatabase.database;
    try {
      final response = await db.rawQuery('''
      SELECT
       id,
       name,
       limite
      FROM cards;
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
  Future updateParcels(Map<String, dynamic> json) async {
    final db = await _configDatabase.database;
    try {
      final response = await db.update("debts", {"parcels": json["parcels"]},
          where: "id = ?", whereArgs: [json['id']]);
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
