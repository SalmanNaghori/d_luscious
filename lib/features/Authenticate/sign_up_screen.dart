import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_luscious/core/constant/app_string.dart';
import 'package:d_luscious/core/extension/extension.dart';
import 'package:d_luscious/core/navigator/navigator.dart';
import 'package:d_luscious/core/storage/shared_pref_utils.dart';
import 'package:d_luscious/core/widgets/appbard.dart';
import 'package:d_luscious/core/widgets/custom_textfield.dart';
import 'package:d_luscious/core/widgets/my_button.dart';
import 'package:d_luscious/core/widgets/profile_network_image.dart';
import 'package:d_luscious/features/Authenticate/login_screen.dart';
import 'package:d_luscious/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  //Todo:come from local storage
  String imagePath = "";

  //Todo:Taken from firebase storage
  String imageUrl = "";

  String? errorMessage;

  final _formKey = GlobalKey<FormState>();
  final firstNameEditingController = TextEditingController();
  final secondNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();
  File? filePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar.backButton(title: "", context: context),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // SizedBox(
                    //   height: 180,
                    //   child: Image.asset(
                    //     "assets/images/signup.png",
                    //     fit: BoxFit.contain,
                    //   ),
                    // ),
                    ProfileNetworkImage(selectedFile: (File? file) {
                      imagePath = file?.path ?? "";
                      filePath = file;

                      log(imagePath.toString());
                      log("=======file path======${filePath ?? ""}");
                    }),
                    const SizedBox(height: 20),
                    MyTextField(
                      textInputAction: TextInputAction.next,
                      hintText: AppString.firstName,
                      textController: firstNameEditingController,
                      prefixIcon: const Icon(Icons.account_circle_rounded),
                      keyBoardType: TextInputType.name,
                      // maxLine: 1,
                      // validator: (value) {
                      //   RegExp regex = RegExp(r'^.{3,}$');
                      //   if (value!.isEmpty) {
                      //     return ("First Name cannot be Empty");
                      //   }
                      //   if (!regex.hasMatch(value)) {
                      //     return ("Enter Valid name(Min. 3 Character)");
                      //   }
                      //   return null;
                      // },
                      onSaved: (value) {
                        firstNameEditingController.text = value!;
                      },
                    ),
                    const SizedBox(height: 20),
                    MyTextField(
                      onChanged: (value) {},
                      textInputAction: TextInputAction.next,
                      hintText: AppString.lastName,
                      textController: secondNameEditingController,
                      maxLength: 1,
                      prefixIcon: const Icon(Icons.account_circle_rounded),
                      keyBoardType: TextInputType.name,
                      maxLine: 1,
                      // validator: (value) {
                      //   RegExp regex = RegExp(r'^.{3,}$');
                      //   if (value!.isEmpty) {
                      //     return ("First Name cannot be Empty");
                      //   }
                      //   if (!regex.hasMatch(value)) {
                      //     return ("Enter Valid name(Min. 3 Character)");
                      //   }
                      //   return null;
                      // },
                    ),
                    const SizedBox(height: 20),
                    MyTextField(
                      onChanged: (value) {},
                      textInputAction: TextInputAction.next,
                      hintText: AppString.emailAddress,
                      textController: emailEditingController,
                      maxLength: 1,
                      prefixIcon: const Icon(Icons.email_rounded),
                      keyBoardType: TextInputType.name,
                      maxLine: 1,
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return ("Please Enter Your Email");
                      //   }
                      //   // reg expression for email validation
                      //   if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                      //       .hasMatch(value)) {
                      //     return ("Please Enter a valid email");
                      //   }
                      //   return null;
                      // },
                    ),
                    const SizedBox(height: 20),
                    MyTextField(
                      onChanged: (value) {},
                      textInputAction: TextInputAction.next,
                      hintText: AppString.password,
                      textController: passwordEditingController,
                      maxLength: 1,
                      prefixIcon: const Icon(Icons.vpn_key),
                      keyBoardType: TextInputType.name,
                      maxLine: 1,
                      // validator: (value) {
                      //   RegExp regex = RegExp(r'^.{6,}$');
                      //   if (value!.isEmpty) {
                      //     return ("Password is required for login");
                      //   }
                      //   if (!regex.hasMatch(value)) {
                      //     return ("Enter Valid Password(Min. 6 Character)");
                      //   }
                      //   return null;
                      // },
                    ),
                    const SizedBox(height: 20),
                    MyTextField(
                      onChanged: (value) {},
                      textInputAction: TextInputAction.next,
                      hintText: AppString.confirmPasswors,
                      textController: confirmPasswordEditingController,
                      maxLength: 1,
                      prefixIcon: const Icon(Icons.vpn_key),
                      keyBoardType: TextInputType.name,
                      maxLine: 1,
                      // validator: (value) {
                      //   if (confirmPasswordEditingController.text !=
                      //       passwordEditingController.text) {
                      //     return "Password don't match";
                      //   }
                      //   return null;
                      // },
                    ),
                    const SizedBox(height: 20),
                    MyButton(
                      onPressed: () {
                        validationCheck();
                      },
                      title: AppString.signUp,
                      radius: 32,
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Todo:SignUp  Function
  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      EasyLoading.show();
      try {
        await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await uploadTask();
        await postDetailsToFirestore();
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage =
                "Invalid email address format, please check and re-enter.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            log("=========${error.message}=========");
            log("=========${error.code}=========");
            errorMessage = "${error.message}";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        EasyLoading.dismiss();
        if (kDebugMode) {
          print(error.code);
        }
      }
    } else {
      EasyLoading.dismiss();
    }
  }

  //Todo:Upload image in firestore
  uploadTask() async {
    UploadTask uploadTask = FirebaseStorage.instance
        .ref("profile pic")
        .child(
            "users/profile/${firstNameEditingController.text.toString()}.jpg")
        .putFile(filePath!);
    TaskSnapshot taskSnapshot = await uploadTask;
    imageUrl = await taskSnapshot.ref.getDownloadURL();
  }

  //Todo:SignUp Complete Function
  Future<void> postDetailsToFirestore() async {
    if (kDebugMode) {
      print("Posting to Firestore");
    }
    try {
      if (kDebugMode) {
        print("Posting to Firestore");
      }
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      User? user = _auth.currentUser;

      if (user == null) {
        Fluttertoast.showToast(msg: "User not found");
        return;
      }
      UserModel userModel = UserModel();

      // writing all the values
      userModel.email = user.email;
      userModel.uid = user.uid;
      userModel.firstName = firstNameEditingController.text;
      userModel.secondName = secondNameEditingController.text;
      userModel.image = imageUrl;
      SharedPrefUtils.setUesrEmail(user.email.toString());
      SharedPrefUtils.setUserName(firstNameEditingController.text.toString());
      await firebaseFirestore
          .collection("users")
          .doc(user.email)
          .set(userModel.toMap());

      Fluttertoast.showToast(msg: "Account created successfully :)");
      if (!mounted) return;
      EasyLoading.dismiss();
      navigation();
    } catch (e) {
      EasyLoading.dismiss();
      if (kDebugMode) {
        print("Error: ============================$e");
      }

      log("hello============================$e");
      Fluttertoast.showToast(msg: "Error: $e");
      Fluttertoast.showToast(msg: "Error: ${e.toString()}");
      log("hello============================$e");
    }
  }

  //Todo: Validiation
  void validationCheck() {
    if (imagePath.isEmpty) {
      Fluttertoast.showToast(msg: "Select an image");
    } else if (firstNameEditingController.text.trim().isEmpty) {
      Fluttertoast.showToast(msg: "Enter your first name");
    } else if (secondNameEditingController.text.trim().isEmpty) {
      Fluttertoast.showToast(msg: "Enter your last name");
    } else if (emailEditingController.text.trim().isEmpty) {
      Fluttertoast.showToast(msg: "Enter your email address");
    } else if (emailEditingController.text.trim().isValidEmail()) {
      log(emailEditingController.text);
      Fluttertoast.showToast(msg: "Enter a valid email address");
    } else if (passwordEditingController.text.trim().isEmpty) {
      Fluttertoast.showToast(msg: "Enter your password");
    } else if (confirmPasswordEditingController.text.trim().isEmpty) {
      Fluttertoast.showToast(msg: "Confirm your password");
    } else if (passwordEditingController.text !=
        confirmPasswordEditingController.text) {
      Fluttertoast.showToast(msg: "Passwords don't match");
    } else {
      signUp(emailEditingController.text, passwordEditingController.text);
    }
  }

//Todo:Navigation
  Future<void> navigation() async {
    Navigator.pushAndRemoveUntil(
      GlobalVariable.appContext,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
  }
}
