import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_luscious/core/constant/app_image.dart';
import 'package:d_luscious/core/constant/app_string.dart';
import 'package:d_luscious/core/constant/colors_const.dart';
import 'package:d_luscious/core/constant/const.dart';
import 'package:d_luscious/core/storage/shared_pref_utils.dart';
import 'package:d_luscious/core/utils/get_device_info.dart';
import 'package:d_luscious/core/widgets/appbard.dart';
import 'package:d_luscious/features/d_luscious.dart';
import 'package:d_luscious/features/dash_board/dash_board.dart';
import 'package:d_luscious/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'forgot_password_screen.dart';
import 'sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  UserModel loggedInUser = UserModel();

  // firebase
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ConstColor.primaryColor, width: 2.0),
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: AppString.email,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: true,
        validator: (value) {
          RegExp regex = RegExp(r'^.{6,}$');

          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
          return null;
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.vpn_key,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ConstColor.primaryColor, width: 2.0),
          ),
          //prefixIcon: const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: AppString.password,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: ConstColor.primaryColor,
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signIn(emailController.text, passwordController.text);

            // FocusScope.of(context).requestFocus(FocusNode());
          },
          child: const Text(
            AppString.login,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      appBar: CustomAppBar.blankAppBar(
        title: "",
        whiteStatusBarText: false,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                  SizedBox(
                    height: 200,
                    child: Image.asset(
                      ImageAsset.icLoginLogo,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 45),
                  emailField,
                  const SizedBox(height: 25),
                  passwordField,
                  const SizedBox(height: 35),
                  loginButton,
                  const SizedBox(height: 15),
                  const SizedBox(
                    height: 10,
                  ),
                  // reset password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ForgotPasswordScreen()));
                            },
                            child: const Text(
                              "Forgot Password",
                              style: TextStyle(
                                  color: Color(0xffF5A342),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                        ]),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  //SignUp button
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text("Don't have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegistrationScreen()));
                          },
                          child: const Text(
                            "SignUp",
                            style: TextStyle(
                                color: Color(0xffF5A342),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        )
                      ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // login function
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      EasyLoading.show();
      try {
        FocusScope.of(context).unfocus();
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);

        User? user = _auth.currentUser;
        var snapshot = await FirebaseFirestore.instance
            .collection("users")
            .doc(user?.email)
            .get();
        log("Fetched Data: ${snapshot.data()}");
        loggedInUser = UserModel.fromMap(snapshot.data());

        SharedPrefUtils.setUesrEmail(loggedInUser.email ?? "");
        SharedPrefUtils.setUserName(loggedInUser.firstName ?? "");

        // Get current device id and save it to Firestore
        final deviceId = await getDeviceId();
        final userDoc =
            FirebaseFirestore.instance.collection("users").doc(user?.email);

        if (snapshot.exists) {
          log("hellllllllloooooo snapshot.exists");
          // Update the specific field (id in this case)
          EasyLoading.dismiss();
          loggedInUser = UserModel.fromMap(snapshot.data()!);

          userDoc.update({"deviceId": deviceId});
        } else {
          EasyLoading.dismiss();
          // Handle the case where the document does not exist
          log("User document does not exist");
        }

        getAllDocumentIdsWithDelay();
        navigation();
        log("User:$email=========LoggedIn Successfully====");
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
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
            errorMessage = "${error.message}";
        }
        EasyLoading.dismiss();
        Fluttertoast.showToast(msg: errorMessage!);

        log(error.code);
      }
    } else {
      log("Form is not valid");
      Future.delayed(const Duration(seconds: 1), () {
        EasyLoading.dismiss();
      });
    }
  }

  Future<void> navigation() async {
    EasyLoading.dismiss();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const DashboardScreen()));
    Future.delayed(const Duration(milliseconds: 200), () {
      Fluttertoast.showToast(msg: "Login Successful");
    });
    //
    //    });
  }

  Future<void> getAllDocumentIdsWithDelay() async {
    await Future.delayed(Duration(seconds: 2)); // Adjust the duration as needed
    await getAllDocumentIds();
  }

  Future getAllDocumentIds() async {
    final user = _auth.currentUser;

    log('listening just started......');
    final collection = FirebaseFirestore.instance
        .collection('users')
        .doc(user?.email)
        .collection('favorites');

    final listener = collection.snapshots().listen((change) {
      if (change.docChanges.isNotEmpty) {
        log("Yes, it has data");
        List<String> updatedFavorites = List<String>.from(
            FavoriteDocId.favoriteDocId.value); // Convert to List<String>

        for (var change in change.docChanges) {
          if (updatedFavorites.contains(change.doc.id)) {
            // updatedFavorites.remove(change.doc.id);
          } else {
            updatedFavorites.add(change.doc.id);
          }

          log("Document ID: ${change.doc.id}");
        }

        FavoriteDocId.favoriteDocId.value = updatedFavorites;
      } else {
        log("ooooooo No data");
      }
    });

    listener.onDone(() {
      listener.cancel();
    });
  }
}
