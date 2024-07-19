// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/v4.dart';
import 'package:workspace/app/modules/users/domain/model/users_model.dart';
import 'package:workspace/app/modules/users/domain/usecases/usecase_users_impl.dart';
import 'package:workspace/app/shared/exception/custom_exceptions.dart';

part 'modify_users_store.g.dart';

class ModifyUsersStore = _ModifyUsersStoreBase with _$ModifyUsersStore;

class RetornoValue {
  bool? success;
  UsersModel? model;
  RetornoValue({
    this.success,
    this.model,
  });
}

abstract class _ModifyUsersStoreBase with Store {
  final usecase = UsecaseUsersImpl();

  @observable
  String id = "";
  @observable
  String name = "";
  @observable
  String phone = "";
  @observable
  bool buttomLoading = false;

  @action
  void setId(String value) => id = value;
  @action
  void setName(String value) => name = value;
  @action
  void setPhone(String value) => phone = value;

  @action
  Future<RetornoValue> create() async {
    try {
      UsersModel model = UsersModel(
        // ignore: prefer_const_constructors
        id: UuidV4().generate(),
        name: name,
        phone: phone,
      );
      if (await usecase.create(model)) {
        return RetornoValue(success: true, model: model);
      }
      return RetornoValue(success: false);
    } on CustomExceptions catch (e) {
      if (kDebugMode) {
        print(e.logger);
      }
      return RetornoValue(success: false);
    }
  }

  @action
  Future<RetornoValue> update() async {
    try {
      UsersModel model = UsersModel(
        id: id,
        name: name,
        phone: phone,
      );
      if (await usecase.update(model)) {
        return RetornoValue(success: true, model: model);
      }
      return RetornoValue(success: false);
    } on CustomExceptions catch (e) {
      if (kDebugMode) {
        print(e.logger);
      }
      return RetornoValue(success: false);
    }
  }

  @action
  Future<bool> delete() async {
    try {
      return await usecase.delete(id);
    } on CustomExceptions catch (e) {
      if (kDebugMode) {
        print(e.logger);
      }
      return false;
    }
  }
}
