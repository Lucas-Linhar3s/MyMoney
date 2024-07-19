// ignore_for_file: use_build_context_synchronously

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:workspace/app/modules/cards/presenter/store/list_cards_store/list_cards_store.dart';
import 'package:workspace/app/modules/cards/presenter/store/modify_cards_store/modify_cards_store.dart';
import 'package:workspace/app/modules/debts/presenter/store/create_debts_store/create_debts_store.dart';
import 'package:workspace/app/shared/banner_messages/show_banner_messages.dart';
import 'package:workspace/app/shared/widgets/custom_text_form_field.dart';

class CustomModalCardsss {
  get(
    BuildContext context,
    String title,
    Widget? prefixIcon1,
    String? hintText1,
    String? labelText1,
    Widget? prefixIcon2,
    String? hintText2,
    String? labelText2,
    bool? edit,
    TextEditingController controller1,
    TextEditingController controller2,
    ModifyCardsStore modify,
    ListCardsStore listUsersStore,
    CreateDebtsStore? createDebtsStore,
    int index,
  ) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            child: Container(
                width: 400,
                height: 250,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 25),
                      child: Text(
                        title,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 25.0, right: 25),
                      child: Divider(),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextForm(
                      prefixIcon: prefixIcon1,
                      hintText: hintText1,
                      labelText: labelText1,
                      controller: controller1,
                      onChanged: (value) {
                        modify.setName(value);
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextForm(
                      keyboardType: TextInputType.phone,
                      prefixIcon: prefixIcon2,
                      hintText: hintText2,
                      labelText: labelText2,
                      controller: controller2,
                      onChanged: (value) {
                        modify.setLimite(value);
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        RealInputFormatter()
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(child: Observer(
                      builder: (_) {
                        return modify.buttomLoading
                            ? const SpinKitThreeInOut(
                                color: Color(0xFFF07848),
                                delay: Duration(milliseconds: 50),
                                // size: 40,
                                duration: Duration(milliseconds: 400),
                              )
                            : ElevatedButton(
                                onPressed: () async {
                                  modify.buttomLoading = true;
                                  if (edit == false) {
                                    Future.delayed(const Duration(seconds: 1),
                                        () async {
                                      // Criação
                                      final data = await modify.create();
                                      if (data.success == true) {
                                        listUsersStore.updateList(
                                            data.model!, 0, false, false);
                                        modify.buttomLoading = false;
                                        Navigator.pop(context);
                                        ShowBannerMessages()
                                            .success(context, "Cartão criado");
                                      } else {
                                        modify.buttomLoading = false;
                                        ShowBannerMessages().error(
                                            context, "Erro ao criar cartão");
                                      }
                                    });
                                  } else {
                                    Future.delayed(const Duration(seconds: 1),
                                        () async {
                                      // Atualização
                                      final data = await modify.update();
                                      if (data.success == true) {
                                        listUsersStore.updateList(
                                            data.model!, index, false, true);
                                        modify.buttomLoading = false;
                                        Navigator.pop(context);
                                        ShowBannerMessages().success(
                                            context, "Cartão atualizado");
                                      } else {
                                        modify.buttomLoading = false;
                                        ShowBannerMessages().error(context,
                                            "Erro ao atualizar cartão");
                                      }
                                    });
                                  }
                                },
                                style: const ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                        Color(0xFFF07848)),
                                    padding:
                                        WidgetStatePropertyAll(EdgeInsets.only(
                                      left: 70,
                                      right: 70,
                                    ))),
                                child: const Text("Salvar",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18)),
                              );
                      },
                    )),
                  ],
                )));
      },
    );
  }
}
