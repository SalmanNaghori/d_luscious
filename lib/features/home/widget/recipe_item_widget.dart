import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:d_luscious/core/constant/colors_const.dart';
import 'package:d_luscious/core/constant/const.dart';
import 'package:d_luscious/core/widgets/network_image.dart';
import 'package:d_luscious/features/Recipes/recipe_detail_screen.dart';
import 'package:d_luscious/features/model/favorite_model.dart';
import 'package:d_luscious/features/model/recipe_model.dart';

class RecipeItemWidget extends StatelessWidget {
  final List<Recipe> recipeModel;

  const RecipeItemWidget({
    Key? key,
    required this.recipeModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("===recipe widget===${recipeModel.length}");
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          itemCount: recipeModel.length,
          itemBuilder: (_, index) {
            log(recipeModel.length.toString());
            Recipe recipeData = recipeModel[index];
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeDetailScreen(
                            title: recipeData.name ?? "",
                            id: recipeData.id ?? "",
                            imageUrl: recipeData.image ?? "",
                            ingredients: recipeData.ingredients ?? [],
                            instruction: recipeData.instructions ?? [],
                          ),
                        ),
                      );
                    },
                    child: Hero(
                      tag: recipeData.name ?? "",
                      child: CachedImage(
                        image: recipeData.image ?? "",
                        height: 150,
                        width: double.infinity,
                        redius: 10,
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RecipeDetailScreen(
                                    title: recipeData.name ?? "",
                                    id: recipeData.id ?? "",
                                    imageUrl: recipeData.image ?? "",
                                    ingredients: recipeData.ingredients ?? [],
                                    instruction: recipeData.instructions ?? [],
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              recipeData.name ?? "",
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
                            // Access the global list of favorite recipe IDs
                            List<String> updatedFavorites = List<String>.from(
                                FavoriteManager.favoriteRecipeIds.value);

                            // Log the id before manipulating the favorites
                            print("Clicked onTap for id: ${recipeData.id}");

                            if (updatedFavorites.contains(recipeData.id)) {
                              updatedFavorites.remove(recipeData.id);
                              int indexToRemove = FavoriteScreenData
                                  .favorite.value
                                  .indexWhere((fav) => fav.id == recipeData.id);

                              if (indexToRemove != -1) {
                                FavoriteScreenData.favorite.value
                                    .removeAt(indexToRemove);
                                if (kDebugMode) {
                                  print(
                                      "Removed ${recipeData.id} from favorites");
                                }
                              } else {
                                if (kDebugMode) {
                                  print("Favorite not found in the list");
                                }
                              }
                              if (kDebugMode) {
                                print(
                                    "Removed ${recipeData.id} from favorites");
                              }
                            } else {
                              updatedFavorites.add(recipeData.id ?? "");
                              FavoriteScreenData.favorite.value.add(Favorite(
                                id: recipeData.id ?? "",
                                name: recipeData.name ?? "",
                                image: recipeData.image ?? "",
                              ));
                              if (kDebugMode) {
                                print("Added ${recipeData.id} to favorites");
                              }
                            }

                            // Update the global list
                            FavoriteManager.favoriteRecipeIds.value =
                                updatedFavorites;
                          },
                          child: ValueListenableBuilder<List<String>>(
                            valueListenable: FavoriteManager.favoriteRecipeIds,
                            builder: (context, favoriteRecipeIds, _) {
                              return favoriteRecipeIds.contains(recipeData.id)
                                  ? const Icon(
                                      CupertinoIcons.heart_fill,
                                      color: ConstColor.redColor,
                                    )
                                  : const Icon(CupertinoIcons.heart);
                            },
                          ),
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
