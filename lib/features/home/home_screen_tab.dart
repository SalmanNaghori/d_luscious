import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_luscious/core/constant/app_image.dart';
import 'package:d_luscious/core/constant/colors_const.dart';
import 'package:d_luscious/core/constant/const.dart';
import 'package:d_luscious/core/storage/shared_pref_utils.dart';
import 'package:d_luscious/core/utils/get_device_info.dart';
import 'package:d_luscious/features/Authenticate/login_screen.dart';
import 'package:d_luscious/features/d_luscious.dart';
import 'package:d_luscious/features/home/widget/circle_widget.dart';
import 'package:d_luscious/features/home/widget/selected_food_widget.dart';
import 'package:d_luscious/features/model/recipe_model.dart';
import 'package:d_luscious/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../data/menu_items.dart';
import '../model/menu_item.dart';

class HomeScreenTab extends StatefulWidget {
  const HomeScreenTab({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreenTab> createState() => _HomeScreenTabState();
}

class _HomeScreenTabState extends State<HomeScreenTab> {
  // late final PageController pageController;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<int> pageNo = ValueNotifier<int>(-1);
  Timer? carouselTimer;
  bool showBottomAppBar = true;
  List<RecipeType> recipeTypesList = [];
  List<Recipe> allRecipesList = [];
  final List<String> recipesList = [];
  List<Recipe> breakfastRecipes = [];
  List<Recipe> lunchRecipes = [];
  List<Recipe> dinnerRecipes = [];
  List<Recipe> dessertRecipes = [];
  UserModel loggedInUser = UserModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getAllDocumentIdsWithDelay();
    authListener();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColor.whiteColor,
      body: SingleChildScrollView(
        // controller: _scrollController,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 21, right: 21, top: 18.8, bottom: 20),
              child: ListTile(
                onTap: () {},
                selected: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
                selectedTileColor: ConstColor.primaryColor,
                title: Text(
                  "Welcome",
                  style: Theme.of(context).textTheme.titleMedium!.merge(
                        const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18.0,
                        ),
                      ),
                ),
                subtitle: Text(
                  "A Greet welcome to D'luscious.",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                trailing: PopupMenuButton<MenuItemabc>(
                  iconColor: ConstColor.whiteColor,
                  onSelected: (item) => _onSelected(context, item),
                  itemBuilder: (context) => [
                    ...MenuItems.itemsFirst.map(_buildItem).toList(),
                    const PopupMenuDivider(),
                    ...MenuItems.itemsSecond.map(_buildItem).toList(),
                  ],
                ),
              ),
            ),
            SelectedFoodWidget(
              controller: _scrollController,
              pageNo: pageNo,
            ),
            const SizedBox(height: 20),
            CircleWidget(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  PopupMenuItem<MenuItemabc> _buildItem(MenuItemabc item) =>
      PopupMenuItem<MenuItemabc>(
        value: item,
        child: Row(
          children: [
            Icon(item.icon, color: Colors.black, size: 20),
            const SizedBox(width: 12),
            Text(item.text),
          ],
        ),
      );

  void _onSelected(BuildContext context, MenuItemabc item) {
    switch (item) {
      case MenuItems.itemSignOut:
        _showLogoutDialog(context);
        break;
    }
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 6.0),
                child: Image.asset(
                  ImageAsset.icAlertMessage,
                  height: 20,
                  width: 20,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Log Out'),
              ),
            ],
          ),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                EasyLoading.show();
                Navigator.of(context).pop();
                Future.delayed(const Duration(milliseconds: 1000), () {
                  _logout();
                });
              },
              child: const Text('Yes'),
            )
          ],
        );
      },
    );
  }

  Future<void> _logout() async {
    try {
      EasyLoading.dismiss();
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (Route<dynamic> route) => false,
      );
      await SharedPrefUtils.setIsUserLoggedIn(false);
      await _auth.signOut();
    } catch (e) {
      EasyLoading.dismiss();
      log('Error during logout: $e');
    }
  }

  Future getAllDocumentIds() async {
    final user = _auth.currentUser;

    print('listening just started......');
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

  Future<void> getAllDocumentIdsWithDelay() async {
    // await Future.delayed(Duration(seconds: 2)); // Adjust the duration as needed
    await getAllDocumentIds();
  }

  Future<void> authListener() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final doc =
          FirebaseFirestore.instance.collection("users").doc(user?.email);

      await doc.get().then((snapshot) async {
        if (snapshot.exists) {
          loggedInUser = UserModel.fromMap(snapshot.data());
          // MyApp.logger.d("Before UserModel.fromMap: ${snapshot.data()}");
          loggedInUser = UserModel.fromMap(snapshot.data()!);
          // MyApp.logger.f("After UserModel.fromMap: $loggedInUser");
          log("Fetched data: ${snapshot.data()}");
          log("loggedInUser.deviceId: ${loggedInUser.deviceId}");
          // log("Fetched data: ${snapshot.data()}");
          // log("loggedInUser.deviceId: ${loggedInUser.deviceId}");

          // Check if the same id, if not the same, then logout and navigate to the login screen
          final deviceId = await getDeviceId();
          if (
              // loggedInUser.deviceId != null &&
              loggedInUser.deviceId != deviceId) {
            await logout(true);
          }
        }
      });
    } catch (e) {
      MyApp.logger.e("Error in authListener: $e");
    }
  }

  Future<void> logout(bool isShowSnackbar) async {
    await FirebaseAuth.instance.signOut();

    if (isShowSnackbar) {
      // ignore: use_build_context_synchronously
      showSnackbar(context, 'Your account logged in another device', false);
    }

    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      ),
    );
  }
}
