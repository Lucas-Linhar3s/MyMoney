import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:workspace/app/modules/debts/presenter/store/create_debts_store/create_debts_store.dart';
import 'package:workspace/app/modules/debts/presenter/store/list_debts_store/list_debts_store.dart';
import 'package:workspace/app/shared/banner_messages/show_banner_messages.dart';
import 'package:workspace/app/shared/widgets/custom_text_form_field.dart';

class CustomBottomSheetDebts {
  get(
    BuildContext context,
    CreateDebtsStore create,
    ListDebtsStore list,
  ) {
    var width = MediaQuery.of(context).size.width;

    // var height = MediaQuery.of(context).size.height;
    return showModalBottomSheet(
        context: context,
        builder: (_) {
          return Container(
              width: width,
              height: 1000,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              clipBehavior: Clip.none,
              child: Observer(
                builder: (_) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: SingleChildScrollView(
                        child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Nova Transação",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextForm(
                          hintText: "Insira a descrição da transação",
                          labelText: "Descricão",
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Icon(Icons.description),
                          ),
                          onChanged: (value) {
                            create.setDescription(value);
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextForm(
                          hintText: "Insira o valor da transação",
                          labelText: "Valor",
                          keyboardType: TextInputType.number,
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Icon(Icons.attach_money),
                          ),
                          onChanged: (value) {
                            create.setValue(double.parse(value));
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextForm(
                          hintText: "Insira o numero de parcelas",
                          labelText: "Parcelas",
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Icon(Icons.numbers),
                          ),
                          onChanged: (value) {
                            create.setParcels(value);
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Text("Cartões:",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600))),
                        SizedBox(
                          width: width,
                          height: 70,
                          child: list.cards.isEmpty
                              // ignore: prefer_const_constructors
                              ? Center(
                                  child: const Text("Nenhum cartão encontrado"),
                                )
                              : ListView(
                                  scrollDirection: Axis.horizontal,
                                  clipBehavior: Clip.none,
                                  children:
                                      List.generate(list.cards.length, (index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(left: 14.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          if (list.selectCard == null) {
                                            list.selectCard = index;
                                            create.setIdCard(list
                                                .cards[index].id
                                                .toString());
                                          } else {
                                            list.selectCard = null;
                                            create.setIdCard("");
                                          }
                                        },
                                        child: Card(
                                          surfaceTintColor:
                                              const Color(0xFFF07848),
                                          shadowColor: Colors.transparent,
                                          color: Colors.transparent,
                                          clipBehavior: Clip.none,
                                          elevation:
                                              list.selectCard == index ? 10 : 0,
                                          child: Container(
                                            clipBehavior: Clip.none,
                                            width: 80,
                                            child: Column(
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor:
                                                      const Color.fromARGB(
                                                          77, 252, 233, 233),
                                                  child: Icon(
                                                    Icons.credit_card,
                                                    color:
                                                        list.selectCard == index
                                                            ? const Color(
                                                                0xFFF07848)
                                                            : null,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5),
                                                  child: Text(
                                                    list.cards[index].name,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        color:
                                                            list.selectCard ==
                                                                    index
                                                                ? const Color(
                                                                    0xFFF07848)
                                                                : null),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Text("Usuários:",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600))),
                        SizedBox(
                          width: width,
                          height: 70,
                          child: list.users.isEmpty
                              // ignore: prefer_const_constructors
                              ? Center(
                                  child:
                                      const Text("Nenhum usuário encontrado"),
                                )
                              : ListView(
                                  scrollDirection: Axis.horizontal,
                                  clipBehavior: Clip.none,
                                  children:
                                      List.generate(list.users.length, (index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(left: 14.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          if (list.selectUser == null) {
                                            list.selectUser = index;
                                            create.setIdUser(list
                                                .users[index].id
                                                .toString());
                                          } else {
                                            list.selectUser = null;
                                            create.setIdUser("");
                                          }
                                        },
                                        child: Card(
                                          surfaceTintColor:
                                              const Color(0xFFF07848),
                                          shadowColor: Colors.transparent,
                                          color: Colors.transparent,
                                          clipBehavior: Clip.none,
                                          elevation:
                                              list.selectUser == index ? 10 : 0,
                                          child: Container(
                                            clipBehavior: Clip.none,
                                            width: 80,
                                            child: Column(
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor:
                                                      const Color.fromARGB(
                                                          77, 252, 233, 233),
                                                  child: Icon(
                                                    Icons.person,
                                                    color:
                                                        list.selectUser == index
                                                            ? const Color(
                                                                0xFFF07848)
                                                            : null,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5),
                                                  child: Text(
                                                    list.users[index].name,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        color:
                                                            list.selectUser ==
                                                                    index
                                                                ? const Color(
                                                                    0xFFF07848)
                                                                : null),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        list.loading
                            ? const SpinKitThreeInOut(
                                color: Color(0xFFF07848),
                                delay: Duration(milliseconds: 50),
                                // size: 40,
                                duration: Duration(milliseconds: 400),
                              )
                            : ElevatedButton.icon(
                                style: const ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(Color(0xFFF07848)),
                                ),
                                label: const Text("SALVAR",
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () async {
                                  list.loading = true;
                                  final data = await create.create();
                                  Future.delayed(const Duration(seconds: 1),
                                      () async {
                                    // Criação
                                    if (data.success == true) {
                                      list.updateList(
                                          data.model!, 0, false, false, false);
                                      list.loading = false;
                                      Navigator.pop(context);
                                      ShowBannerMessages().success(
                                          context, "Transação criada");
                                    } else {
                                      list.loading = false;
                                      ShowBannerMessages().error(
                                          context, "Erro ao criar transação");
                                    }
                                  });
                                },
                                icon: const Icon(Icons.add,
                                    size: 25, color: Colors.white)),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    )),
                  );
                },
              ));
        });
  }
}
