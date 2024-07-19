// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, use_build_context_synchronously
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:workspace/app/modules/users/presenter/store/list_users_store/list_users_store.dart';
import 'package:workspace/app/modules/users/presenter/store/modify_users_store/modify_users_store.dart';
import 'package:workspace/app/modules/users/presenter/ui/widgets/custom_modal.dart';
import 'package:workspace/app/shared/banner_messages/show_banner_messages.dart';
import 'package:workspace/app/shared/widgets/custom_text_form_field.dart';

class CardListUsers extends StatefulWidget {
  ListUsersStore listUsersStore;
  CardListUsers({
    super.key,
    required this.listUsersStore,
  });

  @override
  State<CardListUsers> createState() => _CardListUsersState();
}

class _CardListUsersState extends State<CardListUsers> {
  final ModifyUsersStore _modifyUsersStore = ModifyUsersStore();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  @override
  void initState() {
    widget.listUsersStore.getUsers();
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
                  widget.listUsersStore.getUserByName(value);
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
                              "Usuários",
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
                                  _controllerPhone.text = "";
                                  CustomModalUsers().get(
                                    context,
                                    "Criar Usuário",
                                    const Icon(Icons.person),
                                    "Insira o nome do Usuário",
                                    "Nome",
                                    const Icon(Icons.phone),
                                    "Insira o telefone",
                                    "Telefone",
                                    false,
                                    _controllerName,
                                    _controllerPhone,
                                    _modifyUsersStore,
                                    widget.listUsersStore,
                                    null,
                                    0,
                                  );
                                },
                                icon: const Icon(Icons.add,
                                    size: 25, color: Colors.white))
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
                        children: widget.listUsersStore.loading
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
                            : widget.listUsersStore.users.isEmpty
                                ? [
                                    Image.asset(
                                      'assets/images/no_content.jpg',
                                      alignment: Alignment.center,
                                      filterQuality: FilterQuality.high,
                                      fit: BoxFit.fill,
                                    ),
                                    const Text(
                                      "Nenhum usuário encontrado",
                                      style:
                                          TextStyle(color: Color(0xFF848484)),
                                    )
                                  ]
                                : List.generate(
                                    widget.listUsersStore.users.length,
                                    (index) {
                                      return Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20, bottom: 7),
                                          child: Card(
                                            child: ListTile(
                                                title: Text(
                                                    widget.listUsersStore
                                                        .users[index].name,
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        color:
                                                            Color(0xFF131313))),
                                                subtitle: Text(
                                                  widget
                                                              .listUsersStore
                                                              .users[index]
                                                              .phone
                                                              .length <
                                                          10
                                                      ? UtilBrasilFields
                                                          .obterTelefone(
                                                          "9999999999",
                                                        )
                                                      : widget.listUsersStore
                                                          .users[index].phone,
                                                  style: const TextStyle(
                                                      color: Color(0xFF848484)),
                                                ),
                                                enabled: true,
                                                onTap: () {
                                                  widget.listUsersStore
                                                      .details = true;
                                                  widget.listUsersStore.phone =
                                                      widget.listUsersStore
                                                              .idUser =
                                                          widget
                                                              .listUsersStore
                                                              .users[index]
                                                              .phone;
                                                  widget.listUsersStore.idUser =
                                                      widget.listUsersStore
                                                          .users[index].id
                                                          .toString();
                                                  widget.listUsersStore
                                                          .nameUsers =
                                                      widget.listUsersStore
                                                          .users[index].name
                                                          .toString();
                                                },
                                                onLongPress: () async {
                                                  _modifyUsersStore.setId(widget
                                                      .listUsersStore
                                                      .users[index]
                                                      .id
                                                      .toString());
                                                  final success =
                                                      await _modifyUsersStore
                                                          .delete();
                                                  if (success) {
                                                    widget.listUsersStore
                                                        .updateList(null, index,
                                                            true, false);
                                                    ShowBannerMessages().success(
                                                        context,
                                                        "Usuário deletado");
                                                  } else {
                                                    ShowBannerMessages().error(
                                                        context,
                                                        "Erro ao deletar usuário");
                                                  }
                                                },
                                                isThreeLine: false,
                                                leading: const Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 10.0),
                                                  child: CircleAvatar(
                                                    child: Icon(Icons.person,
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
                                                        widget.listUsersStore
                                                            .users[index].id!);
                                                    _modifyUsersStore.setName(
                                                        widget.listUsersStore
                                                            .users[index].name);
                                                    _modifyUsersStore.setPhone(
                                                        widget
                                                            .listUsersStore
                                                            .users[index]
                                                            .phone);
                                                    _controllerName.text =
                                                        widget.listUsersStore
                                                            .users[index].name;
                                                    _controllerPhone.text =
                                                        widget.listUsersStore
                                                            .users[index].phone;
                                                    CustomModalUsers().get(
                                                        context,
                                                        "Atualizar Usuário",
                                                        const Icon(
                                                            Icons.person),
                                                        "Insira o nome do Usuário",
                                                        "Nome",
                                                        const Icon(Icons.phone),
                                                        "Insira o telefone",
                                                        "Telefone",
                                                        true,
                                                        _controllerName,
                                                        _controllerPhone,
                                                        _modifyUsersStore,
                                                        widget.listUsersStore,
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
                      )
                    ],
                  ))),
            ),
          ],
        );
      },
    );
  }
}
