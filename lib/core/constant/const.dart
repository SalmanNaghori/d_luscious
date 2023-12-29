import 'package:d_luscious/feature/model/favorite_model.dart';
import 'package:d_luscious/feature/model/recipe_model.dart';
import 'package:flutter/material.dart';

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
              "https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=800",
          ingrediants: [
            "1 cup all-purpose flour",
            "2 tablespoons sugar",
            "1 teaspoon baking powder",
            "1/2 teaspoon baking soda",
            "1/4 teaspoon salt",
            "3/4 cup buttermilk (or milk)",
            "1/4 cup plain yogurt",
            "1 large egg",
            "2 tablespoons unsalted butter, melted",
          ],
          instructions: [
            "1. In a large mixing bowl, whisk together the flour, sugar, baking powder, baking soda, and salt.",
            "2. In another bowl, whisk together the buttermilk, yogurt, egg, and melted butter.",
            "3. Pour the wet ingredients into the dry ingredients and stir until just combined. It's okay if there are a few lumps.",
            "4. Preheat a griddle or non-stick skillet over medium heat. If using a griddle, set the temperature to 350°F (175°C).",
            "5. Lightly grease the cooking surface with cooking spray or a small amount of butter.",
            "6. Pour 1/4 cup of batter onto the griddle for each pancake. Cook until bubbles form on the surface and the edges look set, then flip and cook until the other side is golden brown.",
            "7. Remove the pancakes from the griddle and repeat the process with the remaining batter.",
            "8. Serve the pancakes warm with your favorite toppings, such as maple syrup, fruit, whipped cream, or nuts.",
          ],
        ),
        // Recipe(
        //     id: 2,
        //     name: "Omelette",
        //     isLiked: false,
        //     image:
        //         "https://images.pexels.com/photos/6294361/pexels-photo-6294361.jpeg?auto=compress&cs=tinysrgb&w=800"),
        // Recipe(
        //     id: 3,
        //     name: "Smoothie",
        //     isLiked: false,
        //     image:
        //         "https://images.pexels.com/photos/775030/pexels-photo-775030.jpeg?auto=compress&cs=tinysrgb&w=800"),
      ],
    ),
    RecipeType(
      typeName: "Lunch",
      recipes: [
        // Recipe(
        //     id: 4,
        //     name: "Spaghetti",
        //     isLiked: true,
        //     image:
        //         "https://images.pexels.com/photos/2347311/pexels-photo-2347311.jpeg?auto=compress&cs=tinysrgb&w=800"),
        // Recipe(
        //     id: 5,
        //     name: "Salad",
        //     isLiked: false,
        //     image:
        //         "https://images.pexels.com/photos/2097090/pexels-photo-2097090.jpeg?auto=compress&cs=tinysrgb&w=800"),
        // Recipe(
        //     id: 6,
        //     name: "Sandwich",
        //     isLiked: true,
        //     image:
        //         "https://images.pexels.com/photos/1647163/pexels-photo-1647163.jpeg?auto=compress&cs=tinysrgb&w=800"),
      ],
    ),
    RecipeType(
      typeName: "Dinner",
      recipes: [
        // Recipe(
        //     id: 7,
        //     name: "Grilled Chicken",
        //     isLiked: false,
        //     image:
        //         "https://images.pexels.com/photos/2338407/pexels-photo-2338407.jpeg?auto=compress&cs=tinysrgb&w=800"),
        // Recipe(
        //     id: 8,
        //     name: "Vegetable Stir-Fry",
        //     isLiked: true,
        //     image:
        //         "https://images.pexels.com/photos/262897/pexels-photo-262897.jpeg?auto=compress&cs=tinysrgb&w=800"),
        // Recipe(
        //     id: 9,
        //     name: "Pizza",
        //     isLiked: true,
        // image:
        //     "https://images.pexels.com/photos/1166120/pexels-photo-1166120.jpeg?auto=compress&cs=tinysrgb&w=800"),
      ],
    ),
    RecipeType(
      typeName: "Dessert",
      recipes: [
        // Recipe(
        //     id: 10,
        //     name: "Chocolate Cake",
        //     isLiked: true,
        //     image:
        //         "https://images.pexels.com/photos/4109998/pexels-photo-4109998.jpeg?auto=compress&cs=tinysrgb&w=800"),
        // Recipe(
        //     id: 11,
        //     name: "Ice Cream",
        //     isLiked: true,
        //     image:
        //         "https://images.pexels.com/photos/1362534/pexels-photo-1362534.jpeg?auto=compress&cs=tinysrgb&w=800"),
        // Recipe(
        //     id: 12,
        //     name: "Fruit Tart",
        //     isLiked: false,
        //     image:
        //         "https://images.pexels.com/photos/2693447/pexels-photo-2693447.jpeg?auto=compress&cs=tinysrgb&w=800"),
      ],
    ),
    // Add more RecipeType with recipes as needed
  ];
}

class FavoriteManager {
  static final ValueNotifier<List<int>> favoriteRecipeIds =
      ValueNotifier<List<int>>([]);
}

class FavoriteScreenData {
  static final ValueNotifier<List<Favorite>> favorite =
      ValueNotifier<List<Favorite>>([]);
}
