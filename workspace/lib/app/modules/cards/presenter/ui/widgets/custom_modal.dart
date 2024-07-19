import 'package:flutter/material.dart';
import 'package:workspace/app/shared/widgets/custom_text_form_field.dart';

class CustomModalCards {
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
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextForm(
                prefixIcon: prefixIcon2,
                hintText: hintText2,
                labelText: labelText2,
                controller: controller2,
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {},
                  style: const ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Color(0xFFF07848)),
                      padding: WidgetStatePropertyAll(EdgeInsets.only(
                        left: 70,
                        right: 70,
                      ))),
                  child: const Text("Salvar",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),
            ],
          ),
        ));
      },
    );
  }
}
