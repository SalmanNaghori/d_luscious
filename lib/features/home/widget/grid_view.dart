import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_luscious/features/d_luscious.dart';
import 'package:d_luscious/features/home/widget/recipe_item_shimmer_widget.dart';
import 'package:d_luscious/features/home/widget/recipe_item_widget.dart';
import 'package:d_luscious/features/model/recipe_model.dart';
import 'package:flutter/material.dart';

class GridViewWidget extends StatefulWidget {
  final String selectedId;
  const GridViewWidget({super.key, required this.selectedId});

  @override
  State<GridViewWidget> createState() => GridViewWidgetState();
}

class GridViewWidgetState extends State<GridViewWidget> {
  final db = FirebaseFirestore.instance;

  List<Recipe> recipe = [];

  //TODO: DOCID
  List<String> docId = [];

  late Future<List<Recipe>> futureRecipes;

  Future<List<Recipe>> getAllDocumentIds(String selectedId) async {
    recipe.clear();
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await db
          .collection('recipeTypes')
          .doc(selectedId)
          .collection("recipes")
          .get();

      for (var document in querySnapshot.docs) {
        recipe.add(Recipe.fromFirestore(document.data()));
        docId.add(document.id);
      }

      return recipe;
    } catch (e) {
      MyApp.logger.e("Error fetching data: $e");
      return []; // Return an empty list in case of an error
    }
  }

  @override
  void initState() {
    super.initState();
    futureRecipes = getAllDocumentIds(widget.selectedId);
  }

  refresh(String index) {
    futureRecipes = getAllDocumentIds(index);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Recipe>>(
      future: futureRecipes,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            // Handle the error
            return Text('Error: ${snapshot.error}');
          }

          return RecipeItemWidget(
            recipeModel: snapshot.data ?? [],
          );
        } else {
          // You can return a loading indicator or an empty container here
          return const RecipeItemShimmer();
        }
      },
    );
  }
}
