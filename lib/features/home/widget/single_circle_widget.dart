// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:d_luscious/core/constant/app_image.dart';
import 'package:d_luscious/core/constant/colors_const.dart';
import 'package:d_luscious/features/model/recipe_model.dart';

class SingleCircleWidget extends StatefulWidget {
  final double? radius;
  final double fontSize;
  final String? image;
  final String? title;
  final RecipeType recipeType;
  final Function? selectedFood;
  final List<String> listOfFood;
  final String index;
  SingleCircleWidget({
    Key? key,
    this.radius,
    this.fontSize = 20.0,
    this.image,
    this.title,
    required this.recipeType,
    this.selectedFood,
    required this.listOfFood,
    required this.index,
  }) : super(key: key);

  @override
  State<SingleCircleWidget> createState() => _SingleCircleWidgetState();
}

class _SingleCircleWidgetState extends State<SingleCircleWidget> {
  String isSelected = "";

  @override
  void initState() {
    super.initState();
  }

  bool isSelectedFun() {
    if (isSelected.isNotEmpty) {
      for (int i = 0; i < widget.listOfFood.length; i++) {
        if (isSelected == widget.listOfFood[i]) {
          return true;
        }
      }
    }
    return false; // Add a return statement for the case when isSelected is empty or no match is found.
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              widget.selectedFood!(widget.recipeType.typeName);
              isSelected = widget.recipeType.typeName ?? "";
              print("is selected $isSelected");
              print("is widget index == ${widget.index}");
            },
            child: ClipOval(
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  isSelectedFun() ? Colors.transparent : ConstColor.greyColor,
                  BlendMode.color,
                ),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.none,
                  imageBuilder: (context, provider) {
                    return CircleAvatar(
                      radius: widget.radius ?? 50,
                      backgroundImage: provider,
                    );
                  },
                  imageUrl: widget.recipeType.recipeImage ?? "",
                  placeholder: (ctx, url) => Shimmer.fromColors(
                    baseColor: ConstColor.whiteColor,
                    highlightColor: ConstColor.greyColor,
                    child: CircleAvatar(
                      radius: widget.radius ?? 50,
                    ),
                  ),
                  errorWidget: (context, url, error) => CircleAvatar(
                    radius: widget.radius ?? 50,
                    backgroundImage: const AssetImage(ImageAsset.icAppLogo),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.recipeType.typeName ?? "",
            style: TextStyle(
              fontSize: widget.fontSize,
              fontFamily: "chewy",
              color: isSelected == widget.recipeType.typeName
                  ? ConstColor.primaryColor
                  : ConstColor.greyColor,
            ),
          ),
        ],
      ),
    );
  }
}
