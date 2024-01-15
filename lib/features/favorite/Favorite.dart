import 'package:d_luscious/core/constant/app_string.dart';
import 'package:d_luscious/core/widgets/appbard.dart';
import 'package:d_luscious/features/favorite/widget/favorite_item_widget.dart';
import 'package:flutter/material.dart';

class FavoriteScreenTab extends StatefulWidget {
  const FavoriteScreenTab({super.key});

  @override
  State<FavoriteScreenTab> createState() => _FavoriteScreenTabState();
}

class _FavoriteScreenTabState extends State<FavoriteScreenTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.blankAppBar(title: AppString.favorite),
        body: const Padding(
          padding: EdgeInsets.all(8),
          child: FavoriteItemWidget(),
        ));
  }
}
