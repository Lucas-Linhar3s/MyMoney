// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_cards_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListCardsStore on _ListCardsStoreBase, Store {
  late final _$cardsAtom =
      Atom(name: '_ListCardsStoreBase.cards', context: context);

  @override
  List<CardModel> get cards {
    _$cardsAtom.reportRead();
    return super.cards;
  }

  @override
  set cards(List<CardModel> value) {
    _$cardsAtom.reportWrite(value, super.cards, () {
      super.cards = value;
    });
  }

  late final _$idCardAtom =
      Atom(name: '_ListCardsStoreBase.idCard', context: context);

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

  late final _$cardsJsonAtom =
      Atom(name: '_ListCardsStoreBase.cardsJson', context: context);

  @override
  List<Map<String, dynamic>> get cardsJson {
    _$cardsJsonAtom.reportRead();
    return super.cardsJson;
  }

  @override
  set cardsJson(List<Map<String, dynamic>> value) {
    _$cardsJsonAtom.reportWrite(value, super.cardsJson, () {
      super.cardsJson = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_ListCardsStoreBase.loading', context: context);

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
      Atom(name: '_ListCardsStoreBase.proccess', context: context);

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
      Atom(name: '_ListCardsStoreBase.details', context: context);

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

  late final _$nameCardAtom =
      Atom(name: '_ListCardsStoreBase.nameCard', context: context);

  @override
  String get nameCard {
    _$nameCardAtom.reportRead();
    return super.nameCard;
  }

  @override
  set nameCard(String value) {
    _$nameCardAtom.reportWrite(value, super.nameCard, () {
      super.nameCard = value;
    });
  }

  late final _$getCardsAsyncAction =
      AsyncAction('_ListCardsStoreBase.getCards', context: context);

  @override
  Future<void> getCards() {
    return _$getCardsAsyncAction.run(() => super.getCards());
  }

  late final _$updateListAsyncAction =
      AsyncAction('_ListCardsStoreBase.updateList', context: context);

  @override
  Future<void> updateList(CardModel? data, int index, bool delete, bool edit) {
    return _$updateListAsyncAction
        .run(() => super.updateList(data, index, delete, edit));
  }

  late final _$getCardByNameAsyncAction =
      AsyncAction('_ListCardsStoreBase.getCardByName', context: context);

  @override
  Future<void> getCardByName(String name) {
    return _$getCardByNameAsyncAction.run(() => super.getCardByName(name));
  }

  @override
  String toString() {
    return '''
cards: ${cards},
idCard: ${idCard},
cardsJson: ${cardsJson},
loading: ${loading},
proccess: ${proccess},
details: ${details},
nameCard: ${nameCard}
    ''';
  }
}
