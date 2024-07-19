// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_debts_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListDebtsStore on _ListDebtsStoreBase, Store {
  late final _$debtsCardsAtom =
      Atom(name: '_ListDebtsStoreBase.debtsCards', context: context);

  @override
  List<DebtsModel> get debtsCards {
    _$debtsCardsAtom.reportRead();
    return super.debtsCards;
  }

  @override
  set debtsCards(List<DebtsModel> value) {
    _$debtsCardsAtom.reportWrite(value, super.debtsCards, () {
      super.debtsCards = value;
    });
  }

  late final _$debtsUsersAtom =
      Atom(name: '_ListDebtsStoreBase.debtsUsers', context: context);

  @override
  List<DebtsModel> get debtsUsers {
    _$debtsUsersAtom.reportRead();
    return super.debtsUsers;
  }

  @override
  set debtsUsers(List<DebtsModel> value) {
    _$debtsUsersAtom.reportWrite(value, super.debtsUsers, () {
      super.debtsUsers = value;
    });
  }

  late final _$usersAtom =
      Atom(name: '_ListDebtsStoreBase.users', context: context);

  @override
  List<Users> get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(List<Users> value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  late final _$cardsAtom =
      Atom(name: '_ListDebtsStoreBase.cards', context: context);

  @override
  List<Cards> get cards {
    _$cardsAtom.reportRead();
    return super.cards;
  }

  @override
  set cards(List<Cards> value) {
    _$cardsAtom.reportWrite(value, super.cards, () {
      super.cards = value;
    });
  }

  late final _$debtsJsonAtom =
      Atom(name: '_ListDebtsStoreBase.debtsJson', context: context);

  @override
  List<Map<String, dynamic>> get debtsJson {
    _$debtsJsonAtom.reportRead();
    return super.debtsJson;
  }

  @override
  set debtsJson(List<Map<String, dynamic>> value) {
    _$debtsJsonAtom.reportWrite(value, super.debtsJson, () {
      super.debtsJson = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_ListDebtsStoreBase.loading', context: context);

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

  late final _$selectUserAtom =
      Atom(name: '_ListDebtsStoreBase.selectUser', context: context);

  @override
  int? get selectUser {
    _$selectUserAtom.reportRead();
    return super.selectUser;
  }

  @override
  set selectUser(int? value) {
    _$selectUserAtom.reportWrite(value, super.selectUser, () {
      super.selectUser = value;
    });
  }

  late final _$selectCardAtom =
      Atom(name: '_ListDebtsStoreBase.selectCard', context: context);

  @override
  int? get selectCard {
    _$selectCardAtom.reportRead();
    return super.selectCard;
  }

  @override
  set selectCard(int? value) {
    _$selectCardAtom.reportWrite(value, super.selectCard, () {
      super.selectCard = value;
    });
  }

  late final _$editionAtom =
      Atom(name: '_ListDebtsStoreBase.edition', context: context);

  @override
  int? get edition {
    _$editionAtom.reportRead();
    return super.edition;
  }

  @override
  set edition(int? value) {
    _$editionAtom.reportWrite(value, super.edition, () {
      super.edition = value;
    });
  }

  late final _$valueTotalAtom =
      Atom(name: '_ListDebtsStoreBase.valueTotal', context: context);

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

  late final _$nameUserAtom =
      Atom(name: '_ListDebtsStoreBase.nameUser', context: context);

  @override
  String get nameUser {
    _$nameUserAtom.reportRead();
    return super.nameUser;
  }

  @override
  set nameUser(String value) {
    _$nameUserAtom.reportWrite(value, super.nameUser, () {
      super.nameUser = value;
    });
  }

  late final _$filterAtom =
      Atom(name: '_ListDebtsStoreBase.filter', context: context);

  @override
  bool get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(bool value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  late final _$getUsersAsyncAction =
      AsyncAction('_ListDebtsStoreBase.getUsers', context: context);

  @override
  Future<void> getUsers() {
    return _$getUsersAsyncAction.run(() => super.getUsers());
  }

  late final _$getCardsAsyncAction =
      AsyncAction('_ListDebtsStoreBase.getCards', context: context);

  @override
  Future<void> getCards() {
    return _$getCardsAsyncAction.run(() => super.getCards());
  }

  late final _$getDebtsUsersAsyncAction =
      AsyncAction('_ListDebtsStoreBase.getDebtsUsers', context: context);

  @override
  Future<void> getDebtsUsers(String idUser) {
    return _$getDebtsUsersAsyncAction.run(() => super.getDebtsUsers(idUser));
  }

  late final _$sendDebtsWhatsappAsyncAction =
      AsyncAction('_ListDebtsStoreBase.sendDebtsWhatsapp', context: context);

  @override
  Future<bool> sendDebtsWhatsapp(String phone) {
    return _$sendDebtsWhatsappAsyncAction
        .run(() => super.sendDebtsWhatsapp(phone));
  }

  late final _$updateListAsyncAction =
      AsyncAction('_ListDebtsStoreBase.updateList', context: context);

  @override
  Future<void> updateList(
      DebtsModel? data, int index, bool delete, bool edit, bool parcels) {
    return _$updateListAsyncAction
        .run(() => super.updateList(data, index, delete, edit, parcels));
  }

  late final _$getdebtsByCardAsyncAction =
      AsyncAction('_ListDebtsStoreBase.getdebtsByCard', context: context);

  @override
  Future<void> getdebtsByCard(String idCard) {
    return _$getdebtsByCardAsyncAction.run(() => super.getdebtsByCard(idCard));
  }

  @override
  String toString() {
    return '''
debtsCards: ${debtsCards},
debtsUsers: ${debtsUsers},
users: ${users},
cards: ${cards},
debtsJson: ${debtsJson},
loading: ${loading},
selectUser: ${selectUser},
selectCard: ${selectCard},
edition: ${edition},
valueTotal: ${valueTotal},
nameUser: ${nameUser},
filter: ${filter}
    ''';
  }
}
