// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, use_build_context_synchronously
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:workspace/app/modules/cards/presenter/store/list_cards_store/list_cards_store.dart';
import 'package:workspace/app/modules/cards/presenter/store/modify_cards_store/modify_cards_store.dart';
import 'package:workspace/app/modules/cards/presenter/ui/widgets/custom_modal_cards.dart';
import 'package:workspace/app/shared/banner_messages/show_banner_messages.dart';
import 'package:workspace/app/shared/widgets/custom_text_form_field.dart';

class CardListCards extends StatefulWidget {
  ListCardsStore listCardsStore;
  CardListCards({
    super.key,
    required this.listCardsStore,
  });

  @override
  State<CardListCards> createState() => _CardListCardsState();
}

class _CardListCardsState extends State<CardListCards> {
  final ModifyCardsStore _modifyUsersStore = ModifyCardsStore();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerLimit = TextEditingController();

  @override
  void initState() {
    widget.listCardsStore.getCards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Observer(
      builder: (_) {
        return Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: CustomTextForm(
                hintText: "Pesquisa por nome",
                labelText: "Pesquisar",
                onChanged: (value) {
                  widget.listCardsStore.getCardByName(value);
                },
                sufixIcon: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.search)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                  // height: 500,
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
                              "Cartões",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w600),
                            ),
                            ElevatedButton.icon(
                                style: const ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(Color(0xFFF07848)),
                                ),
                                label: const Text("NOVO",
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  _modifyUsersStore.buttomLoading = false;
                                  _controllerName.text = "";
                                  _controllerLimit.text = "";
                                  CustomModalCardsss().get(
                                    context,
                                    "Criar Cartão",
                                    const Icon(Icons.credit_card),
                                    "Insira o nome do cartão",
                                    "Nome",
                                    const Icon(Icons.numbers),
                                    "Insira o limite do cartão",
                                    "Limite",
                                    false,
                                    _controllerName,
                                    _controllerLimit,
                                    _modifyUsersStore,
                                    widget.listCardsStore,
                                    null,
                                    0,
                                  );
                                },
                                icon: const Icon(Icons.add,
                                    size: 25, color: Colors.white)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.only(left: 20, right: 20, bottom: 10),
                        child: Divider(),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Column(
                        children: widget.listCardsStore.loading
                            ? [
                                SizedBox(
                                  width: width,
                                  height: 400,
                                  child: Center(
                                    child: SpinKitCubeGrid(
                                      duration:
                                          const Duration(milliseconds: 1000),
                                      itemBuilder: (context, index) {
                                        return Container(
                                          height: 20,
                                          width: 20,
                                          color: const Color(0xFFF07848),
                                        );
                                      },
                                      size: 50,
                                    ),
                                  ),
                                )
                              ]
                            : widget.listCardsStore.cards.isEmpty
                                ? [
                                    Image.asset(
                                      'assets/images/no_content.jpg',
                                      alignment: Alignment.center,
                                      filterQuality: FilterQuality.high,
                                      fit: BoxFit.fill,
                                    ),
                                    const Text(
                                      "Nenhum cartão encontrado",
                                      style:
                                          TextStyle(color: Color(0xFF848484)),
                                    )
                                  ]
                                : List.generate(
                                    widget.listCardsStore.cards.length,
                                    (index) {
                                      return Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20, bottom: 16),
                                          child: Card(
                                            child: ListTile(
                                                title: Text(
                                                    widget.listCardsStore
                                                        .cards[index].name,
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        color:
                                                            Color(0xFF131313))),
                                                subtitle: Text(
                                                  r"R$ "
                                                  "${widget.listCardsStore.cards[index].limit}",
                                                  style: const TextStyle(
                                                      color: Color(0xFF848484)),
                                                ),
                                                enabled: true,
                                                onLongPress: () async {
                                                  _modifyUsersStore.setId(widget
                                                      .listCardsStore
                                                      .cards[index]
                                                      .id
                                                      .toString());
                                                  final success =
                                                      await _modifyUsersStore
                                                          .delete();
                                                  if (success) {
                                                    widget.listCardsStore
                                                        .updateList(null, index,
                                                            true, false);
                                                    ShowBannerMessages()
                                                        .success(context,
                                                            "Cartão deletado");
                                                  } else {
                                                    ShowBannerMessages().error(
                                                        context,
                                                        "Erro ao deletar cartão");
                                                  }
                                                },
                                                isThreeLine: false,
                                                leading: const Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 10.0),
                                                  child: CircleAvatar(
                                                    child: Icon(
                                                        Icons.credit_card,
                                                        color:
                                                            Color(0xFF848484),
                                                        size: 30),
                                                  ),
                                                ),
                                                trailing: IconButton(
                                                  onPressed: () {
                                                    _modifyUsersStore
                                                        .buttomLoading = false;
                                                    _modifyUsersStore.setId(
                                                        widget.listCardsStore
                                                            .cards[index].id!);
                                                    _modifyUsersStore.setName(
                                                        widget.listCardsStore
                                                            .cards[index].name);
                                                    _modifyUsersStore.setLimite(
                                                        widget
                                                            .listCardsStore
                                                            .cards[index]
                                                            .limit);
                                                    _controllerName.text =
                                                        widget.listCardsStore
                                                            .cards[index].name;
                                                    _controllerLimit.text =
                                                        widget.listCardsStore
                                                            .cards[index].limit;
                                                    CustomModalCardsss().get(
                                                        context,
                                                        "Atualizar Cartão",
                                                        const Icon(
                                                            Icons.credit_card),
                                                        "Insira o nome do cartão",
                                                        "Nome",
                                                        const Icon(
                                                            Icons.numbers),
                                                        "Insira o limite do cartão",
                                                        "Limite",
                                                        true,
                                                        _controllerName,
                                                        _controllerLimit,
                                                        _modifyUsersStore,
                                                        widget.listCardsStore,
                                                        null,
                                                        index);
                                                  },
                                                  icon: const Icon(Icons.edit,
                                                      size: 30,
                                                      color: Color.fromARGB(
                                                          255, 148, 137, 39)),
                                                )),
                                          ));
                                    },
                                  ),
                      ),
                    ],
                  ))),
            ),
          ],
        );
      },
    );
  }
}
