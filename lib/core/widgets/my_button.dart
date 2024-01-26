import 'package:flutter/material.dart';

import 'package:d_luscious/core/constant/colors_const.dart';

class MyButton extends StatelessWidget {
  final double? miniWidth;
  final double? height;
  final TextStyle? textStyle;
  final String title;
  final bool? loading;
  final Color? textColor;
  final double? cornerRadius;
  final Function onPressed;
  final double? radius;
  final Color? buttonColor;

  const MyButton({
    Key? key,
    this.miniWidth,
    this.height,
    this.textStyle,
    required this.title,
    this.loading,
    this.textColor,
    this.cornerRadius,
    this.radius,
    required this.onPressed,
    this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        onPressed();
      },
      child: Container(
        height: height ?? 60,
        width: miniWidth ?? double.infinity,
        // padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 10),
        decoration: BoxDecoration(
          color: buttonColor ?? ConstColor.primaryColor,
          borderRadius: BorderRadius.circular(radius ?? 32.00),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                color: textColor ?? Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
