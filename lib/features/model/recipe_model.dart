import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_luscious/features/d_luscious.dart';

class RecipeModel {
  List<RecipeType> recipeTypes;

  RecipeModel({required this.recipeTypes});

  factory RecipeModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data == null) {
      throw Exception('Document data is null for document: ${document.id}');
    }

    final recipeTypesData = data["recipeTypes"];

    // Check if 'recipeTypes' is null or not present in the document
    if (recipeTypesData == null) {
      MyApp.logger.w(
          'RecipeTypes field is null or not present for document: ${document.id}');
      return RecipeModel(recipeTypes: []); // or handle it as you see fit
    }

    // Ensure that 'recipeTypes' is a List<Map<String, dynamic>>
    if (recipeTypesData is List && recipeTypesData.isNotEmpty) {
      final List<RecipeType> recipeTypes =
          recipeTypesData.map((type) => RecipeType.fromJson(type)).toList();

      return RecipeModel(recipeTypes: recipeTypes);
    } else {
      MyApp.logger.w(
          'RecipeTypes field is not a valid list for document: ${document.id}');
      return RecipeModel(recipeTypes: []); // or handle it as you see fit
    }
  }

  @override
  String toString() {
    return 'RecipeModel(recipeTypes: $recipeTypes)';
  }
}

class RecipeType {
  String typeName;
  List<Recipe> recipes;

  RecipeType({
    required this.typeName,
    required this.recipes,
  });

  factory RecipeType.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      MyApp.logger.w('RecipeType.fromJson called with null json');
      return RecipeType(typeName: '', recipes: []);
    }

    return RecipeType(
      typeName: json['typeName'] ?? '',
      recipes: List<Recipe>.from(
          json['recipes']?.map((x) => Recipe.fromJson(x)) ?? []),
    );
  }

  @override
  String toString() {
    return 'RecipeType(typeName: $typeName, recipes: $recipes)';
  }
}

class Recipe {
  int id; // Change int to int?
  String name;

  String image;
  List<String> ingredients;
  List<String> instructions;
  // Other properties remain unchanged

  Recipe({
    required this.id,
    required this.name,
    required this.image,
    required this.ingredients,
    required this.instructions,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'], // Cast to int?
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      ingredients: List<String>.from(json['ingredients'] ?? []),
      instructions: List<String>.from(json['instructions'] ?? []),
    );
  }
}
