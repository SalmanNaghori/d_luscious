import 'package:d_luscious/feature/model/recipe_model.dart';

class Const {
  static List<RecipeType> recipeTypes = [
    RecipeType(
      typeName: "Breakfast",
      recipes: [
        Recipe(
            id: 1,
            name: "Pancakes",
            isLiked: false,
            image:
                "https://images.unsplash.com/photo-1490457843367-34b21b6ccd85?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGFuY2FrZXMlMjAzNTQyJUUyJTgwJThBJUMzJTk3JUUyJTgwJThBMjk0N3xlbnwwfHwwfHx8MA%3D%3D"),
        Recipe(
            id: 2,
            name: "Omelette",
            isLiked: false,
            image:
                "https://images.unsplash.com/photo-1510693206972-df098062cb71?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8b21lbGV0dGV8ZW58MHx8MHx8fDA%3D"),
        Recipe(
            id: 3,
            name: "Smoothie",
            isLiked: false,
            image:
                "https://images.unsplash.com/photo-1610622930110-3c076902312a?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8c21vb3RoaWV8ZW58MHx8MHx8fDA%3D"),
      ],
    ),
    RecipeType(
      typeName: "Lunch",
      recipes: [
        Recipe(
            id: 4,
            name: "Spaghetti",
            isLiked: true,
            image:
                "https://images.unsplash.com/photo-1598866594230-a7c12756260f?q=80&w=2808&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
        Recipe(
            id: 5,
            name: "Salad",
            isLiked: false,
            image:
                "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
        Recipe(
            id: 6,
            name: "Sandwich",
            isLiked: true,
            image:
                "https://images.unsplash.com/photo-1528735602780-2552fd46c7af?q=80&w=2946&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
      ],
    ),
    RecipeType(
      typeName: "Dinner",
      recipes: [
        Recipe(
            id: 7,
            name: "Grilled Chicken",
            isLiked: false,
            image:
                "https://plus.unsplash.com/premium_photo-1661419883163-bb4df1c10109?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8R3JpbGxlZCUyMENoaWNrZW58ZW58MHx8MHx8fDA%3D"),
        Recipe(
            id: 8,
            name: "Vegetable Stir-Fry",
            isLiked: true,
            image:
                "https://images.unsplash.com/photo-1552914343-54bcc3ba07f8?q=80&w=2884&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
        Recipe(
            id: 9,
            name: "Pizza",
            isLiked: true,
            image:
                "https://images.unsplash.com/photo-1604382354936-07c5d9983bd3?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
      ],
    ),
    RecipeType(
      typeName: "Dessert",
      recipes: [
        Recipe(
            id: 10,
            name: "Chocolate Cake",
            isLiked: true,
            image:
                "https://images.unsplash.com/photo-1605807646983-377bc5a76493?q=80&w=2824&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
        Recipe(
            id: 11,
            name: "Ice Cream",
            isLiked: true,
            image:
                "https://images.unsplash.com/photo-1580915411954-282cb1b0d780?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
        Recipe(
            id: 12,
            name: "Fruit Tart",
            isLiked: false,
            image:
                "https://images.unsplash.com/photo-1620980776848-84ac10194945?q=80&w=2624&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
      ],
    ),
    // Add more RecipeType with recipes as needed
  ];
}
