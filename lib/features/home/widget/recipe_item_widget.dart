import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_luscious/core/constant/colors_const.dart';
import 'package:d_luscious/core/constant/const.dart';
import 'package:d_luscious/core/widgets/network_image.dart';
import 'package:d_luscious/features/Recipes/recipe_detail_screen.dart';
import 'package:d_luscious/features/d_luscious.dart';
import 'package:d_luscious/features/model/favorite_model.dart';
import 'package:d_luscious/features/model/recipe_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipeItemWidget extends StatefulWidget {
  final String userId;
  final List<Recipe> recipeModel;

  const RecipeItemWidget({
    Key? key,
    required this.userId,
    required this.recipeModel,
  }) : super(key: key);

  @override
  State<RecipeItemWidget> createState() => _RecipeItemWidgetState();
}

class _RecipeItemWidgetState extends State<RecipeItemWidget> {
  final db = FirebaseFirestore.instance;

  final _auth = FirebaseAuth.instance;

  final List<String> docId = [];
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

          // log("Document ID: ${change.doc.id}");
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
    await Future.delayed(Duration(seconds: 2)); // Adjust the duration as needed
    await getAllDocumentIds();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getAllDocumentIdsWithDelay();
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    log("===recipe widget===${widget.recipeModel.length}");
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
          itemCount: widget.recipeModel.length,
          itemBuilder: (_, index) {
            log(widget.recipeModel.length.toString());
            Recipe recipeData = widget.recipeModel[index];
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
                              overflow: TextOverflow.ellipsis,
                              style:
                                  Theme.of(context).textTheme.titleSmall!.merge(
                                        const TextStyle(
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            FavoriteDocId.favoriteDocId.notifyListeners();

                            // Access the global list of favorite recipe IDs
                            List<String> updatedFavorites = List<String>.from(
                                FavoriteDocId.favoriteDocId.value);
                            //  int indexToRemove = FavoriteScreenData
                            // .favorite.value
                            // .indexWhere((fav) => fav.id == recipeData.id);

                            // Log the id before manipulating the favorites
                            log("Clicked onTap for id: ${recipeData.id}");

                            if (updatedFavorites.contains(recipeData.id)) {
                              updatedFavorites.remove(recipeData.id);
                              await deleteData(recipeData.id ?? "");
                              log("Removed ${recipeData.id} from favorites");
                            } else {
                              updatedFavorites.add(recipeData.id ?? "");
                              FavoriteScreenData.favorite.value.add(Favorite(
                                id: recipeData.id ?? "",
                                name: recipeData.name ?? "",
                                image: recipeData.image ?? "",
                              ));
                              log("Calling addData function for recipe ID: ${recipeData.id}");
                              await addData(
                                recipeData.id ?? "",
                                Favorite(
                                  id: recipeData.id ?? "",
                                  name: recipeData.name ?? "",
                                  image: recipeData.image ?? "",
                                  ingredients: recipeData.ingredients ?? [],
                                  instructions: recipeData.instructions ?? [],
                                ),
                              );
                              log("Added ${recipeData.id} to favorites");
                              // FavoriteDocId.favoriteDocId.notifyListeners();
                            }
                            // Update the global list
                            FavoriteDocId.favoriteDocId.value =
                                updatedFavorites;
                          },
                          child: ValueListenableBuilder<List<String>>(
                            valueListenable: FavoriteDocId.favoriteDocId,
                            builder: (context, favoriteDocId, _) {
                              // log("===favvvv===${favoriteDocId}");
                              return favoriteDocId.contains(recipeData.id)
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

  //Todo: add in favorite
  Future addData(String recipeId, Favorite favorites) async {
    try {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      User? user = _auth.currentUser;

      if (user != null) {
        MyApp.logger
            .f("Attempting to add data to Firestore for recipe ID: $recipeId");

        await firebaseFirestore
            .collection('users')
            .doc(user.email)
            .collection('favorites')
            .doc(recipeId)
            .set(favorites.toMap());

        MyApp.logger.f("Data added to favorites for recipe ID: $recipeId");
      } else {
        MyApp.logger
            .e("User is not authenticated. Cannot add data to favorites.");
      }
    } catch (e) {
      MyApp.logger.e("Error occurred while adding data to favorites: $e");
    }
  }

  //todo:Remove from favorites
  Future deleteData(String recipeId) async {
    try {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      User? user = _auth.currentUser;

      if (user != null) {
        MyApp.logger.f(
            "Attempting to delete data to Firestore for recipe ID: $recipeId");

        await firebaseFirestore
            .collection('users')
            .doc(user.email)
            .collection('favorites')
            .doc(recipeId)
            .delete();

        MyApp.logger.f("Data deleted to favorites for recipe ID: $recipeId");
      } else {
        MyApp.logger
            .e("User is not authenticated. Cannot add data to favorites.");
      }
    } catch (e) {
      MyApp.logger.e("Error occurred while adding data to favorites: $e");
    }
  }
}
