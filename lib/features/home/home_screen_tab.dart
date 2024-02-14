import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_luscious/core/constant/app_image.dart';
import 'package:d_luscious/core/constant/colors_const.dart';
import 'package:d_luscious/core/constant/const.dart';
import 'package:d_luscious/core/navigator/navigator.dart';
import 'package:d_luscious/core/storage/shared_pref_utils.dart';
import 'package:d_luscious/core/widgets/network_image.dart';
import 'package:d_luscious/features/Authenticate/login_screen.dart';
import 'package:d_luscious/features/Recipes/recipe_detail_screen.dart';
import 'package:d_luscious/features/d_luscious.dart';
import 'package:d_luscious/features/home/widget/commun_list_shimmer_widget.dart';
import 'package:d_luscious/features/home/widget/grid_view.dart';
import 'package:d_luscious/features/home/widget/listview_widget.dart';
import 'package:d_luscious/features/home/widget/selected_food_widget.dart';
import 'package:d_luscious/features/model/recipe_model.dart';
import 'package:d_luscious/features/model/selected_food.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  ValueNotifier<int> selectedFoodIndex = ValueNotifier<int>(0);

  //TODO: DOCID
  List<String> docId = [];

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
            FutureBuilder(
              future: getAllDocumentIds(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CommunListShimmerWidget(
                    fontSize: 18,
                    height: 120,
                    radius: 35,
                    title: "",
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return Column(
                    children: [
                      ListViewWidget(
                        selectedFood: (value) {
                          MyApp.logger.d("out side ${value}");
                          selectedFoodIndex.value = value;

                          // selectedFoodIndex.notifyListeners();
                        },
                        selectedId: docId[0],
                        id: docId,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: ValueListenableBuilder(
                            valueListenable: selectedFoodIndex,
                            builder: (context, selectedIndex, _) {
                              gridViewKey.currentState
                                  ?.refresh(docId[selectedIndex]);
                              // print(
                              //     "Selected index inside builder: $selectedIndex");
                              return GridViewWidget(
                                key: gridViewKey,
                                selectedId: docId[selectedIndex],
                              );
                            },
                          )),
                    ],
                  );
                }
              },
            ),
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

  // void _toggleBottomAppBarVisibility(bool isVisible) {
  //   setState(() {
  //     showBottomAppBar = isVisible;
  //   });
  // }

  void _gotoSelectedFoodDetailsScreen(
      BuildContext context, SelectedFood model) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecipeDetailScreen(
          title: model.title,
          id: model.id,
          imageUrl: model.imageUrl,
          ingredients: model.ingredients,
          instruction: model.instruction,
        ),
      ),
    );
  }

  Future getAllDocumentIds() async {
    DateTime startTime = DateTime.now();
    log("Fetching document IDs started at: $startTime");

    DateTime fetchDataStartTime = DateTime.now();
    log("Fetching data started at: $fetchDataStartTime");

    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await db.collection("recipeTypes").get();

    querySnapshot.docs.forEach((document) {
      // MyApp.logger.f("document.id========${document.id}");
      docId.add(document.id);
    });

    DateTime fetchDataEndTime = DateTime.now();
    log("Fetching data ended at: $fetchDataEndTime");
    log("Time taken to fetch data: ${fetchDataEndTime.difference(fetchDataStartTime)}");

    DateTime endTime = DateTime.now();
    log("Fetching document IDs ended at: $endTime");
    log("Total time taken: ${endTime.difference(startTime)}");
  }
}
