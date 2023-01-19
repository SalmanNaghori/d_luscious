import 'dart:async';
import 'dart:math';

import 'package:d_luscious/Authenticate/LoginScreen.dart';
import 'package:d_luscious/Recipes/Pannertikkakabab.dart';
import 'package:d_luscious/Recipes/Tacos.dart';
import 'package:d_luscious/Recipes/cucumberraita.dart';
import 'package:d_luscious/Recipes/springrolls.dart';
import 'package:d_luscious/Recipes/veghakkanoodles.dart';
import 'package:d_luscious/Recipes/whitesaucepasta.dart';
import 'package:d_luscious/Screen/CategoryScreen.dart';
import 'package:d_luscious/Screen/Favorite.dart';
import 'package:d_luscious/Screen/SearchScreen.dart';
import 'package:d_luscious/data/menu_items.dart';
import 'package:d_luscious/model/menu_item.dart';
import 'package:d_luscious/search_model/model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final PageController pageController;

  ScrollController _scrollController = ScrollController();
  int pageNo = 0;

  List<String> listImages = [
    "https://media.istockphoto.com/id/1408284950/photo/gulab-jamun-with-nuts-served-in-a-dish-isolated-on-napkin-side-view-on-dark-background-indian.jpg?b=1&s=170667a&w=0&k=20&c=JZ5cOreQ3eVfg3nsujNiWTfflLw-M3BvHSygip-lalE=",
    "https://as1.ftcdn.net/v2/jpg/01/95/70/12/1000_F_195701243_4uXJILIWRX6B6GUy4t9HQZt6HomkZbzT.jpg",
    "https://t3.ftcdn.net/jpg/02/54/45/12/240_F_254451278_7AAYmhYkBEVQ9MYnZYIomTI5WdFCif1g.jpg",
    "https://images.unsplash.com/photo-1602833280958-1657662ccc58?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80",
    "https://t4.ftcdn.net/jpg/03/08/40/45/240_F_308404590_cKgzFkCSG93RG6ycBbQknhpr0y7pwmzP.jpg"
  ];
  Timer? carasouelTmer;

  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageNo == 4) {
        pageNo = 0;
      }
      pageController.animateToPage(
        pageNo,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCirc,
      );
      pageNo++;
    });
  }

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.85);
    carasouelTmer = getTimer();
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
      body: SafeArea(
        child: SingleChildScrollView(
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
                              content:
                                  Text("Hello you tapped at ${index + 1} "),
                            ),
                          );
                        },
                        onPanDown: (d) {
                          carasouelTmer?.cancel();
                          carasouelTmer = null;
                        },
                        onPanCancel: () {
                          carasouelTmer = getTimer();
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Container(
                            //padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(listImages[index]),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
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
              Container(
                padding:
                    EdgeInsets.only(left: 30, bottom: 1, right: 20, top: 10),
                alignment: Alignment.topLeft,
                child: Text("Time Saving Recipes",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: "chewy",
                        color: Color(0xffF5A342))),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: GridB(),
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 30, bottom: 1, right: 20, top: 10),
                alignment: Alignment.topLeft,
                child: Text("Recommended For you",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: "chewy",
                        color: Color(0xffF5A342))),
              ),
              const Padding(
                padding: EdgeInsets.all(24.0),
                child: GridB1(),
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 30, bottom: 1, right: 20, top: 10),
                alignment: Alignment.topLeft,
                child: Text("Trending",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: "chewy",
                        color: Color(0xffF5A342))),
              ),
              const Padding(
                padding: EdgeInsets.all(24.0),
                child: GridB2(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: showBtmAppBr
          ? FloatingActionButtonLocation.centerDocked
          : FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => SearchPage(),
          //     ));
        },
        child: const Icon(
          Icons.search,
        ),
      ),
      bottomNavigationBar: AnimatedContainer(
        child: BottomAppBar(
          notchMargin: 8.0,
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.home_outlined,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FavoriteList(),
                      ));
                },
                icon: const Icon(
                  CupertinoIcons.heart,
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryScreen(),
                      ));
                },
                icon: const Icon(
                  CupertinoIcons.circle_grid_3x3_fill,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.bell,
                ),
              ),
            ],
          ),
        ),
        duration: const Duration(
          milliseconds: 800,
        ),
        curve: Curves.easeInOutSine,
        height: showBtmAppBr ? 70 : 0,
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

//popmenu class
// class PopUpMen extends StatelessWidget {
//   final List<PopupMenuEntry> menuList;
//   final Widget? icon;
//   const PopUpMen({Key? key, required this.menuList, this.icon})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16.0),
//       ),
//       itemBuilder: ((context) => menuList),
//       icon: icon,
//     );
//   }
// }

class FabExt extends StatelessWidget {
  const FabExt({
    Key? key,
    required this.showFabTitle,
  }) : super(key: key);

  final bool showFabTitle;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {},
      label: AnimatedContainer(
        duration: const Duration(seconds: 2),
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            const Icon(CupertinoIcons.cart),
            SizedBox(width: showFabTitle ? 12.0 : 0),
            AnimatedContainer(
              duration: const Duration(seconds: 2),
              child: showFabTitle ? const Text("Go to cart") : const SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}

class GridB extends StatefulWidget {
  const GridB({
    Key? key,
  }) : super(key: key);

  @override
  State<GridB> createState() => _GridBState();
}

// void gotoPape(BuildContext context) {
//   Navigator.push(context, MaterialPageRoute(builder: (context) {
//     return cucumberpage();
//   }));
// }

final List<Gridmap_c> click_c = [
  Gridmap_c(
      title: 'Cucumber Raita',
      images:
          'https://as1.ftcdn.net/v2/jpg/01/95/70/12/1000_F_195701243_4uXJILIWRX6B6GUy4t9HQZt6HomkZbzT.jpg',
      page: cucumberpage()),
  Gridmap_c(
      title: 'Paneer Tikka Kabab',
      images:
          'https://media.istockphoto.com/id/1303442507/photo/spicy-indian-paneer-tikka-masala-on-a-skewer-on-wooden-platter.jpg?s=612x612&w=0&k=20&c=eijXsF8w-86CwaxsNszS58TsmDUX2c-LysPEEuUablo=',
      page: pannertikkakabab()),
];

class _GridBState extends State<GridB> {
  List<bool> listIsFavTimeSaving = [false, false];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        mainAxisExtent: 260,
      ),
      itemCount: click_c.length,
      itemBuilder: (_, index) {
        return InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => click_c[index].page));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10.0,
              ),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  child: Image.network(
                    click_c[index].images,
                    height: 170,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        click_c[index].title,
                        style: Theme.of(context).textTheme.subtitle1!.merge(
                              const TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                      ),
                      // Text(
                      //   "${gridMap.elementAt(index)['price']}",
                      //   style: Theme.of(context).textTheme.subtitle2!.merge(
                      //         TextStyle(
                      //           fontWeight: FontWeight.w700,
                      //           color: Colors.grey.shade500,
                      //         ),
                      //       ),
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                listIsFavTimeSaving[index] =
                                    !listIsFavTimeSaving[index];
                              });
                            },
                            icon: listIsFavTimeSaving[index]
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                                : Icon(
                                    Icons.favorite_border,
                                  ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class GridB1 extends StatefulWidget {
  const GridB1({Key? key}) : super(key: key);

  @override
  State<GridB1> createState() => _GridB1State();
}

final List<Gridmap_c> click_c1 = [
  Gridmap_c(
      title: 'White Saurce Pasta',
      images:
          'https://t4.ftcdn.net/jpg/00/65/59/93/240_F_65599346_xxwNpdbxHN2WKXSpWpUYMiBAghUdPoGD.jpg',
      page: whitesaucepasta()),
  Gridmap_c(
      title: 'Veg Hakka Noodles',
      images:
          'https://img.freepik.com/free-photo/top-view-delicious-noodles-concept_23-2148773775.jpg?w=1060&t=st=1674122376~exp=1674122976~hmac=835cb696cd339628f4d240f8cc7f13530f117b06d4e1add5d31e0289c39d5a97',
      page: veghakkanoodles()),
];

class _GridB1State extends State<GridB1> {
  List<bool> listIsFavTimeSaving = [false, false];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        mainAxisExtent: 260,
      ),
      itemCount: click_c1.length,
      itemBuilder: (_, index) {
        return InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => click_c1[index].page));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                16.0,
              ),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  child: Image.network(
                    click_c1[index].images,
                    height: 170,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        click_c1[index].title,
                        style: Theme.of(context).textTheme.subtitle1!.merge(
                              const TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                      ),
                      // Text(
                      //   "${gridMap.elementAt(index)['price']}",
                      //   style: Theme.of(context).textTheme.subtitle2!.merge(
                      //         TextStyle(
                      //           fontWeight: FontWeight.w700,
                      //           color: Colors.grey.shade500,
                      //         ),
                      //       ),
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                listIsFavTimeSaving[index] =
                                    !listIsFavTimeSaving[index];
                              });
                            },
                            icon: listIsFavTimeSaving[index]
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                                : Icon(Icons.favorite_border),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class GridB2 extends StatefulWidget {
  const GridB2({Key? key}) : super(key: key);

  @override
  State<GridB2> createState() => _GridB2State();
}

final List<Gridmap_c> click_c2 = [
  Gridmap_c(
      title: 'Tacos',
      images:
          'https://as2.ftcdn.net/v2/jpg/01/13/63/63/1000_F_113636348_FPQO3sUu2ZA3HR9zOzM4lnSiWEdsoqwu.jpg',
      page: Tacos()),
  Gridmap_c(
      title: 'Spring Rolls',
      images:
          'https://as2.ftcdn.net/v2/jpg/02/14/90/07/1000_F_214900725_8X4DfrIsIdScBl4hDZ3Uqv5WywlOPhCN.jpg',
      page: springrolls()),
];

class _GridB2State extends State<GridB2> {
  List<bool> listIsFavTimeSaving = [false, false];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        mainAxisExtent: 260,
      ),
      itemCount: click_c2.length,
      itemBuilder: (_, index) {
        return InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => click_c2[index].page));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                16.0,
              ),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  child: Image.network(
                    click_c2[index].images,
                    height: 170,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        click_c2[index].title,
                        style: Theme.of(context).textTheme.subtitle1!.merge(
                              const TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                      ),
                      // Text(
                      //   "${gridMap.elementAt(index)['price']}",
                      //   style: Theme.of(context).textTheme.subtitle2!.merge(
                      //         TextStyle(
                      //           fontWeight: FontWeight.w700,
                      //           color: Colors.grey.shade500,
                      //         ),
                      //       ),
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                listIsFavTimeSaving[index] =
                                    !listIsFavTimeSaving[index];
                              });
                            },
                            icon: listIsFavTimeSaving[index]
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                                : Icon(Icons.favorite_border),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
