import 'dart:developer';
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_luscious/core/constant/const.dart';
import 'package:d_luscious/features/d_luscious.dart';
import 'package:d_luscious/features/model/recipe_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class RecipeService {
  static final CollectionReference recipeTypesCollection =
      FirebaseFirestore.instance.collection('recipeTypes');

  static Future<void> storeRecipes() async {
    EasyLoading.show();
    try {
      int recipeTypeIndex = 1;

      for (RecipeType recipeType in Const.recipeTypes) {
        // Generate a custom document ID for RecipeType
        String recipeTypeId = 'custom_id_$recipeTypeIndex';

        // Increment recipeTypeIndex for the next iteration
        recipeTypeIndex++;

        // Add RecipeType document with custom ID
        DocumentReference recipeTypeDocRef =
            recipeTypesCollection.doc(recipeTypeId);

        await recipeTypeDocRef.set({
          'typeName': recipeType.typeName,
        });

        // Add Recipes subcollection within RecipeType document
        CollectionReference recipesCollection =
            recipeTypeDocRef.collection('recipes');

        int recipeIndex = 1;

        for (Recipe recipe in recipeType.recipes ?? []) {
          // Generate a custom document ID for Recipe
          String recipeId = 'custom_id_$recipeIndex';

          // Increment recipeIndex for the next iteration
          recipeIndex++;

          // Add Recipe document within Recipes subcollection with custom ID
          await recipesCollection.doc(recipeId).set({
            "id": recipeId,
            'name': recipe.name,
            'image': recipe.image,
            'ingredients': recipe.ingredients,
            'instructions': recipe.instructions,
          });

          // Introduce a delay to ensure unique timestamps for custom IDs
          await Future.delayed(Duration(milliseconds: 500));
        }
      }
      MyApp.logger.d('Data stored successfully');
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();
      log('Error storing data: $e');
    }
  }
}
