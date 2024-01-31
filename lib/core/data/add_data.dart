import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_luscious/core/constant/const.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addRecipeData() async {
    // Assuming `recipeTypes` is your list of recipes
    for (var recipeType in Const.recipeTypes) {
      await _firestore.collection('recipeTypes').add({
        'typeName': recipeType.typeName,
        'recipes': recipeType.recipes.map((recipe) {
          return {
            'id': recipe.id,
            'name': recipe.name,
            'image': recipe.image,
            'ingredients': recipe.ingredients,
            'instructions': recipe.instructions,
          };
        }).toList(),
      });
    }
  }
}
