import 'package:d_luscious/core/constant/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends AppBar {
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
    double elevation = 0,
  }) : super(
            elevation: elevation,
            toolbarHeight: height,
            backgroundColor: backgroundColor ?? Colors.white,
            systemOverlayStyle: systemUiOverlayStyle ??
                ((whiteStatusBarText)
                    ? SystemUiOverlayStyle.light
                        .copyWith(statusBarColor: Colors.transparent)
                    : SystemUiOverlayStyle.dark
                        .copyWith(statusBarColor: Colors.transparent)),
            title: Text(title,
                style: textStyle ??
                    const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      //make underline
                      decorationStyle:
                          TextDecorationStyle.double, //double underline
                      //text decoration 'underline' color
                      decorationThickness: 1.5,
                    )));

  CustomAppBar.backButton({
    super.key,
    required String title,
    required BuildContext context,
    bool whiteStatusBarText = false,
    bool super.centerTitle = true,
    double elevation = 0,
    SystemUiOverlayStyle? systemUiOverlayStyle,
    Color? backgroundColor,
    bool showLeading = true,
    // super.automaticallyImplyLeading = false,
    TextStyle? textStyle,
    Function? backPress,
  }) : super(
            leading: Visibility(
              visible: showLeading,
              child: InkWell(
                  child: const Padding(
                    padding: EdgeInsets.only(left: 9),
                    child: Icon(
                      Icons.arrow_back,
                      color: ConstColor.blakColor,
                    ),
                  ),
                  onTap: () {
                    if (backPress != null) {
                      backPress();
                      return;
                    }
                    Navigator.pop(context);
                  }),
            ),
            elevation: elevation,
            backgroundColor: backgroundColor ?? Colors.white,
            systemOverlayStyle: systemUiOverlayStyle ??
                ((whiteStatusBarText)
                    ? SystemUiOverlayStyle.light
                        .copyWith(statusBarColor: Colors.transparent)
                    : SystemUiOverlayStyle.dark
                        .copyWith(statusBarColor: Colors.transparent)),
            title: Text(title,
                style: textStyle ??
                    const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: ConstColor.blakColor,
                      //make underline
                      decorationStyle:
                          TextDecorationStyle.double, //double underline
                      //text decoration 'underline' color
                      decorationThickness: 1.5,
                    )));
}
