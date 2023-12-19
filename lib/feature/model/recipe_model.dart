// ignore_for_file: public_member_api_docs, sort_constructors_first
class RecipeModel {
  List<RecipeType> recipeTypes;
  RecipeModel({
    required this.recipeTypes,
  });
}

class RecipeType {
  String typeName;
  List<Recipe> recipes;
  RecipeType({
    required this.typeName,
    required this.recipes,
  });
}

class Recipe {
  String name;
  bool? isLiked;
  String image;
  Recipe({
    required this.name,
    this.isLiked,
    required this.image,
  });
}
