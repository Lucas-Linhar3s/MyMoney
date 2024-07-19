// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modify_users_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ModifyUsersStore on _ModifyUsersStoreBase, Store {
  late final _$idAtom =
      Atom(name: '_ModifyUsersStoreBase.id', context: context);

  @override
  String get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(String value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$nameAtom =
      Atom(name: '_ModifyUsersStoreBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$phoneAtom =
      Atom(name: '_ModifyUsersStoreBase.phone', context: context);

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

  late final _$buttomLoadingAtom =
      Atom(name: '_ModifyUsersStoreBase.buttomLoading', context: context);

  @override
  bool get buttomLoading {
    _$buttomLoadingAtom.reportRead();
    return super.buttomLoading;
  }

  @override
  set buttomLoading(bool value) {
    _$buttomLoadingAtom.reportWrite(value, super.buttomLoading, () {
      super.buttomLoading = value;
    });
  }

  late final _$createAsyncAction =
      AsyncAction('_ModifyUsersStoreBase.create', context: context);

  @override
  Future<RetornoValue> create() {
    return _$createAsyncAction.run(() => super.create());
  }

  late final _$updateAsyncAction =
      AsyncAction('_ModifyUsersStoreBase.update', context: context);

  @override
  Future<RetornoValue> update() {
    return _$updateAsyncAction.run(() => super.update());
  }

  late final _$deleteAsyncAction =
      AsyncAction('_ModifyUsersStoreBase.delete', context: context);

  @override
  Future<bool> delete() {
    return _$deleteAsyncAction.run(() => super.delete());
  }

  late final _$_ModifyUsersStoreBaseActionController =
      ActionController(name: '_ModifyUsersStoreBase', context: context);

  @override
  void setId(String value) {
    final _$actionInfo = _$_ModifyUsersStoreBaseActionController.startAction(
        name: '_ModifyUsersStoreBase.setId');
    try {
      return super.setId(value);
    } finally {
      _$_ModifyUsersStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String value) {
    final _$actionInfo = _$_ModifyUsersStoreBaseActionController.startAction(
        name: '_ModifyUsersStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_ModifyUsersStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo = _$_ModifyUsersStoreBaseActionController.startAction(
        name: '_ModifyUsersStoreBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_ModifyUsersStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
name: ${name},
phone: ${phone},
buttomLoading: ${buttomLoading}
    ''';
  }
}
