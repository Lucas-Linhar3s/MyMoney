import 'package:workspace/app/modules/users/domain/model/users_model.dart';

abstract class IUsecaseUsers {
  Future<List<UsersModel>> findAll();
  Future<List<UsersModel>> findByName(String name);
  Future<bool> create(UsersModel model);
  Future<bool> update(UsersModel model);
  Future<bool> delete(String id);
}
