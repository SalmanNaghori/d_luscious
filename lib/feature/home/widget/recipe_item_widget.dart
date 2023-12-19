import 'package:d_luscious/core/constant/colors_const.dart';
import 'package:d_luscious/feature/model/recipe_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipeItemWidget extends StatelessWidget {
  final RecipeType recipeModel;

  RecipeItemWidget({
    Key? key,
    required this.recipeModel,
  }) : super(key: key);

  final ValueNotifier<bool> isFavorite = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(recipeModel.typeName,
            style: TextStyle(
                fontSize: 30,
                fontFamily: "chewy",
                color: ConstColor.primaryColor)),
        const SizedBox(
          height: 10,
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
              mainAxisExtent: 195),
          itemCount: recipeModel.recipes.length,
          itemBuilder: (_, index) {
            final recipeName = recipeModel.recipes[index].name;
            final recipeImage = recipeModel.recipes[index].image;
            var recipeIsLike = recipeModel.recipes[index].isLiked;
            if (recipeModel.recipes[index].isLiked == false) {
              isFavorite.value = recipeIsLike!;
            }
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
                border: Border.all(width: 0.5),
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => click_c[index].page));
                    },
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                      child: Image.network(
                        recipeImage,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        height: 150,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             click_c[index].page));
                            },
                            child: Text(
                              "${recipeName} ",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .merge(
                                    const TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            isFavorite.value = recipeIsLike!;

                            print("===========isLike: ${isFavorite.value}");
                          },
                          child: ValueListenableBuilder(
                              valueListenable: isFavorite,
                              builder: (context, recipeIsFav, _) {
                                return recipeIsFav == recipeIsLike
                                    ? Icon(
                                        CupertinoIcons.heart_fill,
                                        color: ConstColor.redColor,
                                      )
                                    : Icon(CupertinoIcons.heart);
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
