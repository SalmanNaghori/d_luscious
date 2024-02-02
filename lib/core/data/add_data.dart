import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_luscious/core/constant/const.dart';
import 'package:d_luscious/features/model/recipe_model.dart';

class RecipeService {
  static final CollectionReference recipeTypesCollection =
      FirebaseFirestore.instance.collection('recipeTypes');

  static Future<void> storeRecipes() async {
    try {
      for (RecipeType recipeType in Const.recipeTypes) {
        // Add RecipeType document
        DocumentReference recipeTypeDocRef = await recipeTypesCollection.add({
          'typeName': recipeType.typeName,
        });

        // Add Recipes subcollection within RecipeType document
        CollectionReference recipesCollection =
            recipeTypeDocRef.collection('recipes');

        for (Recipe recipe in recipeType.recipes) {
          // Add Recipe document within Recipes subcollection
          await recipesCollection.add({
            "id": recipe.id,
            'name': recipe.name,
            'image': recipe.image,
            'ingredients': recipe.ingredients,
            'instructions': recipe.instructions,
          });
        }
      }
      log('Data stored successfully');
    } catch (e) {
      log('Error storing data: $e');
    }
  }
}
