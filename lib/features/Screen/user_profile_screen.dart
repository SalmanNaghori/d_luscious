import 'dart:developer';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_luscious/core/constant/colors_const.dart';
import 'package:d_luscious/core/data/add_data.dart';
import 'package:d_luscious/core/storage/shared_pref_utils.dart';
import 'package:d_luscious/core/widgets/appbard.dart';
import 'package:d_luscious/core/widgets/profile_image.dart';
import 'package:d_luscious/features/d_luscious.dart';
import 'package:d_luscious/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../core/constant/app_string.dart';

class UserProfileScreenTab extends StatefulWidget {
  const UserProfileScreenTab({Key? key}) : super(key: key);

  @override
  State<UserProfileScreenTab> createState() => _UserProfileScreenTabState();
}

class _UserProfileScreenTabState extends State<UserProfileScreenTab> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  ValueNotifier<bool> isValuechanged = ValueNotifier<bool>(false);
  Uint8List? image;

  @override
  void initState() {
    super.initState();
    // RecipeService.storeRecipes();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var snapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .get();
      log("Fetched Data: ${snapshot.data()}");
      loggedInUser = UserModel.fromMap(snapshot.data());
      isValuechanged.value = !isValuechanged.value;
      log("User Model: ${loggedInUser.toString()}");
    } on FirebaseException catch (error) {
      MyApp.logger.e("Error fetching user data: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColor.whiteColor,
      appBar: CustomAppBar.blankAppBar(title: AppString.profile),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ValueListenableBuilder(
                valueListenable: isValuechanged,
                builder: (context, isImageAvailable, _) {
                  return Center(
                      child: ProfileImage(
                    selectedFile: () {},
                    profilePictureUrl: loggedInUser.image,
                  ));
                }),
            const SizedBox(height: 16),
            Text(
              SharedPrefUtils.getUserName(), // Replace with user's name
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              SharedPrefUtils.getUesrEmail(), // Replace with user's email
              style: const TextStyle(
                fontSize: 16,
                color: ConstColor.greyColor,
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class UserDetailsList extends StatelessWidget {
  const UserDetailsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DetailItem('Location', 'New York, USA'),
        DetailItem('Joined', 'January 2022'),
        DetailItem('Phone', '+1 (555) 123-4567'),
      ],
    );
  }
}

class DetailItem extends StatelessWidget {
  final String label;
  final String value;

  const DetailItem(this.label, this.value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
