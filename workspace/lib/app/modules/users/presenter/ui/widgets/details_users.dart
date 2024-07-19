// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:workspace/app/modules/cards/presenter/store/list_cards_store/list_cards_store.dart';
import 'package:workspace/app/modules/debts/presenter/store/create_debts_store/create_debts_store.dart';
import 'package:workspace/app/modules/debts/presenter/store/list_debts_store/list_debts_store.dart';
import 'package:workspace/app/modules/users/presenter/store/list_users_store/list_users_store.dart';
import 'package:workspace/app/modules/users/presenter/ui/widgets/show_filter.dart';
import 'package:workspace/app/shared/banner_messages/show_banner_messages.dart';

// ignore: must_be_immutable
class DetailsUsers extends StatefulWidget {
  String idUser;
  String name;
  String phone;
  ListUsersStore listUsersStore;
  DetailsUsers({
    super.key,
    required this.idUser,
    required this.name,
    required this.phone,
    required this.listUsersStore,
  });

  @override
  State<DetailsUsers> createState() => _DetailsUsersState();
}

class _DetailsUsersState extends State<DetailsUsers> {
  TextEditingController controllerParcels = TextEditingController();
  ListDebtsStore listDebtsStore = ListDebtsStore();
  CreateDebtsStore createDebtsStore = CreateDebtsStore();
  ListCardsStore listCardsStore = ListCardsStore();

  @override
  void initState() {
    listCardsStore.getCards();
    listDebtsStore.getDebtsUsers(widget.idUser);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(children: [
      const SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Card(
          color: Colors.white,
          child: Padding(
              padding: const EdgeInsets.only(
                bottom: 10.0,
                top: 10,
              ),
              child: Observer(
                builder: (_) {
                  return ListTile(
                    title: Text(widget.name,
                        style: const TextStyle(
                            fontSize: 18, color: Color(0xFF848484))),
                    subtitle: Text(
                      UtilBrasilFields.obterReal(listDebtsStore.valueTotal),
                      style: const TextStyle(
                          color: Color(0xFF131313), fontSize: 18),
                    ),
                    leading: GestureDetector(
                      onTap: () {
                        widget.listUsersStore.details = false;
                      },
                      child: const CircleAvatar(
                        radius: 30,
                        child: Icon(Icons.person),
                      ),
                    ),
                    trailing: CircleAvatar(
                      child: IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () async {
                          final success = await listDebtsStore
                              .sendDebtsWhatsapp(widget.phone);
                          if (success) {
                            ShowBannerMessages().success(
                                context, "Redicionado para o WhatsApp");
                          } else {
                            ShowBannerMessages().error(context,
                                "Erro ao redicionar para o WhatsApp, tente novamente");
                          }
                        },
                      ),
                    ),
                  );
                },
              )),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Expanded(
          child: Container(
              width: width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Transações",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600),
                          ),
                          Observer(
                            builder: (_) {
                              return listDebtsStore.filter
                                  ? IconButton(
                                      onPressed: () {
                                        listDebtsStore
                                            .getDebtsUsers(widget.idUser);
                                        listDebtsStore.filter = false;
                                      },
                                      icon: const Icon(Icons.cancel_rounded,
                                          color: Colors.white),
                                      style: const ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                            Color(0xFFF07848)),
                                      ),
                                    )
                                  : IconButton(
                                      style: const ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                            Color(0xFFF07848)),
                                      ),
                                      onPressed: () {
                                        listCardsStore.getCards();
                                        ShowFilter().get(context,
                                            listCardsStore, listDebtsStore);
                                      },
                                      icon: const Icon(
                                          Icons.filter_alt_outlined,
                                          size: 25,
                                          color: Colors.white));
                            },
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                      child: Divider(),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Observer(
                      builder: (_) {
                        return Column(
                          children: listDebtsStore.debtsUsers.isEmpty
                              ? [
                                  Image.asset(
                                    'assets/images/no_content.jpg',
                                    alignment: Alignment.center,
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.fill,
                                  ),
                                  const Text(
                                    "Nenhum transação encontrado",
                                    style: TextStyle(color: Color(0xFF848484)),
                                  )
                                ]
                              : List.generate(
                                  listDebtsStore.debtsUsers.length,
                                  (index) {
                                    return Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20, bottom: 2),
                                        child: Card(
                                          color: listDebtsStore
                                                      .debtsUsers[index]
                                                      .is_paid ==
                                                  1
                                              ? null
                                              : Colors.white,
                                          elevation: 0,
                                          child: ListTile(
                                            title: listDebtsStore.edition ==
                                                    index
                                                ? SizedBox(
                                                    height: 45,
                                                    child: TextFormField(
                                                      controller:
                                                          controllerParcels,
                                                      onChanged: (value) {
                                                        createDebtsStore
                                                            .setParcels(value);
                                                      },
                                                      autofocus: false,
                                                      decoration:
                                                          InputDecoration(
                                                        focusColor: const Color(
                                                            0xFFF07848),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Color(
                                                                      0xFFF07848)),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                        labelStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .black),
                                                        alignLabelWithHint:
                                                            true,
                                                        hintText:
                                                            "Editar parcelas",
                                                        filled: true,
                                                        fillColor: Colors.white,
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : Text(
                                                    "${listDebtsStore.debtsUsers[index].description} - "
                                                    "${listDebtsStore.debtsUsers[index].parcels}",
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        color:
                                                            Color(0xFF131313))),
                                            subtitle: listDebtsStore.edition ==
                                                    index
                                                ? null
                                                : Text(
                                                    listDebtsStore
                                                            .debtsUsers[index]
                                                            .name_card ??
                                                        "null",
                                                    style: const TextStyle(
                                                        color:
                                                            Color(0xFF848484)),
                                                  ),
                                            enabled: true,
                                            onTap: () {
                                              if (listDebtsStore.edition ==
                                                  index) {
                                                listDebtsStore.edition = null;
                                              } else {
                                                listDebtsStore.edition = index;
                                              }
                                              controllerParcels.text =
                                                  listDebtsStore
                                                      .debtsUsers[index]
                                                      .parcels;
                                              createDebtsStore.setId(
                                                  listDebtsStore
                                                      .debtsUsers[index].id
                                                      .toString());
                                            },
                                            onLongPress: () async {
                                              createDebtsStore.setId(
                                                  listDebtsStore
                                                      .debtsUsers[index].id
                                                      .toString());
                                              final success =
                                                  await createDebtsStore
                                                      .delete();
                                              if (success) {
                                                listDebtsStore.updateList(null,
                                                    index, true, false, false);
                                                ShowBannerMessages().success(
                                                    context,
                                                    "Transação deletada");
                                              } else {
                                                ShowBannerMessages().error(
                                                    context,
                                                    "Erro ao deletar transação");
                                              }
                                            },
                                            leading: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10.0),
                                                child: Checkbox(
                                                  value: listDebtsStore
                                                              .debtsUsers[index]
                                                              .is_paid ==
                                                          1
                                                      ? true
                                                      : false,
                                                  onChanged: (value) async {
                                                    if (value == true) {
                                                      createDebtsStore
                                                          .setIsPaid(1);
                                                      createDebtsStore.setId(
                                                          listDebtsStore
                                                              .debtsUsers[index]
                                                              .id
                                                              .toString());
                                                    } else {
                                                      createDebtsStore
                                                          .setIsPaid(0);
                                                      createDebtsStore.setId(
                                                          listDebtsStore
                                                              .debtsUsers[index]
                                                              .id
                                                              .toString());
                                                    }

                                                    // Atualização
                                                    final data =
                                                        await createDebtsStore
                                                            .update();
                                                    if (data.success == true) {
                                                      listDebtsStore.updateList(
                                                        data.model!,
                                                        index,
                                                        false,
                                                        true,
                                                        false,
                                                      );
                                                      if (value == true) {
                                                        listDebtsStore
                                                                .valueTotal -=
                                                            listDebtsStore
                                                                .debtsUsers[
                                                                    index]
                                                                .value;
                                                        ShowBannerMessages()
                                                            .success(context,
                                                                "Transação paga");
                                                      } else {
                                                        listDebtsStore
                                                                .valueTotal +=
                                                            listDebtsStore
                                                                .debtsUsers[
                                                                    index]
                                                                .value;
                                                      }
                                                    } else {
                                                      ShowBannerMessages().error(
                                                          context,
                                                          "Erro ao pagar transação");
                                                    }
                                                  },
                                                )),
                                            trailing: listDebtsStore.edition ==
                                                    index
                                                ? IconButton(
                                                    onPressed: () async {
                                                      // Atualização
                                                      final data =
                                                          await createDebtsStore
                                                              .updateParcels();
                                                      if (data.success ==
                                                          true) {
                                                        listDebtsStore
                                                            .updateList(
                                                          data.model!,
                                                          index,
                                                          false,
                                                          true,
                                                          true,
                                                        );
                                                        listDebtsStore.edition =
                                                            null;
                                                        ShowBannerMessages()
                                                            .success(context,
                                                                "Transação editada");
                                                      } else {
                                                        ShowBannerMessages().error(
                                                            context,
                                                            "Erro ao editar transação");
                                                      }
                                                    },
                                                    icon: const Icon(
                                                      Icons.check,
                                                      color: Colors.green,
                                                    ))
                                                : Text(
                                                    "- "
                                                    "${UtilBrasilFields.obterReal(listDebtsStore.debtsUsers[index].value)}",
                                                    style: const TextStyle(
                                                        color:
                                                            Color(0xFF131313),
                                                        fontSize: 18,
                                                        decoration: null),
                                                  ),
                                          ),
                                        ));
                                  },
                                ),
                        );
                      },
                    )
                  ],
                ),
              )))
    ]);
  }
}
