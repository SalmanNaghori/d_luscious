import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_luscious/core/constant/colors_const.dart';
import 'package:d_luscious/core/widgets/appbard.dart';
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

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      log("Fetched Data: ${value.data()}");
      loggedInUser = UserModel.fromMap(value.data());
      log("User Model: ${loggedInUser.toString()}");
      setState(() {});
    }).catchError((error) {
      log("Error fetching user data: $error");
    });
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
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://placekitten.com/200/200', // Replace with user's profile image URL
              ),
            ),
            const SizedBox(height: 16),
            Text(
              loggedInUser.firstName ?? "", // Replace with user's name
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              loggedInUser.email ?? "", // Replace with user's email
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Bio: A passionate Flutter developer who loves creating awesome apps!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            const UserDetailsList(),
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
