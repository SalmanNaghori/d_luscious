// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:d_luscious/features/d_luscious.dart';

class RecipeModel {
  final List<RecipeType>? recipeTypes;

  RecipeModel({this.recipeTypes});

  factory RecipeModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    if (data == null) {
      throw Exception('Document data is null for document: ${snapshot.id}');
    }

    final recipeTypesData = data['recipeTypes'];

    if (recipeTypesData is List && recipeTypesData.isNotEmpty) {
      final List<RecipeType> recipeTypes = recipeTypesData
          .map((type) => RecipeType.fromFirestore(type))
          .toList();

      return RecipeModel(recipeTypes: recipeTypes);
    } else {
      MyApp.logger.w(
          'RecipeTypes field is not a valid list for document: ${snapshot.id}');
      return RecipeModel(recipeTypes: []); // or handle it as you see fit
    }
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (recipeTypes != null)
        'recipeTypes': recipeTypes?.map((type) => type.toFirestore()).toList(),
    };
  }

  @override
  String toString() {
    return 'RecipeModel(recipeTypes: $recipeTypes)';
  }
}

class RecipeType {
  final String? id;
  final String? typeName;
  final String? recipeImage;
  final List<Recipe>? recipes;

  RecipeType({
    this.id,
    this.typeName,
    this.recipeImage,
    this.recipes,
  });

  factory RecipeType.fromFirestore(dynamic json) {
    if (json == null || !(json is Map<String, dynamic>)) {
      MyApp.logger.w('RecipeType.fromFirestore called with invalid json');
      return RecipeType(
        typeName: '',
        recipes: [],
        recipeImage: '',
        id: '',
      );
    }

    return RecipeType(
      typeName: json['typeName'],
      recipeImage: json['recipeImage'],
      id: json['id'],
      recipes: List<Recipe>.from(
        json['recipes']?.map((x) => Recipe.fromFirestore(x)) ?? [],
      ),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) 'id': id,
      if (typeName != null) 'typeName': typeName,
      if (recipeImage != null) 'typeName': recipeImage,
      if (recipes != null)
        'recipes': recipes?.map((recipe) => recipe.toFirestore()).toList(),
    };
  }

  @override
  String toString() {
    return 'RecipeType(typeName: $typeName, recipes: $recipes)';
  }
}

class Recipe {
  final String? id;
  final String? name;
  final String? image;
  final List<String>? ingredients;
  final List<String>? instructions;

  Recipe({
    this.id,
    this.name,
    this.image,
    this.ingredients,
    this.instructions,
  });

  factory Recipe.fromFirestore(Map<String, dynamic>? json) {
    if (json == null) {
      MyApp.logger.w('Recipe.fromFirestore called with null json');
      return Recipe(
          id: '', name: '', image: '', ingredients: [], instructions: []);
    }

    return Recipe(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      ingredients: List<String>.from(json['ingredients'] ?? []),
      instructions: List<String>.from(json['instructions'] ?? []),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (image != null) 'image': image,
      if (ingredients != null) 'ingredients': ingredients,
      if (instructions != null) 'instructions': instructions,
    };
  }

  @override
  String toString() {
    return 'Recipe(id: $id, name: $name, image: $image, ingredients: $ingredients, instructions: $instructions)';
  }
}
