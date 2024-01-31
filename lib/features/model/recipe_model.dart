import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer'; // For using the log function

// Main function to fetch all recipes from Firestore
Future<List<RecipeModel>> getAllRecipes() async {
  try {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection("recipeTypes").get();
    final List<RecipeModel> userData =
        snapshot.docs.map((e) => RecipeModel.fromSnapshot(e)).toList();
    log(userData.toString());
    return userData;
  } catch (e) {
    // Handle the exception
    log("Error fetching data: $e");
    return []; // Return an empty list in case of error
  }
}

// RecipeModel class
class RecipeModel {
  List<RecipeType> recipeTypes;

  RecipeModel({required this.recipeTypes});

  factory RecipeModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    try {
      final data = document.data();
      if (data == null) {
        throw Exception('Document data is null');
      }
      if (!data.containsKey('recipeTypes') || data['recipeTypes'] == null) {
        throw Exception('recipeTypes field is missing or null');
      }
      var recipeTypesList = List<RecipeType>.from(
        data['recipeTypes'].map((x) => RecipeType.fromJson(x)),
      );
      return RecipeModel(recipeTypes: recipeTypesList);
    } catch (e) {
      print('Error parsing RecipeModel from snapshot: $e');
      return RecipeModel(
          recipeTypes: []); // Return an empty model or handle accordingly
    }
  }
}

// RecipeType class
class RecipeType {
  String typeName;
  List<Recipe> recipes;

  RecipeType({
    required this.typeName,
    required this.recipes,
  });

  factory RecipeType.fromJson(Map<String, dynamic> json) {
    return RecipeType(
      typeName: json['typeName'],
      recipes:
          List<Recipe>.from(json['recipes'].map((x) => Recipe.fromJson(x))),
    );
  }
}

// Recipe class
class Recipe {
  int id;
  String name;
  bool? isLiked;
  String image;
  List<String> ingredients;
  List<String> instructions;

  Recipe({
    required this.id,
    required this.name,
    this.isLiked,
    required this.image,
    required this.ingredients,
    required this.instructions,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      name: json['name'],
      isLiked: json['isLiked'],
      image: json['image'],
      ingredients: List<String>.from(json['ingredients']),
      instructions: List<String>.from(json['instructions']),
    );
  }
}
