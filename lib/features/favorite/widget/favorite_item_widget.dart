import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_luscious/core/constant/app_image.dart';
import 'package:d_luscious/core/constant/colors_const.dart';
import 'package:d_luscious/core/constant/const.dart';
import 'package:d_luscious/core/widgets/network_image.dart';
import 'package:d_luscious/features/Recipes/recipe_detail_screen.dart';
import 'package:d_luscious/features/d_luscious.dart';
import 'package:d_luscious/features/home/widget/recipe_item_shimmer_widget.dart';
import 'package:d_luscious/features/model/favorite_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteItemWidget extends StatefulWidget {
  FavoriteItemWidget({super.key});

  @override
  State<FavoriteItemWidget> createState() => _FavoriteItemWidgetState();
}

class _FavoriteItemWidgetState extends State<FavoriteItemWidget> {
  final db = FirebaseFirestore.instance;

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("users")
          .doc(_auth.currentUser?.email ?? "")
          .collection("favorites")
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const RecipeItemShimmer();
        }

        // else if (snapshot.connectionState == ConnectionState.done) {
        //   if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
        //     return GridView.builder(
        //       shrinkWrap: true,
        //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //           crossAxisCount: 2,
        //           crossAxisSpacing: 12.0,
        //           mainAxisSpacing: 12.0,
        //           mainAxisExtent: 200),
        //       itemCount: snapshot.data!.docs.length,
        //       itemBuilder: (_, index) {
        //         // final recipeName = FavoriteScreenData.favorite.value[index].name;
        //         // final recipeImage =
        //         //     FavoriteScreenData.favorite.value[index].image;
        //         final recipeName = snapshot.data!.docs[index]["name"];
        //         final recipeImage = snapshot.data!.docs[index]["image"];
        //         return Container(
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(
        //               10.0,
        //             ),
        //             border: Border.all(width: 0.5),
        //           ),
        //           child: Column(
        //             children: [
        //               InkWell(
        //                 onTap: () {
        //                   // Navigator.push(
        //                   //     context,
        //                   //     MaterialPageRoute(
        //                   //         builder: (context) => click_c[index].page));
        //                 },
        //                 child: ClipRRect(
        //                   borderRadius: const BorderRadius.only(
        //                     topLeft: Radius.circular(10.0),
        //                     topRight: Radius.circular(10.0),
        //                   ),
        //                   child: CachedImage(
        //                     image: recipeImage ?? "",
        //                     height: 150,
        //                     width: double.infinity,
        //                     redius: 10,
        //                   ),
        //                 ),
        //               ),
        //               Padding(
        //                 padding: const EdgeInsets.all(8.0),
        //                 child: Row(
        //                   children: [
        //                     Flexible(
        //                       child: InkWell(
        //                         onTap: () {
        //                           // Navigator.push(
        //                           //     context,
        //                           //     MaterialPageRoute(
        //                           //         builder: (context) =>
        //                           //             click_c[index].page));
        //                         },
        //                         child: Text(
        //                           recipeName ?? "",
        //                           style: Theme.of(context)
        //                               .textTheme
        //                               .titleMedium!
        //                               .merge(
        //                                 const TextStyle(
        //                                   fontWeight: FontWeight.w700,
        //                                 ),
        //                               ),
        //                         ),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ],
        //           ),
        //         );
        //       },
        //     );
        //   }
        // }

        if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
          return GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 12.0,
                mainAxisExtent: 200),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (_, index) {
              // final recipeName = FavoriteScreenData.favorite.value[index].name;
              // final recipeImage =
              //     FavoriteScreenData.favorite.value[index].image;
              // final favoriteData = Favorite.fromMap(snapshot.data!.docs[index].data());
              final favoriteData = Favorite.fromMap(
                  snapshot.data!.docs[index].data() as Map<String, dynamic>);

              // final recipeName = snapshot.data!.docs[index]["name"];
              // final recipeImage = snapshot.data!.docs[index]["image"];
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
                              title: favoriteData.name ?? "",
                              id: favoriteData.id ?? "",
                              imageUrl: favoriteData.image ?? "",
                              ingredients: favoriteData.ingredients ?? [],
                              instruction: favoriteData.instructions ?? [],
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: favoriteData.name ?? "",
                        child: CachedImage(
                          image: favoriteData.image ?? "",
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
                                      title: favoriteData.name ?? "",
                                      id: favoriteData.id ?? "",
                                      imageUrl: favoriteData.image ?? "",
                                      ingredients:
                                          favoriteData.ingredients ?? [],
                                      instruction:
                                          favoriteData.instructions ?? [],
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                favoriteData.name ?? "",
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .merge(
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
                              // .indexWhere((fav) => fav.id == favoriteData.id);

                              // Log the id before manipulating the favorites
                              log("Clicked onTap for id: ${favoriteData.id}");

                              if (updatedFavorites.contains(favoriteData.id)) {
                                updatedFavorites.remove(favoriteData.id);
                                await deleteData(favoriteData.id ?? "");
                                log("Removed ${favoriteData.id} from favorites");
                              } else {
                                updatedFavorites.add(favoriteData.id ?? "");

                                log("Calling addData function for recipe ID: ${favoriteData.id}");
                                await addData(
                                    favoriteData.id ?? "",
                                    Favorite(
                                      id: favoriteData.id ?? "",
                                      name: favoriteData.name ?? "",
                                      image: favoriteData.image ?? "",
                                    ));
                                log("Added ${favoriteData.id} to favorites");
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
                                return favoriteDocId.contains(favoriteData.id)
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
          );
        } else {
          return Center(
            child: Image.asset(ImageAsset.imEmptyFavorites),
          );
        }
      },
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
