import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends AppBar {
  CustomAppBar.blankAppbar(
      {double? height,
        SystemUiOverlayStyle? systemUiOverlayStyle,
        Color? backgroundColor,
        bool whiteStatusBarText = false,
        super.key})
      : super(
    systemOverlayStyle: systemUiOverlayStyle ??
        ((whiteStatusBarText)
            ? SystemUiOverlayStyle.light
            .copyWith(statusBarColor: Colors.transparent)
            : SystemUiOverlayStyle.dark
            .copyWith(statusBarColor: Colors.transparent)),
    toolbarHeight: height ?? 0,
    automaticallyImplyLeading: false,
    elevation: 0,
    centerTitle: true,
    backgroundColor: backgroundColor ?? Colors.transparent,
  );

  CustomAppBar.blankAppBar({
    super.key,
    required String title,
    double? height,
    bool whiteStatusBarText = false,
    bool super.centerTitle = true,
    SystemUiOverlayStyle? systemUiOverlayStyle,
    Color? backgroundColor,
    // super.automaticallyImplyLeading = false,
    TextStyle? textStyle,
  }) : super(
          backgroundColor: backgroundColor ?? Colors.white,
      systemOverlayStyle: systemUiOverlayStyle ??
          ((whiteStatusBarText)
              ? SystemUiOverlayStyle.light
              .copyWith(statusBarColor: Colors.transparent)
              : SystemUiOverlayStyle.dark
              .copyWith(statusBarColor: Colors.transparent)),
      title: Text(title, style: textStyle ?? TextStyle( fontWeight: FontWeight.bold,
        fontSize: 30,
        //make underline
        decorationStyle: TextDecorationStyle.double, //double underline
        //text decoration 'underline' color
        decorationThickness: 1.5,))

        );
}
