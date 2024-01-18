import 'package:d_luscious/core/constant/app_string.dart';
import 'package:d_luscious/core/constant/colors_const.dart';
import 'package:d_luscious/core/widgets/appbard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset(BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      // if (!mounted) return;
      Fluttertoast.showToast(msg: AppString.passwordLinkSendOnYourEmail);
      // showDialog(
      //     context: context,
      //     builder: (context) {
      //       return const AlertDialog(
      //         content: Text(AppString.passwordLinkSendOnYourEmail),
      //       );
      //     });
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      Fluttertoast.showToast(msg: e.message.toString());
      // showDialog(
      //     context: context,
      //     builder: (context) {
      //       return AlertDialog(
      //         content: Text(e.message.toString()),
      //       );
      //     });
    }
  }

  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.backButton(
        title: AppString.forgotPassword,
        context: context,
        whiteStatusBarText: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              AppString.forgotPasswordDes,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ConstColor.primaryColor),
                ),
                hintText: 'Email',
                fillColor: ConstColor.whiteColor,
                filled: true,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          MaterialButton(
            onPressed: () {
              passwordReset(context);
              FocusScope.of(context).requestFocus(FocusNode());
            },
            color: ConstColor.primaryColor,
            child: Text(
              AppString.forgotPassword,
              style: const TextStyle().copyWith(color: ConstColor.whiteColor),
            ),
          )
        ],
      ),
    );
  }
}
