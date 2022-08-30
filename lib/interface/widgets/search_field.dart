import 'package:flutter/material.dart';
import 'package:food_app/utils/color.dart';

class SearchField extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final TextInputType? type;
  final FocusNode? focus;
  final Function(String?)? onchanged;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  const SearchField({
    Key? key,
    required this.hintText,
    this.icon,
    this.onchanged,
    this.validator,
    required this.type,
    this.focus,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      controller: controller,
      textInputAction: TextInputAction.next,
      focusNode: focus,
      maxLines: null,
      onChanged: onchanged,
      cursorColor: Colors.black,
      keyboardType: type,
      autocorrect: false,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: lightBlackColor,
        ),
        hintText: hintText,
        errorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: redColor,
          ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: redColor,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: blackColor,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: primaryColor,
          ),
        ),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: blackColor,
          ),
        ),
      ),
    );
  }
}
