// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/v4.dart';
import 'package:workspace/app/modules/cards/domain/model/card_model.dart';
import 'package:workspace/app/modules/cards/domain/usecases/usecase_cards_impl.dart';
import 'package:workspace/app/shared/exception/custom_exceptions.dart';

part 'modify_cards_store.g.dart';

class ModifyCardsStore = _ModifyCardsStoreBase with _$ModifyCardsStore;

class RetornoValue {
  bool? success;
  CardModel? model;
  RetornoValue({
    this.success,
    this.model,
  });
}

abstract class _ModifyCardsStoreBase with Store {
  final usecase = UsecaseCardsImpl();

  @observable
  String id = "";
  @observable
  String name = "";
  @observable
  String limit = "";
  @observable
  bool buttomLoading = false;

  @action
  void setId(String value) => id = value;
  @action
  void setName(String value) => name = value;
  @action
  void setLimite(String value) => limit = value;

  @action
  Future<RetornoValue> create() async {
    try {
      CardModel model = CardModel(
        // ignore: prefer_const_constructors
        id: UuidV4().generate(),
        name: name,
        limit: limit,
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
      CardModel model = CardModel(
        id: id,
        name: name,
        limit: limit,
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
