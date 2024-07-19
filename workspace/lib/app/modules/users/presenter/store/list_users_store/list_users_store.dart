// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:workspace/app/modules/users/domain/model/users_model.dart';
import 'package:workspace/app/modules/users/domain/usecases/usecase_users_impl.dart';
import 'package:workspace/app/shared/exception/custom_exceptions.dart';
part 'list_users_store.g.dart';

class ListUsersStore = _ListUsersStoreBase with _$ListUsersStore;

abstract class _ListUsersStoreBase with Store {
  final usecase = UsecaseUsersImpl();

  @observable
  List<UsersModel> users = [];
  @observable
  String idUser = "";
  @observable
  List<Map<String, dynamic>> usersJson = [];
  @observable
  bool loading = true;
  @observable
  bool proccess = true;
  @observable
  bool details = false;
  @observable
  String nameUsers = "";
  @observable
  String phone = "";

  @action
  Future<void> getUsers() async {
    try {
      users = await usecase.findAll();
      usersJson = users.map((e) => UsersModel.toJson(e)).toList();
      loading = false;
    } on CustomExceptions catch (e) {
      if (kDebugMode) {
        print(e.logger);
      }
    }
  }

  @action
  Future<void> updateList(
      UsersModel? data, int index, bool delete, bool edit) async {
    if (delete) {
      usersJson.removeAt(index);
      users = UsersModel.fromJsonList(usersJson);
    } else if (edit) {
      usersJson[index] = {
        "id": data!.id,
        "name": data.name,
        "phone": data.phone
      };
      users = UsersModel.fromJsonList(usersJson);
    } else {
      usersJson.add({"id": data!.id, "name": data.name, "phone": data.phone});
      users = UsersModel.fromJsonList(usersJson);
    }
  }

  @action
  Future<void> getUserByName(String name) async {
    try {
      users = await usecase.findByName(name);
      loading = false;
    } on CustomExceptions catch (e) {
      if (kDebugMode) {
        print(e.logger);
      }
    }
  }
}
