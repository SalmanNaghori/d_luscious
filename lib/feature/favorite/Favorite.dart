import 'package:d_luscious/core/constant/app_string.dart';
import 'package:d_luscious/core/constant/const.dart';
import 'package:d_luscious/core/widgets/appbard.dart';
import 'package:d_luscious/feature/favorite/widget/favorite_item_widget.dart';
import 'package:d_luscious/feature/home/widget/recipe_item_widget.dart';
import 'package:flutter/material.dart';

class FavoriteScreenTab extends StatefulWidget {
  const FavoriteScreenTab({super.key});

  @override
  State<FavoriteScreenTab> createState() => _FavoriteScreenTabState();
}

class _FavoriteScreenTabState extends State<FavoriteScreenTab> {
  @override
  Widget build(BuildContext context) {
    // List<bool> listIsFavTimeSaving = [false, false];
    return Scaffold(
        appBar: CustomAppBar.blankAppBar(title: AppString.favorite),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: FavoriteItemWidget(),
        ));
  }
}

final List<Map<String, dynamic>> gridMap = [
  {
    "title": "Cucumber Raita",
    "images":
        "https://as1.ftcdn.net/v2/jpg/01/95/70/12/1000_F_195701243_4uXJILIWRX6B6GUy4t9HQZt6HomkZbzT.jpg",
  },
  {
    "title": "Paneer Tikka Kabab",
    "images":
        "https://media.istockphoto.com/id/1303442507/photo/spicy-indian-paneer-tikka-masala-on-a-skewer-on-wooden-platter.jpg?s=612x612&w=0&k=20&c=eijXsF8w-86CwaxsNszS58TsmDUX2c-LysPEEuUablo=",
  },
];
