// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/v4.dart';
import 'package:workspace/app/modules/debts/domain/model/debts_model.dart';
import 'package:workspace/app/modules/debts/domain/usecases/usecase_debts_impl.dart';
import 'package:workspace/app/shared/exception/custom_exceptions.dart';
part 'create_debts_store.g.dart';

class RetornoValue {
  bool? success;
  DebtsModel? model;
  RetornoValue({
    this.success,
    this.model,
  });
}

class CreateDebtsStore = _CreateDebtsStoreBase with _$CreateDebtsStore;

abstract class _CreateDebtsStoreBase with Store {
  final usecase = UsecaseDebtsImpl();

  @observable
  String id = "";
  @observable
  String description = "";
  @observable
  double valueDebt = 0.0;
  @observable
  String parcels = "";
  @observable
  int isPaid = 0;
  @observable
  String idUser = "";
  @observable
  String idCard = "";
  @observable
  double valueTotal = 0.0;
  @observable
  bool buttomLoading = false;

  @action
  void setId(String value) => id = value;
  @action
  void setDescription(String value) => description = value;
  @action
  void setValue(double value) => valueDebt = value;
  @action
  void setParcels(String value) => parcels = value;
  @action
  void setIsPaid(int value) => isPaid = value;
  @action
  void setIdUser(String value) => idUser = value;
  @action
  void setIdCard(String value) => idCard = value;

  @action
  Future<RetornoValue> create() async {
    try {
      DebtsModel model = DebtsModel(
        // ignore: prefer_const_constructors
        id: UuidV4().generate(),
        description: description,
        id_card: idCard,
        id_user: idUser,
        is_paid: isPaid,
        parcels: parcels,
        value: valueDebt,
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
      DebtsModel model = DebtsModel(
        id: id,
        description: description,
        id_card: idCard,
        id_user: idUser,
        is_paid: isPaid,
        parcels: parcels,
        value: valueDebt,
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
  Future<RetornoValue> updateParcels() async {
    try {
      DebtsModel model = DebtsModel(
        id: id,
        description: description,
        id_card: idCard,
        id_user: idUser,
        is_paid: isPaid,
        parcels: parcels,
        value: valueDebt,
      );
      if (await usecase.updateParcels(model)) {
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
