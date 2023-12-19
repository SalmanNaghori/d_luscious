import 'package:d_luscious/feature/model/recipe_model.dart';

class Const {
  List<RecipeType> dummyRecipeTypes = [
    RecipeType(
      "Breakfast",
      [
        Recipe("Scrambled Eggs", false, "https://example.com/eggs.jpg"),
        Recipe("Pancakes", true, "https://example.com/pancakes.jpg"),
        Recipe(
            "Fruit Smoothie", true, "https://example.com/fruit_smoothie.jpg"),
      ],
    ),
    RecipeType(
      "Time-Saving",
      [
        Recipe(
            "Quick Omelette", true, "https://example.com/quick_omelette.jpg"),
        Recipe("Instant Oatmeal", false,
            "https://example.com/instant_oatmeal.jpg"),
        Recipe("Avocado Toast", true, "https://example.com/avocado_toast.jpg"),
      ],
    ),
    RecipeType(
      "Spicy",
      [
        Recipe("Spicy Chicken Curry", true,
            "https://example.com/chicken_curry.jpg"),
        Recipe("Hot Chili", false, "https://example.com/hot_chili.jpg"),
        Recipe("Jalapeno Poppers", true,
            "https://example.com/jalapeno_poppers.jpg"),
      ],
    ),
    RecipeType(
      "Lunch",
      [
        Recipe("Chicken Salad", false, "https://example.com/chicken_salad.jpg"),
        Recipe(
            "Vegetable Wrap", true, "https://example.com/vegetable_wrap.jpg"),
        Recipe("Caprese Sandwich", false,
            "https://example.com/caprese_sandwich.jpg"),
      ],
    ),
    RecipeType(
      "Dinner",
      [
        Recipe("Grilled Salmon", true, "https://example.com/salmon.jpg"),
        Recipe("Pasta Alfredo", false, "https://example.com/pasta_alfredo.jpg"),
        Recipe(
            "Stir-Fried Tofu", true, "https://example.com/stir_fried_tofu.jpg"),
      ],
    ),
    // Add more recipe types and recipes as needed
    // ...

    // Repeat the above pattern to create a total of 10 different sets of dummy data
  ];
}
