import 'package:d_luscious/core/constant/colors_const.dart';
import 'package:d_luscious/core/constant/const.dart';
import 'package:d_luscious/core/widgets/network_image.dart';
import 'package:d_luscious/feature/Recipes/recipe_detail_screen.dart';
import 'package:d_luscious/feature/model/favorite_model.dart';
import 'package:d_luscious/feature/model/recipe_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipeItemWidget extends StatelessWidget {
  final RecipeType recipeModel;

  const RecipeItemWidget({
    Key? key,
    required this.recipeModel,
  }) : super(key: key);

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
            var recipeId = recipeModel.recipes[index].id;
            var recipeIngredient = recipeModel.recipes[index].ingrediants;
            var recipeInstruction = recipeModel.recipes[index].instructions;
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
                            id: recipeId,
                            imageUrl: recipeImage,
                            ingredients: recipeIngredient,
                            instruction: recipeInstruction,
                          ),
                        ),
                      );
                    },
                    child: Hero(
                      tag: recipeId,
                      child: CachedImage(
                        image: recipeImage,
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
                                    id: recipeId,
                                    imageUrl: recipeImage,
                                    ingredients: recipeIngredient,
                                    instruction: recipeInstruction,
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              recipeName,
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
                            List<int> updatedFavorites = List<int>.from(
                                FavoriteManager.favoriteRecipeIds.value);

                            if (updatedFavorites.contains(recipeId)) {
                              updatedFavorites.remove(recipeId);
                              int indexToRemove = FavoriteScreenData
                                  .favorite.value
                                  .indexWhere((fav) =>
                                      fav.id == recipeModel.recipes[index].id);

                              if (indexToRemove != -1) {
                                FavoriteScreenData.favorite.value
                                    .removeAt(indexToRemove);
                                print("Removed $recipeId from favorites");
                              } else {
                                print("Favorite not found in the list");
                              }
                              print("Removed $recipeId from favorites");
                            } else {
                              updatedFavorites.add(recipeId);
                              FavoriteScreenData.favorite.value.add(Favorite(
                                  id: recipeModel.recipes[index].id,
                                  name: recipeName,
                                  image: recipeImage));
                              print("Added $recipeId to favorites");
                            }

                            // Update the global list
                            FavoriteManager.favoriteRecipeIds.value =
                                updatedFavorites;
                          },
                          child: ValueListenableBuilder<List<int>>(
                            valueListenable: FavoriteManager.favoriteRecipeIds,
                            builder: (context, favoriteRecipeIds, _) {
                              return favoriteRecipeIds.contains(recipeId)
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
