class RecipeSuccessModel {
  List<Recipes>? recipes;
  String? typeName;

  RecipeSuccessModel({this.recipes, this.typeName});

  RecipeSuccessModel.fromJson(Map<String, dynamic> json) {
    if (json['recipes'] != null) {
      recipes = <Recipes>[];
      json['recipes'].forEach((v) {
        recipes!.add(Recipes.fromJson(v));
      });
    }
    typeName = json['typeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (recipes != null) {
      data['recipes'] = recipes!.map((v) => v.toJson()).toList();
    }
    data['typeName'] = typeName;
    return data;
  }
}

class Recipes {
  String? image;
  List<String>? instructions;
  String? name;
  List<String>? ingredients;
  int? id;

  Recipes(
      {this.image, this.instructions, this.name, this.ingredients, this.id});

  Recipes.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    instructions = json['instructions'].cast<String>();
    name = json['name'];
    ingredients = json['ingredients'].cast<String>();
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['instructions'] = instructions;
    data['name'] = name;
    data['ingredients'] = ingredients;
    data['id'] = id;
    return data;
  }
}
