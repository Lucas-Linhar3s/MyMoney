// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:workspace/app/modules/debts/domain/model/debts_model.dart';
import 'package:workspace/app/modules/debts/domain/usecases/usecase_debts_impl.dart';
import 'package:workspace/app/shared/exception/custom_exceptions.dart';
part 'list_debts_store.g.dart';

class ListDebtsStore = _ListDebtsStoreBase with _$ListDebtsStore;

abstract class _ListDebtsStoreBase with Store {
  final usecase = UsecaseDebtsImpl();

  @observable
  List<DebtsModel> debtsCards = [];
  @observable
  List<DebtsModel> debtsUsers = [];
  @observable
  List<Users> users = [];
  @observable
  List<Cards> cards = [];
  @observable
  List<Map<String, dynamic>> debtsJson = [];
  @observable
  bool loading = false;
  @observable
  int? selectUser;
  @observable
  int? selectCard;
  @observable
  int? edition;
  @observable
  double valueTotal = 0.00;
  @observable
  String nameUser = "Carregando...";
  @observable
  bool filter = false;

  @action
  Future<void> getUsers() async {
    try {
      users = await usecase.getUsers();
      loading = false;
    } on CustomExceptions catch (e) {
      if (kDebugMode) {
        print(e.logger);
      }
    }
  }

  @action
  Future<void> getCards() async {
    try {
      cards = await usecase.getCards();
      loading = false;
    } on CustomExceptions catch (e) {
      if (kDebugMode) {
        print(e.logger);
      }
    }
  }

  @action
  Future<void> getDebtsUsers(String idUser) async {
    try {
      valueTotal = 0.00;
      debtsUsers = await usecase.findByIDUsers(idUser);
      debtsJson = debtsUsers.map((e) => DebtsModel.toJson(e)).toList();
      for (var i = 0; i < debtsUsers.length; i++) {
        if (debtsUsers[i].is_paid == 0) {
          valueTotal += debtsUsers[i].value;
        }
      }

      loading = false;
    } on CustomExceptions catch (e) {
      if (kDebugMode) {
        print(e.logger);
      }
    }
  }

  @action
  Future<bool> sendDebtsWhatsapp(String phone) async {
    if (phone.isEmpty || phone.length < 14) {
      return false;
    }
    // Remove os caracteres especiais do número de telefone
    String cleanedNumber = phone.replaceAll(RegExp(r'[^\d]'), '');

    // Adiciona o código do país no início
    String formattedNumber = '+55$cleanedNumber';
    // final debts = debtsUsers
    //     .map((debt) => '${debt.description} - ${debt.value} / ${debt.parcels}')
    //     .join(', ');
    // final message = "Dividas: $debts";

    StringBuffer messageBuffer = StringBuffer();
    messageBuffer.write("*Dividas:*\n");
    double sum = 0.00;
    for (var debt in debtsUsers) {
      if (debt.is_paid == 0) {
        sum += debt.value;
        messageBuffer.write(
            '*Descrição:* ${debt.description}\n *Valor:* R\$ ${debt.value}\n *Parcelas:* ${debt.parcels}\n\n');
      }
    }
    messageBuffer.write("*Total:* R\$ ${sum.toStringAsFixed(2)}*");
    final encodeMessage = Uri.encodeComponent(messageBuffer.toString());
    if (messageBuffer.isEmpty || encodeMessage.isEmpty) {
      return false;
    }
    final url = "https://wa.me/$formattedNumber/?text=$encodeMessage";

    // final ress = await canLaunchUrl(Uri.parse(url));
    // if (await canLaunchUrlString(url)) {
    // return await launchUrlString(url, mode: LaunchMode.externalApplication);
    // } else {
    return await launchUrlString(url, mode: LaunchMode.externalApplication);

    // return false;
    // }
  }

  @action
  Future<void> updateList(
      DebtsModel? data, int index, bool delete, bool edit, bool parcels) async {
    if (delete) {
      valueTotal -= debtsUsers[index].value;
      debtsJson.removeAt(index);
      debtsUsers = DebtsModel.fromJsonList(debtsJson);
      if (debtsUsers.isEmpty) {
        valueTotal = 0.00;
      }
    } else if (edit) {
      if (parcels) {
        debtsJson[index]["parcels"] = data!.parcels;
      } else {
        debtsJson[index]["is_paid"] = data!.is_paid;
      }
      debtsUsers = DebtsModel.fromJsonList(debtsJson);
    } else {
      debtsJson.add({
        "id": data!.id,
        "description": data.description,
        "id_card": data.id_card,
        "id_user": data.id_user,
        "is_paid": data.is_paid,
        "parcels": data.parcels,
        "value": data.value,
      });
      debtsUsers = DebtsModel.fromJsonList(debtsJson);
    }
  }

  @action
  Future<void> getdebtsByCard(String idCard) async {
    try {
      valueTotal = 0.00;
      debtsUsers = await usecase.findByIDCards(idCard);
      // debtsJson = debtsCards.map((e) => DebtsModel.toJson(e)).toList();
      for (var i = 0; i < debtsUsers.length; i++) {
        if (debtsUsers[i].is_paid == 0) {
          valueTotal += debtsUsers[i].value;
        }
      }
      loading = false;
    } on CustomExceptions catch (e) {
      if (kDebugMode) {
        print(e.logger);
      }
    }
  }
}
