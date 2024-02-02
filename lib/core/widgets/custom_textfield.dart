// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:d_luscious/core/constant/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  final List<TextInputFormatter>? inputFormatters;
  final double? height;
  final IconButton? suffixIcon;
  final String? title;
  final TextEditingController? textController;
  final Color? hintTextColor;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextInputType? inputType;
  final TextCapitalization textCapitalization;
  final int? maxLine, maxLength;
  final TextInputType? keyBoardType;
  final bool? obscureText;
  final ValueChanged? onChanged;
  final ValueChanged? onFieldSubmit;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final String? hintText;
  final Widget prefixIcon;
  final bool enable;

  const MyTextField(
      {Key? key,
      this.height,
      this.suffixIcon,
      this.title,
      required this.textController,
      this.hintTextColor,
      this.focusNode,
      this.textInputAction,
      this.inputType,
      this.textCapitalization = TextCapitalization.none,
      this.maxLength,
      this.obscureText,
      this.onChanged,
      this.onFieldSubmit,
      this.validator,
      this.hintText,
      required this.prefixIcon,
      this.enable = true,
      this.inputFormatters,
      required this.keyBoardType,
      this.onSaved,
      this.maxLine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        color: Colors.grey.shade50,
        border: Border.all(
          color: Colors.grey.shade50,
        ),
      ),
      child: Center(
        child: TextFormField(
          autofocus: false,
          onChanged: onChanged,
          focusNode: focusNode,
          enabled: enable,
          textCapitalization: textCapitalization,
          textAlignVertical: TextAlignVertical.center,
          maxLines: maxLine,
          onFieldSubmitted: onFieldSubmit,
          controller: textController,
          inputFormatters: inputFormatters,
          validator: validator,
          // (value) {
          //   if (value!.isEmpty) {
          //     return ("Second Name cannot be Empty");
          //   }
          //   return null;
          // },
          onSaved: onSaved,

          textInputAction: textInputAction,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            hintText: hintText,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: ConstColor.primaryColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
