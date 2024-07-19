// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_debts_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateDebtsStore on _CreateDebtsStoreBase, Store {
  late final _$idAtom =
      Atom(name: '_CreateDebtsStoreBase.id', context: context);

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

  late final _$descriptionAtom =
      Atom(name: '_CreateDebtsStoreBase.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$valueDebtAtom =
      Atom(name: '_CreateDebtsStoreBase.valueDebt', context: context);

  @override
  double get valueDebt {
    _$valueDebtAtom.reportRead();
    return super.valueDebt;
  }

  @override
  set valueDebt(double value) {
    _$valueDebtAtom.reportWrite(value, super.valueDebt, () {
      super.valueDebt = value;
    });
  }

  late final _$parcelsAtom =
      Atom(name: '_CreateDebtsStoreBase.parcels', context: context);

  @override
  String get parcels {
    _$parcelsAtom.reportRead();
    return super.parcels;
  }

  @override
  set parcels(String value) {
    _$parcelsAtom.reportWrite(value, super.parcels, () {
      super.parcels = value;
    });
  }

  late final _$isPaidAtom =
      Atom(name: '_CreateDebtsStoreBase.isPaid', context: context);

  @override
  int get isPaid {
    _$isPaidAtom.reportRead();
    return super.isPaid;
  }

  @override
  set isPaid(int value) {
    _$isPaidAtom.reportWrite(value, super.isPaid, () {
      super.isPaid = value;
    });
  }

  late final _$idUserAtom =
      Atom(name: '_CreateDebtsStoreBase.idUser', context: context);

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

  late final _$idCardAtom =
      Atom(name: '_CreateDebtsStoreBase.idCard', context: context);

  @override
  String get idCard {
    _$idCardAtom.reportRead();
    return super.idCard;
  }

  @override
  set idCard(String value) {
    _$idCardAtom.reportWrite(value, super.idCard, () {
      super.idCard = value;
    });
  }

  late final _$valueTotalAtom =
      Atom(name: '_CreateDebtsStoreBase.valueTotal', context: context);

  @override
  double get valueTotal {
    _$valueTotalAtom.reportRead();
    return super.valueTotal;
  }

  @override
  set valueTotal(double value) {
    _$valueTotalAtom.reportWrite(value, super.valueTotal, () {
      super.valueTotal = value;
    });
  }

  late final _$buttomLoadingAtom =
      Atom(name: '_CreateDebtsStoreBase.buttomLoading', context: context);

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
      AsyncAction('_CreateDebtsStoreBase.create', context: context);

  @override
  Future<RetornoValue> create() {
    return _$createAsyncAction.run(() => super.create());
  }

  late final _$updateAsyncAction =
      AsyncAction('_CreateDebtsStoreBase.update', context: context);

  @override
  Future<RetornoValue> update() {
    return _$updateAsyncAction.run(() => super.update());
  }

  late final _$updateParcelsAsyncAction =
      AsyncAction('_CreateDebtsStoreBase.updateParcels', context: context);

  @override
  Future<RetornoValue> updateParcels() {
    return _$updateParcelsAsyncAction.run(() => super.updateParcels());
  }

  late final _$deleteAsyncAction =
      AsyncAction('_CreateDebtsStoreBase.delete', context: context);

  @override
  Future<bool> delete() {
    return _$deleteAsyncAction.run(() => super.delete());
  }

  late final _$_CreateDebtsStoreBaseActionController =
      ActionController(name: '_CreateDebtsStoreBase', context: context);

  @override
  void setId(String value) {
    final _$actionInfo = _$_CreateDebtsStoreBaseActionController.startAction(
        name: '_CreateDebtsStoreBase.setId');
    try {
      return super.setId(value);
    } finally {
      _$_CreateDebtsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_CreateDebtsStoreBaseActionController.startAction(
        name: '_CreateDebtsStoreBase.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_CreateDebtsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValue(double value) {
    final _$actionInfo = _$_CreateDebtsStoreBaseActionController.startAction(
        name: '_CreateDebtsStoreBase.setValue');
    try {
      return super.setValue(value);
    } finally {
      _$_CreateDebtsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setParcels(String value) {
    final _$actionInfo = _$_CreateDebtsStoreBaseActionController.startAction(
        name: '_CreateDebtsStoreBase.setParcels');
    try {
      return super.setParcels(value);
    } finally {
      _$_CreateDebtsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsPaid(int value) {
    final _$actionInfo = _$_CreateDebtsStoreBaseActionController.startAction(
        name: '_CreateDebtsStoreBase.setIsPaid');
    try {
      return super.setIsPaid(value);
    } finally {
      _$_CreateDebtsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIdUser(String value) {
    final _$actionInfo = _$_CreateDebtsStoreBaseActionController.startAction(
        name: '_CreateDebtsStoreBase.setIdUser');
    try {
      return super.setIdUser(value);
    } finally {
      _$_CreateDebtsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIdCard(String value) {
    final _$actionInfo = _$_CreateDebtsStoreBaseActionController.startAction(
        name: '_CreateDebtsStoreBase.setIdCard');
    try {
      return super.setIdCard(value);
    } finally {
      _$_CreateDebtsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
description: ${description},
valueDebt: ${valueDebt},
parcels: ${parcels},
isPaid: ${isPaid},
idUser: ${idUser},
idCard: ${idCard},
valueTotal: ${valueTotal},
buttomLoading: ${buttomLoading}
    ''';
  }
}
