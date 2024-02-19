// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:d_luscious/features/d_luscious.dart';

class Favorite {
  final String? id;
  final String? name;
  final String? image;
  final List<String>? ingredients;
  final List<String>? instructions;

  Favorite({
    this.id,
    this.name,
    this.image,
    this.ingredients,
    this.instructions,
  });

  // receiving data from server
  // receiving data from server
  factory Favorite.fromMap(Map<String, dynamic>? json) {
    if (json == null) {
      MyApp.logger.w('Favorite called with null json');
      return Favorite(
          id: '', name: '', image: '', ingredients: [], instructions: []);
    }

    return Favorite(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      ingredients: List<String>.from(json['ingredients'] ?? []),
      instructions: List<String>.from(json['instructions'] ?? []),
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
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
    return 'Favorite{id: $id, name: $name,  image:$image, ingredients:$ingredients, instruction:$instructions }';
  }
}
