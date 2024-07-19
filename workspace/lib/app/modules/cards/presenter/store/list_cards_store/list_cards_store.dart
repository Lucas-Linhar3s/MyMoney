// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:workspace/app/modules/cards/domain/model/card_model.dart';
import 'package:workspace/app/modules/cards/domain/usecases/usecase_cards_impl.dart';
import 'package:workspace/app/shared/exception/custom_exceptions.dart';
part 'list_cards_store.g.dart';

class ListCardsStore = _ListCardsStoreBase with _$ListCardsStore;

abstract class _ListCardsStoreBase with Store {
  final usecase = UsecaseCardsImpl();

  @observable
  List<CardModel> cards = [];
  @observable
  String idCard = "";
  @observable
  List<Map<String, dynamic>> cardsJson = [];
  @observable
  bool loading = true;
  @observable
  bool proccess = true;
  @observable
  bool details = false;
  @observable
  String nameCard = "";

  @action
  Future<void> getCards() async {
    try {
      cards = await usecase.findAll();
      cardsJson = cards.map((e) => CardModel.toJson(e)).toList();
      loading = false;
    } on CustomExceptions catch (e) {
      if (kDebugMode) {
        print(e.logger);
      }
    }
  }

  @action
  Future<void> updateList(
      CardModel? data, int index, bool delete, bool edit) async {
    if (delete) {
      cardsJson.removeAt(index);
      cards = CardModel.fromJsonList(cardsJson);
    } else if (edit) {
      cardsJson[index] = {"id": data!.id, "name": data.name, "limite": "0.00"};
      cards = CardModel.fromJsonList(cardsJson);
    } else {
      cardsJson.add({"id": data!.id, "name": data.name, "limite": data.limit});
      cards = CardModel.fromJsonList(cardsJson);
    }
  }

  @action
  Future<void> getCardByName(String name) async {
    try {
      cards = await usecase.findByName(name);
      loading = false;
    } on CustomExceptions catch (e) {
      if (kDebugMode) {
        print(e.logger);
      }
    }
  }
}
