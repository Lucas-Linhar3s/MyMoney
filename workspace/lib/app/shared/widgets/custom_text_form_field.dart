// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextForm extends StatefulWidget {
  Widget? sufixIcon;
  String? hintText;
  String? labelText;
  Widget? prefixIcon;
  TextInputType? keyboardType;
  TextEditingController? controller;
  void Function(String)? onChanged;
  List<TextInputFormatter>? inputFormatters;
  CustomTextForm({
    super.key,
    this.sufixIcon,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.keyboardType,
    this.controller,
    this.onChanged,
    this.inputFormatters,
  });

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.sizeOf(context).width;
    return Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: TextFormField(
          inputFormatters: widget.inputFormatters,
          keyboardType: widget.keyboardType,
          textInputAction: TextInputAction.next,
          controller: widget.controller,
          onChanged: widget.onChanged,
          autofocus: false,
          decoration: InputDecoration(
            focusColor: const Color(0xFFF07848),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFF07848)),
              borderRadius: BorderRadius.circular(20),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            labelStyle: const TextStyle(color: Colors.black),
            alignLabelWithHint: true,
            suffixIcon: Padding(
              padding: const EdgeInsets.only(left: 10, right: 20),
              child: widget.sufixIcon,
            ),
            hintText: widget.hintText,
            label: Padding(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: Text('${widget.labelText}'),
            ),
            prefixIcon: widget.prefixIcon,
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                  // color: Colors.white,
                  // width: 2,
                  ),
            ),
          ),
        ));
  }
}
