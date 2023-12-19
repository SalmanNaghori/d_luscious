class RecipeModel {
  List<RecipeType> recipeTypes;

  RecipeModel(this.recipeTypes);
}

class RecipeType {
  String typeName;
  List<Recipe> recipes;

  RecipeType(this.typeName, this.recipes);
}

class Recipe {
  String name;
  bool isLiked;
  String image;

  Recipe(this.name, this.isLiked, this.image);
}
