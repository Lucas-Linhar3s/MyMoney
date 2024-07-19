import 'package:workspace/app/modules/users/domain/model/users_model.dart';
import 'package:workspace/app/modules/users/domain/repository/repository_users_impl.dart';
import 'package:workspace/app/modules/users/domain/usecases/i_usecase_users.dart';
import 'package:workspace/app/shared/exception/custom_exceptions.dart';

class UsecaseUsersImpl implements IUsecaseUsers {
  final RepositoryUsersImpl _repositoryUsersImpl = RepositoryUsersImpl.instance;

  @override
  Future<bool> create(UsersModel model) async {
    try {
      final map = UsersModel.toJson(model);
      return await _repositoryUsersImpl.create(map);
    } on CustomExceptions {
      rethrow;
    }
  }

  @override
  Future<bool> delete(String id) async {
    try {
      return await _repositoryUsersImpl.delete(id);
    } on CustomExceptions {
      rethrow;
    }
  }

  @override
  Future<List<UsersModel>> findAll() async {
    try {
      final response = await _repositoryUsersImpl.findAll();
      return UsersModel.fromJsonList(response);
    } on CustomExceptions {
      rethrow;
    }
  }

  @override
  Future<List<UsersModel>> findByName(String name) async {
    try {
      final response = await _repositoryUsersImpl.findByName(name);
      return UsersModel.fromJsonList(response);
    } on CustomExceptions {
      rethrow;
    }
  }

  @override
  Future<bool> update(UsersModel model) async {
    try {
      final map = UsersModel.toJson(model);
      return await _repositoryUsersImpl.update(map);
    } on CustomExceptions {
      rethrow;
    }
  }
}
