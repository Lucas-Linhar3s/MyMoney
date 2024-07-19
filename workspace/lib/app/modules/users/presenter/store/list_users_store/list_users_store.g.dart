// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_users_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListUsersStore on _ListUsersStoreBase, Store {
  late final _$usersAtom =
      Atom(name: '_ListUsersStoreBase.users', context: context);

  @override
  List<UsersModel> get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(List<UsersModel> value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  late final _$idUserAtom =
      Atom(name: '_ListUsersStoreBase.idUser', context: context);

  @override
  String get idUser {
    _$idUserAtom.reportRead();
    return super.idUser;
  }

  @override
  set idUser(String value) {
    _$idUserAtom.reportWrite(value, super.idUser, () {
      super.idUser = value;
    });
  }

  late final _$usersJsonAtom =
      Atom(name: '_ListUsersStoreBase.usersJson', context: context);

  @override
  List<Map<String, dynamic>> get usersJson {
    _$usersJsonAtom.reportRead();
    return super.usersJson;
  }

  @override
  set usersJson(List<Map<String, dynamic>> value) {
    _$usersJsonAtom.reportWrite(value, super.usersJson, () {
      super.usersJson = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_ListUsersStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$proccessAtom =
      Atom(name: '_ListUsersStoreBase.proccess', context: context);

  @override
  bool get proccess {
    _$proccessAtom.reportRead();
    return super.proccess;
  }

  @override
  set proccess(bool value) {
    _$proccessAtom.reportWrite(value, super.proccess, () {
      super.proccess = value;
    });
  }

  late final _$detailsAtom =
      Atom(name: '_ListUsersStoreBase.details', context: context);

  @override
  bool get details {
    _$detailsAtom.reportRead();
    return super.details;
  }

  @override
  set details(bool value) {
    _$detailsAtom.reportWrite(value, super.details, () {
      super.details = value;
    });
  }

  late final _$nameUsersAtom =
      Atom(name: '_ListUsersStoreBase.nameUsers', context: context);

  @override
  String get nameUsers {
    _$nameUsersAtom.reportRead();
    return super.nameUsers;
  }

  @override
  set nameUsers(String value) {
    _$nameUsersAtom.reportWrite(value, super.nameUsers, () {
      super.nameUsers = value;
    });
  }

  late final _$phoneAtom =
      Atom(name: '_ListUsersStoreBase.phone', context: context);

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  late final _$getUsersAsyncAction =
      AsyncAction('_ListUsersStoreBase.getUsers', context: context);

  @override
  Future<void> getUsers() {
    return _$getUsersAsyncAction.run(() => super.getUsers());
  }

  late final _$updateListAsyncAction =
      AsyncAction('_ListUsersStoreBase.updateList', context: context);

  @override
  Future<void> updateList(UsersModel? data, int index, bool delete, bool edit) {
    return _$updateListAsyncAction
        .run(() => super.updateList(data, index, delete, edit));
  }

  late final _$getUserByNameAsyncAction =
      AsyncAction('_ListUsersStoreBase.getUserByName', context: context);

  @override
  Future<void> getUserByName(String name) {
    return _$getUserByNameAsyncAction.run(() => super.getUserByName(name));
  }

  @override
  String toString() {
    return '''
users: ${users},
idUser: ${idUser},
usersJson: ${usersJson},
loading: ${loading},
proccess: ${proccess},
details: ${details},
nameUsers: ${nameUsers},
phone: ${phone}
    ''';
  }
}
