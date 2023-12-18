
import 'package:flutter/material.dart';

import '../../constance.dart';
import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.text,
      required this.hint,
      required this.validator, 
      required this.controller});
  final String text;
  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
            text: text,
            fontSize: 15,
            color: tilleColor,
            fontWeight: FontWeight.w700),
        TextFormField(
         controller:controller ,
          validator: validator,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
              fillColor: Colors.white),
        ),
      ],
    );
  }
}
