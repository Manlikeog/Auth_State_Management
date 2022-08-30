import 'package:flutter/material.dart';

import 'package:food_app/utils/color.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final String labelText;

  final TextInputType? type;

  final Function(String?)? onchanged;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  const InputField({
    Key? key,
    required this.hintText,
    required this.labelText,
    this.onchanged,
    this.validator,
    required this.type,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      controller: controller,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
      validator: validator,
      maxLines: null,
      onChanged: onchanged,
      cursorColor: Colors.black,
      keyboardType: type,
      autocorrect: false,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: redColor,
          ),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: redColor,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: blackColor,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: primaryColor,
          ),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: blackColor,
          ),
        ),
      ),
    );
  }
}
