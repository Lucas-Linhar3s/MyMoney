// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modify_cards_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ModifyCardsStore on _ModifyCardsStoreBase, Store {
  late final _$idAtom =
      Atom(name: '_ModifyCardsStoreBase.id', context: context);

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
      Atom(name: '_ModifyCardsStoreBase.name', context: context);

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

  late final _$limitAtom =
      Atom(name: '_ModifyCardsStoreBase.limit', context: context);

  @override
  String get limit {
    _$limitAtom.reportRead();
    return super.limit;
  }

  @override
  set limit(String value) {
    _$limitAtom.reportWrite(value, super.limit, () {
      super.limit = value;
    });
  }

  late final _$buttomLoadingAtom =
      Atom(name: '_ModifyCardsStoreBase.buttomLoading', context: context);

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
      AsyncAction('_ModifyCardsStoreBase.create', context: context);

  @override
  Future<RetornoValue> create() {
    return _$createAsyncAction.run(() => super.create());
  }

  late final _$updateAsyncAction =
      AsyncAction('_ModifyCardsStoreBase.update', context: context);

  @override
  Future<RetornoValue> update() {
    return _$updateAsyncAction.run(() => super.update());
  }

  late final _$deleteAsyncAction =
      AsyncAction('_ModifyCardsStoreBase.delete', context: context);

  @override
  Future<bool> delete() {
    return _$deleteAsyncAction.run(() => super.delete());
  }

  late final _$_ModifyCardsStoreBaseActionController =
      ActionController(name: '_ModifyCardsStoreBase', context: context);

  @override
  void setId(String value) {
    final _$actionInfo = _$_ModifyCardsStoreBaseActionController.startAction(
        name: '_ModifyCardsStoreBase.setId');
    try {
      return super.setId(value);
    } finally {
      _$_ModifyCardsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String value) {
    final _$actionInfo = _$_ModifyCardsStoreBaseActionController.startAction(
        name: '_ModifyCardsStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_ModifyCardsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLimite(String value) {
    final _$actionInfo = _$_ModifyCardsStoreBaseActionController.startAction(
        name: '_ModifyCardsStoreBase.setLimite');
    try {
      return super.setLimite(value);
    } finally {
      _$_ModifyCardsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
name: ${name},
limit: ${limit},
buttomLoading: ${buttomLoading}
    ''';
  }
}
