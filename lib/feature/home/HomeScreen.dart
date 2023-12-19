import 'dart:async';

import 'package:d_luscious/core/constant/const.dart';
import 'package:d_luscious/feature/home/widget/recipe_item_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../Authenticate/LoginScreen.dart';
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
  late final PageController pageController;

  final ScrollController _scrollController = ScrollController();
  int pageNo = 0;

  final List<String> listImages = [
    "https://media.istockphoto.com/id/1408284950/photo/gulab-jamun-with-nuts-served-in-a-dish-isolated-on-napkin-side-view-on-dark-background-indian.jpg?b=1&s=170667a&w=0&k=20&c=JZ5cOreQ3eVfg3nsujNiWTfflLw-M3BvHSygip-lalE=",
    "https://as1.ftcdn.net/v2/jpg/01/95/70/12/1000_F_195701243_4uXJILIWRX6B6GUy4t9HQZt6HomkZbzT.jpg",
    "https://t3.ftcdn.net/jpg/02/54/45/12/240_F_254451278_7AAYmhYkBEVQ9MYnZYIomTI5WdFCif1g.jpg",
    "https://images.unsplash.com/photo-1602833280958-1657662ccc58?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80",
    "https://t4.ftcdn.net/jpg/03/08/40/45/240_F_308404590_cKgzFkCSG93RG6ycBbQknhpr0y7pwmzP.jpg"
  ];
  Timer? carasouelTimer;

  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageNo == 4) {
        pageNo = 0;
      }
      if (pageController.hasClients) {
        pageController.animateToPage(
          pageNo,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOutCirc,
        );
      }
      pageNo++;
    });
  }

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.85);
    carasouelTimer = getTimer();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        showBtmAppBr = false;
        setState(() {});
      } else {
        showBtmAppBr = true;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  bool showBtmAppBr = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //logout alertbox fuunction
  void showAlert(BuildContext context) {
    showAlertDialog(BuildContext context) {
      // set up the buttons
      Widget cancelButton = TextButton(
        child: Text("Cancel"),
        onPressed: () async {
          Navigator.pop(context);
        },
      );
      Widget continueButton = TextButton(
        child: Text("Yes"),
        onPressed: () async {
          Navigator.pop(context);
          await _auth.signOut();
        },
      );
      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 6.0),
              child: Image.network(
                "https://cdn-icons-png.flaticon.com/512/1008/1008928.png",
                height: 20,
                width: 20,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Sign Out'),
            ),
          ],
        ),
        content: Text("Would you like to Logout?"),
        actions: [
          cancelButton,
          continueButton,
        ],
      );
      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 21, right: 21, top: 18.8, bottom: 20),
              child: ListTile(
                onTap: () {},
                selected: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                ),
                selectedTileColor: Color(0xffF5A342),
                title: Text(
                  "Welcome",
                  style: Theme.of(context).textTheme.subtitle1!.merge(
                        const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18.0,
                        ),
                      ),
                ),
                subtitle: Text(
                  "A Greet welcome to D'luscious.",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                trailing: PopupMenuButton<MenuItemabc>(
                  onSelected: (item) => onSelected(context, item),
                  itemBuilder: (context) => [
                    ...MenuItems.itemsFirst.map(buildItem).toList(),
                    PopupMenuDivider(),
                    ...MenuItems.itemsSecond.map(buildItem).toList(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (index) {
                  pageNo = index;
                  setState(() {});
                },
                itemBuilder: (_, index) {
                  return AnimatedBuilder(
                    animation: pageController,
                    builder: (ctx, child) {
                      return child!;
                    },
                    child: GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Hello you tapped at ${index + 1} "),
                          ),
                        );
                      },
                      onPanDown: (d) {
                        carasouelTimer?.cancel();
                        carasouelTimer = null;
                      },
                      onPanCancel: () {
                        carasouelTimer = getTimer();
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(listImages[index]),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 5,
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.all(2.0),
                    child: Icon(
                      Icons.circle,
                      size: 12.0,
                      color: pageNo == index
                          ? Colors.indigoAccent
                          : Colors.grey.shade300,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: Const.recipeTypes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: RecipeItemWidget(
                      recipeModel: Const.recipeTypes[index],
                    ),
                  );
                }),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

//popmenu function
  PopupMenuItem<MenuItemabc> buildItem(MenuItemabc item) =>
      PopupMenuItem<MenuItemabc>(
        value: item,
        child: Row(
          children: [
            Icon(item.icon, color: Colors.black, size: 20),
            const SizedBox(
              width: 12,
            ),
            Text(item.text),
          ],
        ),
      );

  //onselected method for select in popup menu
  onSelected(BuildContext context, MenuItemabc item) {
    switch (item) {
      case MenuItems.itemSignOut:
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 6.0),
                    child: Image.network(
                      "https://cdn-icons-png.flaticon.com/512/1008/1008928.png",
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
              content: Text('Are you sure you want to log out?'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text('No')),
                TextButton(
                    onPressed: () async {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                          (route) => false);
                      await _auth.signOut();
                    },
                    child: Text('Yes'))
              ],
            );
          },
        );
        break;
    }
  }
}
