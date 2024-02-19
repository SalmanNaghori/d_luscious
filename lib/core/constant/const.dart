import 'package:d_luscious/features/model/favorite_model.dart';
import 'package:d_luscious/features/model/recipe_model.dart';
import 'package:flutter/material.dart';

import '../../features/model/selected_food.dart';

class Const {
  static List<SelectedFood> selectedFood = [
    SelectedFood(
      id: "1",
      title: "Pancakes",
      imageUrl:
          "https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=800",
      ingredients: [
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
      instruction: [
        "In a large mixing bowl, whisk together the flour, sugar, baking powder, baking soda, and salt.",
        "In another bowl, whisk together the buttermilk, yogurt, egg, and melted butter.",
        "Pour the wet ingredients into the dry ingredients and stir until just combined. It's okay if there are a few lumps.",
        "Preheat a griddle or non-stick skillet over medium heat. If using a griddle, set the temperature to 350°F (175°C).",
        "Lightly grease the cooking surface with cooking spray or a small amount of butter.",
        "Pour 1/4 cup of batter onto the griddle for each pancake. Cook until bubbles form on the surface and the edges look set, then flip and cook until the other side is golden brown.",
        "Remove the pancakes from the griddle and repeat the process with the remaining batter.",
        "Serve the pancakes warm with your favorite toppings, such as maple syrup, fruit, whipped cream, or nuts.",
      ],
    ),
    SelectedFood(
      id: "2",
      title: "Fruit Tart",
      imageUrl:
          "https://images.pexels.com/photos/2693447/pexels-photo-2693447.jpeg?auto=compress&cs=tinysrgb&w=800",
      ingredients: [
        "1 and 1/2 cups all-purpose flour",
        "1/2 cup unsalted butter, chilled and diced",
        "1/4 cup granulated sugar",
        "1 egg yolk",
        "1-2 tablespoons cold water",
        "1 cup heavy cream",
        "8 ounces cream cheese, softened",
        "1/3 cup granulated sugar",
        "1 teaspoon vanilla extract",
        "Assorted fresh fruits (berries, kiwi slices, etc.)",
        "Apricot jam or honey for glazing (optional)"
      ],
      instruction: [
        "In a mixing bowl, combine flour, butter, and sugar. Rub together with your fingers until the mixture resembles coarse crumbs.",
        "Add egg yolk and cold water. Mix until it forms a dough. Wrap in plastic wrap and refrigerate for 30 minutes.",
        "Preheat oven to 375°F (190°C).",
        "Roll out the dough on a floured surface and press it into a tart pan. Prick the bottom with a fork.",
        "Bake the crust for 15-20 minutes or until golden. Let it cool completely.",
        "For the filling, whip heavy cream until stiff peaks form.",
        "In another bowl, beat cream cheese, sugar, and vanilla until smooth.",
        "Fold the whipped cream into the cream cheese mixture. Spread this filling over the cooled crust.",
        "Arrange the fresh fruits on top of the filling.",
        "If desired, brush fruits with apricot jam or honey for a glossy finish.",
        "Chill the tart for at least 1 hour before serving.",
        "Enjoy your delicious fruit tart!"
      ],
    ),
    SelectedFood(
      id: "3",
      title: "Sandwich",
      imageUrl:
          "https://images.pexels.com/photos/1647163/pexels-photo-1647163.jpeg?auto=compress&cs=tinysrgb&w=800",
      ingredients: [
        "2 slices of bread (your choice of type)",
        "2 slices of cheese (cheddar, Swiss, etc.)",
        "2 slices of deli meat (ham, turkey, chicken, etc.)",
        "Lettuce leaves",
        "2-3 slices of tomato",
        "Mayonnaise or mustard",
        "Butter or oil for grilling (optional)",
      ],
      instruction: [
        "Spread mayonnaise or mustard on one side of each bread slice.",
        "Place a slice of cheese on one slice of bread.",
        "Add deli meat on top of the cheese.",
        "Layer lettuce leaves and tomato slices on top of the meat.",
        "Cover with the second slice of bread, with the spread side facing down.",
        "Optionally, heat a pan over medium heat and add butter or oil. Grill the sandwich on both sides until golden brown and the cheese is melted.",
        "Remove the sandwich from the pan, cut in half, and serve."
      ],
    ),
    SelectedFood(
      id: "4",
      title: "Pizza",
      imageUrl:
          "https://images.pexels.com/photos/1166120/pexels-photo-1166120.jpeg?auto=compress&cs=tinysrgb&w=800",
      ingredients: [
        "1 pizza dough (store-bought or homemade)",
        "1/2 cup pizza sauce",
        "2 cups shredded mozzarella cheese",
        "1/2 cup sliced pepperoni (or toppings of your choice)",
        "1 teaspoon dried oregano",
        "1 teaspoon garlic powder",
        "1/2 teaspoon red pepper flakes (optional)",
        "Cornmeal or flour for dusting",
        "Olive oil, for brushing",
      ],
      instruction: [
        "Preheat your oven to 475°F (245°C). If you have a pizza stone, place it in the oven to preheat as well.",
        "On a lightly floured surface, stretch or roll out your pizza dough to your desired thickness.",
        "Sprinkle cornmeal on a pizza peel or the back of a baking sheet. Place the stretched dough on the peel or baking sheet.",
        "Spread pizza sauce evenly on the dough, leaving a small border around the edges.",
        "Sprinkle shredded mozzarella cheese over the sauce. Add pepperoni slices or other toppings of your choice.",
        "Season the pizza with dried oregano, garlic powder, and red pepper flakes.",
        "Carefully transfer the pizza from the peel or baking sheet to the preheated pizza stone or baking tray.",
        "Bake in the preheated oven for 12-15 minutes or until the crust is golden and the cheese is bubbly and slightly browned.",
        "Remove the pizza from the oven and let it cool for a few minutes.",
        "Slice and serve hot."
      ],
    ),
    SelectedFood(
      id: "5",
      title: "Chocolate Cake",
      imageUrl:
          "https://images.pexels.com/photos/4109998/pexels-photo-4109998.jpeg?auto=compress&cs=tinysrgb&w=800",
      ingredients: [
        "1 and 3/4 cups (220g) all-purpose flour",
        "3/4 cup (75g) cocoa powder",
        "2 cups (400g) granulated sugar",
        "1 and 1/2 teaspoons baking powder",
        "1 and 1/2 teaspoons baking soda",
        "1 teaspoon salt",
        "2 eggs",
        "1 cup (240ml) whole milk",
        "1/2 cup (120ml) vegetable oil",
        "2 teaspoons vanilla extract",
        "1 cup (240ml) boiling water",
        "1/2 cup (115g) unsalted butter, softened",
        "2/3 cup (65g) cocoa powder",
        "3 cups (360g) powdered sugar",
        "1/3 cup (80ml) milk",
        "1 teaspoon vanilla extract",
      ],
      instruction: [
        "Preheat oven to 350°F (175°C). Grease and flour two 9-inch round cake pans.",
        "In a large bowl, whisk together flour, cocoa powder, sugar, baking powder, baking soda, and salt.",
        "Add eggs, milk, oil, and vanilla extract, and mix until smooth.",
        "Stir in boiling water (batter will be thin). Pour batter into prepared pans.",
        "Bake for 30-35 minutes or until a toothpick inserted into the center comes out clean.",
        "Allow cakes to cool in the pans for 10 minutes, then transfer to a wire rack to cool completely.",
        "To make the frosting, beat butter until creamy. Add cocoa powder and mix well.",
        "Gradually add powdered sugar, alternating with milk, and beat until smooth. Stir in vanilla extract.",
        "Frost the cooled cakes and stack them. Decorate as desired.",
        "Enjoy your delicious chocolate cake!"
      ],
    ),
  ];

  static List<RecipeType> recipeTypes = [
    RecipeType(
      typeName: "Breakfast",
      recipeImage:
          "https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=800",
      recipes: [
        Recipe(
          id: "1",
          name: "Pancakes",
          image:
              "https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=800",
          ingredients: [
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
            "In a large mixing bowl, whisk together the flour, sugar, baking powder, baking soda, and salt.",
            "In another bowl, whisk together the buttermilk, yogurt, egg, and melted butter.",
            "Pour the wet ingredients into the dry ingredients and stir until just combined. It's okay if there are a few lumps.",
            "Preheat a griddle or non-stick skillet over medium heat. If using a griddle, set the temperature to 350°F (175°C).",
            "Lightly grease the cooking surface with cooking spray or a small amount of butter.",
            "Pour 1/4 cup of batter onto the griddle for each pancake. Cook until bubbles form on the surface and the edges look set, then flip and cook until the other side is golden brown.",
            "Remove the pancakes from the griddle and repeat the process with the remaining batter.",
            "Serve the pancakes warm with your favorite toppings, such as maple syrup, fruit, whipped cream, or nuts.",
          ],
        ),
        Recipe(
          id: "2",
          name: "Omelette",
          image:
              "https://images.pexels.com/photos/6294361/pexels-photo-6294361.jpeg?auto=compress&cs=tinysrgb&w=800",
          ingredients: [
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
            "In a large mixing bowl, whisk together the flour, sugar, baking powder, baking soda, and salt.",
            "In another bowl, whisk together the buttermilk, yogurt, egg, and melted butter.",
            "Pour the wet ingredients into the dry ingredients and stir until just combined. It's okay if there are a few lumps.",
            "Preheat a griddle or non-stick skillet over medium heat. If using a griddle, set the temperature to 350°F (175°C).",
            "Lightly grease the cooking surface with cooking spray or a small amount of butter.",
            "Pour 1/4 cup of batter onto the griddle for each pancake. Cook until bubbles form on the surface and the edges look set, then flip and cook until the other side is golden brown.",
            "Remove the pancakes from the griddle and repeat the process with the remaining batter.",
            "Serve the pancakes warm with your favorite toppings, such as maple syrup, fruit, whipped cream, or nuts.",
          ],
        ),
        Recipe(
          id: "3",
          name: "Smoothie",
          image:
              "https://images.pexels.com/photos/775030/pexels-photo-775030.jpeg?auto=compress&cs=tinysrgb&w=800",
          ingredients: [
            "1 cup fresh spinach",
            "1 banana, sliced",
            "1/2 cup frozen berries (such as strawberries, blueberries, or raspberries)",
            "1/2 cup Greek yogurt",
            "1 cup almond milk (or any milk of your choice)",
            "1 tablespoon honey or to taste (optional)",
            "1/2 cup ice cubes (optional)"
          ],
          instructions: [
            "Add the spinach, banana, frozen berries, Greek yogurt, almond milk, and honey (if using) to the blender.",
            "If you prefer a colder smoothie, add the ice cubes.",
            "Blend on high speed until all the ingredients are well combined and the smoothie reaches your desired consistency.",
            "Taste and adjust sweetness if necessary.",
            "Pour the smoothie into a glass and serve immediately."
          ],
        ),
      ],
    ),
    RecipeType(
      typeName: "Lunch",
      recipeImage:
          "https://images.pexels.com/photos/2347311/pexels-photo-2347311.jpeg?auto=compress&cs=tinysrgb&w=800",
      recipes: [
        Recipe(
          id: "4",
          name: "Spaghetti",
          image:
              "https://images.pexels.com/photos/2347311/pexels-photo-2347311.jpeg?auto=compress&cs=tinysrgb&w=800",
          ingredients: [
            "8 oz (225g) spaghetti",
            "2 tablespoons olive oil",
            "3 cloves garlic, minced",
            "1 can (14 oz) crushed tomatoes",
            "1 teaspoon dried oregano",
            "1 teaspoon dried basil",
            "1/2 teaspoon red pepper flakes (optional)",
            "Salt and black pepper to taste",
            "Fresh basil or parsley for garnish",
            "Grated Parmesan cheese for serving"
          ],
          instructions: [
            "Cook the spaghetti according to package instructions in a large pot of salted boiling water. Drain and set aside.",
            "In a large skillet, heat olive oil over medium heat. Add minced garlic and sauté until fragrant.",
            "Pour in the crushed tomatoes and add dried oregano, dried basil, red pepper flakes (if using), salt, and black pepper. Stir to combine.",
            "Simmer the sauce for about 15-20 minutes, allowing the flavors to meld and the sauce to thicken slightly.",
            "Add the cooked spaghetti to the sauce, tossing to coat the pasta evenly with the sauce.",
            "Serve the spaghetti in individual plates or bowls, garnished with fresh basil or parsley, and grated Parmesan cheese on top."
          ],
        ),
        Recipe(
          id: "5",
          name: "Salad",
          image:
              "https://images.pexels.com/photos/2097090/pexels-photo-2097090.jpeg?auto=compress&cs=tinysrgb&w=800",
          ingredients: [
            "4 cups mixed greens (lettuce, spinach, arugula, etc.)",
            "1 cup cherry tomatoes, halved",
            "1 cucumber, sliced",
            "1/2 red onion, thinly sliced",
            "1/4 cup feta cheese, crumbled",
            "1/4 cup olives, pitted and sliced",
            "1/4 cup nuts (walnuts, almonds, or pecans), optional",
            "3 tablespoons olive oil",
            "1 tablespoon balsamic vinegar",
            "1 teaspoon honey or maple syrup",
            "1 teaspoon Dijon mustard",
            "Salt and pepper to taste"
          ],
          instructions: [
            "In a large bowl, combine the mixed greens, cherry tomatoes, cucumber, red onion, feta cheese, and olives.",
            "In a small bowl, whisk together the olive oil, balsamic vinegar, honey or maple syrup, Dijon mustard, salt, and pepper to create the dressing.",
            "Drizzle the dressing over the salad and toss gently to coat all the ingredients evenly.",
            "Sprinkle nuts on top of the salad if desired.",
            "Serve the salad immediately, or chill in the refrigerator for later serving."
          ],
        ),
        Recipe(
          id: "6",
          name: "Sandwich",
          image:
              "https://images.pexels.com/photos/1647163/pexels-photo-1647163.jpeg?auto=compress&cs=tinysrgb&w=800",
          ingredients: [
            "2 slices of bread (your choice of type)",
            "2 slices of cheese (cheddar, Swiss, etc.)",
            "2 slices of deli meat (ham, turkey, chicken, etc.)",
            "Lettuce leaves",
            "2-3 slices of tomato",
            "Mayonnaise or mustard",
            "Butter or oil for grilling (optional)",
          ],
          instructions: [
            "Spread mayonnaise or mustard on one side of each bread slice.",
            "Place a slice of cheese on one slice of bread.",
            "Add deli meat on top of the cheese.",
            "Layer lettuce leaves and tomato slices on top of the meat.",
            "Cover with the second slice of bread, with the spread side facing down.",
            "Optionally, heat a pan over medium heat and add butter or oil. Grill the sandwich on both sides until golden brown and the cheese is melted.",
            "Remove the sandwich from the pan, cut in half, and serve."
          ],
        ),
      ],
    ),
    RecipeType(
      typeName: "Dinner",
      recipeImage:
          "https://images.pexels.com/photos/2338407/pexels-photo-2338407.jpeg?auto=compress&cs=tinysrgb&w=800",
      recipes: [
        Recipe(
          id: "7",
          name: "Grilled Chicken",
          image:
              "https://images.pexels.com/photos/2338407/pexels-photo-2338407.jpeg?auto=compress&cs=tinysrgb&w=800",
          ingredients: [
            "4 boneless, skinless chicken breasts",
            "2 tablespoons olive oil",
            "2 teaspoons lemon juice",
            "2 cloves garlic, minced",
            "1 teaspoon dried oregano",
            "1 teaspoon dried thyme",
            "Salt and black pepper to taste",
            "Optional: 1 teaspoon paprika for added flavor",
          ],
          instructions: [
            "In a small bowl, whisk together olive oil, lemon juice, minced garlic, dried oregano, dried thyme, salt, black pepper, and optional paprika.",
            "Place chicken breasts in a shallow dish or a resealable plastic bag. Pour the marinade over the chicken, ensuring it's well-coated. Marinate for at least 30 minutes or refrigerate for up to 8 hours for more flavor.",
            "Preheat the grill to medium-high heat.",
            "Remove the chicken from the marinade, letting any excess drip off, and place them on the preheated grill.",
            "Grill the chicken for about 6-8 minutes per side or until the internal temperature reaches 165°F (74°C) and the chicken is cooked through.",
            "Remove the chicken from the grill and let it rest for a few minutes before serving.",
            "Serve the grilled chicken with your favorite side dishes and enjoy!"
          ],
        ),
        Recipe(
          id: "8",
          name: "Stir-Fry",
          image:
              "https://images.pexels.com/photos/262897/pexels-photo-262897.jpeg?auto=compress&cs=tinysrgb&w=800",
          ingredients: [
            "2 cups mixed vegetables (broccoli, bell peppers, carrots, snap peas, etc.), chopped",
            "1 tablespoon vegetable oil",
            "2 cloves garlic, minced",
            "1 teaspoon ginger, grated",
            "1 tablespoon soy sauce",
            "1 tablespoon oyster sauce",
            "1 teaspoon sesame oil",
            "1 tablespoon cornstarch (optional, for thickening)",
            "Cooked rice or noodles for serving"
          ],
          instructions: [
            "Heat vegetable oil in a wok or large skillet over medium-high heat.",
            "Add minced garlic and grated ginger, and stir-fry for about 30 seconds until fragrant.",
            "Add mixed vegetables to the wok and stir-fry for 3-5 minutes or until they are tender-crisp.",
            "In a small bowl, mix together soy sauce, oyster sauce, and sesame oil. Pour the sauce over the vegetables and stir to coat evenly.",
            "If you prefer a thicker sauce, mix cornstarch with a little water to create a slurry and add it to the wok. Stir until the sauce thickens.",
            "Remove from heat and serve the vegetable stir-fry over cooked rice or noodles.",
            "Garnish with sesame seeds or chopped green onions if desired.",
            "Enjoy your delicious vegetable stir-fry!"
          ],
        ),
        Recipe(
          id: "9",
          name: "Pizza",
          image:
              "https://images.pexels.com/photos/1166120/pexels-photo-1166120.jpeg?auto=compress&cs=tinysrgb&w=800",
          ingredients: [
            "1 pizza dough (store-bought or homemade)",
            "1/2 cup pizza sauce",
            "2 cups shredded mozzarella cheese",
            "1/2 cup sliced pepperoni (or toppings of your choice)",
            "1 teaspoon dried oregano",
            "1 teaspoon garlic powder",
            "1/2 teaspoon red pepper flakes (optional)",
            "Cornmeal or flour for dusting",
            "Olive oil, for brushing",
          ],
          instructions: [
            "Preheat your oven to 475°F (245°C). If you have a pizza stone, place it in the oven to preheat as well.",
            "On a lightly floured surface, stretch or roll out your pizza dough to your desired thickness.",
            "Sprinkle cornmeal on a pizza peel or the back of a baking sheet. Place the stretched dough on the peel or baking sheet.",
            "Spread pizza sauce evenly on the dough, leaving a small border around the edges.",
            "Sprinkle shredded mozzarella cheese over the sauce. Add pepperoni slices or other toppings of your choice.",
            "Season the pizza with dried oregano, garlic powder, and red pepper flakes.",
            "Carefully transfer the pizza from the peel or baking sheet to the preheated pizza stone or baking tray.",
            "Bake in the preheated oven for 12-15 minutes or until the crust is golden and the cheese is bubbly and slightly browned.",
            "Remove the pizza from the oven and let it cool for a few minutes.",
            "Slice and serve hot."
          ],
        ),
      ],
    ),
    RecipeType(
      typeName: "Dessert",
      recipeImage:
          "https://images.pexels.com/photos/4109998/pexels-photo-4109998.jpeg?auto=compress&cs=tinysrgb&w=800",
      recipes: [
        Recipe(
          id: "10",
          name: "Chocolate Cake",
          image:
              "https://images.pexels.com/photos/4109998/pexels-photo-4109998.jpeg?auto=compress&cs=tinysrgb&w=800",
          ingredients: [
            "1 and 3/4 cups (220g) all-purpose flour",
            "3/4 cup (75g) cocoa powder",
            "2 cups (400g) granulated sugar",
            "1 and 1/2 teaspoons baking powder",
            "1 and 1/2 teaspoons baking soda",
            "1 teaspoon salt",
            "2 eggs",
            "1 cup (240ml) whole milk",
            "1/2 cup (120ml) vegetable oil",
            "2 teaspoons vanilla extract",
            "1 cup (240ml) boiling water",
            "1/2 cup (115g) unsalted butter, softened",
            "2/3 cup (65g) cocoa powder",
            "3 cups (360g) powdered sugar",
            "1/3 cup (80ml) milk",
            "1 teaspoon vanilla extract",
          ],
          instructions: [
            "Preheat oven to 350°F (175°C). Grease and flour two 9-inch round cake pans.",
            "In a large bowl, whisk together flour, cocoa powder, sugar, baking powder, baking soda, and salt.",
            "Add eggs, milk, oil, and vanilla extract, and mix until smooth.",
            "Stir in boiling water (batter will be thin). Pour batter into prepared pans.",
            "Bake for 30-35 minutes or until a toothpick inserted into the center comes out clean.",
            "Allow cakes to cool in the pans for 10 minutes, then transfer to a wire rack to cool completely.",
            "To make the frosting, beat butter until creamy. Add cocoa powder and mix well.",
            "Gradually add powdered sugar, alternating with milk, and beat until smooth. Stir in vanilla extract.",
            "Frost the cooled cakes and stack them. Decorate as desired.",
            "Enjoy your delicious chocolate cake!"
          ],
        ),
        Recipe(
          id: "11",
          name: "Ice Cream",
          image:
              "https://images.pexels.com/photos/1362534/pexels-photo-1362534.jpeg?auto=compress&cs=tinysrgb&w=800",
          ingredients: [
            "2 cups heavy cream",
            "1 cup whole milk",
            "3/4 cup granulated sugar",
            "1 tablespoon pure vanilla extract",
            "Pinch of salt",
          ],
          instructions: [
            "In a mixing bowl, combine heavy cream, whole milk, sugar, vanilla extract, and a pinch of salt. Stir until the sugar is dissolved.",
            "Pour the mixture into an ice cream maker and churn according to the manufacturer's instructions.",
            "Once the ice cream reaches a soft-serve consistency, transfer it to a lidded container and freeze for at least 4 hours or until firm.",
            "Serve the vanilla ice cream in bowls or cones. Enjoy!"
          ],
        ),
        Recipe(
          id: "12",
          name: "Fruit Tart",
          image:
              "https://images.pexels.com/photos/2693447/pexels-photo-2693447.jpeg?auto=compress&cs=tinysrgb&w=800",
          ingredients: [
            "1 and 1/2 cups all-purpose flour",
            "1/2 cup unsalted butter, chilled and diced",
            "1/4 cup granulated sugar",
            "1 egg yolk",
            "1-2 tablespoons cold water",
            "1 cup heavy cream",
            "8 ounces cream cheese, softened",
            "1/3 cup granulated sugar",
            "1 teaspoon vanilla extract",
            "Assorted fresh fruits (berries, kiwi slices, etc.)",
            "Apricot jam or honey for glazing (optional)"
          ],
          instructions: [
            "In a mixing bowl, combine flour, butter, and sugar. Rub together with your fingers until the mixture resembles coarse crumbs.",
            "Add egg yolk and cold water. Mix until it forms a dough. Wrap in plastic wrap and refrigerate for 30 minutes.",
            "Preheat oven to 375°F (190°C).",
            "Roll out the dough on a floured surface and press it into a tart pan. Prick the bottom with a fork.",
            "Bake the crust for 15-20 minutes or until golden. Let it cool completely.",
            "For the filling, whip heavy cream until stiff peaks form.",
            "In another bowl, beat cream cheese, sugar, and vanilla until smooth.",
            "Fold the whipped cream into the cream cheese mixture. Spread this filling over the cooled crust.",
            "Arrange the fresh fruits on top of the filling.",
            "If desired, brush fruits with apricot jam or honey for a glossy finish.",
            "Chill the tart for at least 1 hour before serving.",
            "Enjoy your delicious fruit tart!"
          ],
        ),
      ],
    ),
    RecipeType(
      typeName: "Appetizers",
      recipeImage:
          "https://images.pexels.com/photos/12958005/pexels-photo-12958005.jpeg?auto=compress&cs=tinysrgb&w=800",
      recipes: [
        Recipe(
          id: "13",
          name: "Guacamole",
          image:
              "https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg?auto=compress&cs=tinysrgb&w=800",
          ingredients: [
            "3 ripe avocados",
            "1 small onion, finely diced",
            "1-2 tomatoes, diced",
            "1/4 cup fresh cilantro, chopped",
            "1-2 cloves garlic, minced",
            "1 lime, juiced",
            "Salt and pepper to taste",
          ],
          instructions: [
            "Cut avocados in half, remove the seeds, and scoop the flesh into a bowl.",
            "Mash the avocados with a fork or potato masher, leaving some chunks for texture.",
            "Add diced onion, tomatoes, cilantro, minced garlic, and lime juice. Mix well.",
            "Season with salt and pepper to taste. Adjust lime juice or seasoning as needed.",
            "Serve the guacamole with tortilla chips or as a topping for your favorite dishes.",
          ],
        ),
        Recipe(
          id: "14",
          name: "Bruschetta",
          image:
              "https://images.pexels.com/photos/4969892/pexels-photo-4969892.jpeg?auto=compress&cs=tinysrgb&w=800",
          ingredients: [
            "4-5 ripe tomatoes, diced",
            "1/4 cup fresh basil, chopped",
            "2 cloves garlic, minced",
            "1 tablespoon balsamic vinegar",
            "3 tablespoons extra virgin olive oil",
            "Salt and pepper to taste",
            "Baguette slices, toasted",
          ],
          instructions: [
            "In a bowl, combine diced tomatoes, chopped basil, minced garlic, balsamic vinegar, and olive oil.",
            "Season with salt and pepper to taste. Mix well.",
            "Let the bruschetta mixture sit for at least 15 minutes to allow the flavors to meld.",
            "Spoon the mixture onto toasted baguette slices and serve immediately.",
          ],
        ),
        // Add more appetizer recipes as needed
      ],
    ),
    RecipeType(
      typeName: "Soups",
      recipeImage:
          "https://images.pexels.com/photos/1872903/pexels-photo-1872903.jpeg?auto=compress&cs=tinysrgb&w=800",
      recipes: [
        Recipe(
          id: "15",
          name: "Tomato Basil Soup",
          image:
              "https://images.pexels.com/photos/4062279/pexels-photo-4062279.jpeg?auto=compress&cs=tinysrgb&w=800",
          ingredients: [
            "2 tablespoons olive oil",
            "1 onion, diced",
            "2 cloves garlic, minced",
            "28 oz (800g) canned crushed tomatoes",
            "1 teaspoon dried basil",
            "1/2 teaspoon dried oregano",
            "4 cups vegetable broth",
            "Salt and pepper to taste",
            "1/2 cup heavy cream (optional)",
            "Fresh basil leaves for garnish",
          ],
          instructions: [
            "In a large pot, heat olive oil over medium heat. Add diced onion and sauté until translucent.",
            "Add minced garlic and sauté for an additional 1-2 minutes until fragrant.",
            "Pour in the canned crushed tomatoes, dried basil, and dried oregano. Stir to combine.",
            "Add vegetable broth and season with salt and pepper. Bring the soup to a simmer.",
            "Allow the soup to simmer for at least 15-20 minutes to allow the flavors to meld.",
            "If desired, stir in heavy cream for a creamy texture.",
            "Serve the tomato basil soup hot, garnished with fresh basil leaves.",
          ],
        ),
        Recipe(
          id: "16",
          name: "Chicken Noodle Soup",
          image:
              "https://images.pexels.com/photos/2532442/pexels-photo-2532442.jpeg?auto=compress&cs=tinysrgb&w=800",
          ingredients: [
            "1 tablespoon olive oil",
            "1 onion, chopped",
            "2 carrots, sliced",
            "2 celery stalks, sliced",
            "2 cloves garlic, minced",
            "6 cups chicken broth",
            "1 bay leaf",
            "1 teaspoon dried thyme",
            "2 cups cooked chicken, shredded",
            "1 cup egg noodles",
            "Salt and pepper to taste",
            "Fresh parsley for garnish",
          ],
          instructions: [
            "In a large pot, heat olive oil over medium heat. Add chopped onion, sliced carrots, and sliced celery. Sauté until vegetables are softened.",
            "Add minced garlic and sauté for an additional 1-2 minutes until fragrant.",
            "Pour in chicken broth and add bay leaf and dried thyme. Bring the soup to a simmer.",
            "Add shredded cooked chicken and egg noodles. Cook until noodles are tender.",
            "Season the soup with salt and pepper to taste.",
            "Remove the bay leaf and discard. Serve the chicken noodle soup hot, garnished with fresh parsley.",
          ],
        ),
        // Add more soup recipes as needed
      ],
    ),
    RecipeType(
      typeName: "Sides",
      recipeImage:
          "https://images.pexels.com/photos/17965451/pexels-photo-17965451/free-photo-of-choice-at-food-court.jpeg?auto=compress&cs=tinysrgb&w=800",
      recipes: [
        Recipe(
          id: "17",
          name: "Garlic Parmesan Roasted Potatoes",
          image:
              "https://images.pexels.com/photos/8250190/pexels-photo-8250190.jpeg?auto=compress&cs=tinysrgb&w=800",
          ingredients: [
            "2 lbs (900g) baby potatoes, halved",
            "3 tablespoons olive oil",
            "4 cloves garlic, minced",
            "1/4 cup grated Parmesan cheese",
            "1 teaspoon dried rosemary",
            "Salt and black pepper to taste",
            "Chopped fresh parsley for garnish",
          ],
          instructions: [
            "Preheat the oven to 400°F (200°C).",
            "In a large bowl, toss halved baby potatoes with olive oil, minced garlic, Parmesan cheese, dried rosemary, salt, and black pepper.",
            "Spread the potatoes on a baking sheet in a single layer.",
            "Roast in the preheated oven for 25-30 minutes or until the potatoes are golden and crispy.",
            "Remove from the oven, garnish with chopped fresh parsley, and serve hot.",
          ],
        ),
        Recipe(
          id: "18",
          name: "Creamy Spinach Dip",
          image:
              "https://images.pexels.com/photos/6252725/pexels-photo-6252725.jpeg?auto=compress&cs=tinysrgb&w=800",
          ingredients: [
            "1 cup frozen chopped spinach, thawed and drained",
            "1 cup cream cheese, softened",
            "1/2 cup mayonnaise",
            "1/2 cup sour cream",
            "1 cup shredded mozzarella cheese",
            "1/4 cup grated Parmesan cheese",
            "1 teaspoon garlic powder",
            "Salt and black pepper to taste",
            "Bread or veggies for dipping",
          ],
          instructions: [
            "In a bowl, combine thawed and drained chopped spinach, softened cream cheese, mayonnaise, sour cream, shredded mozzarella cheese, grated Parmesan cheese, garlic powder, salt, and black pepper.",
            "Mix until all ingredients are well combined and smooth.",
            "Transfer the mixture to a serving dish and refrigerate for at least 1 hour before serving.",
            "Serve the creamy spinach dip with bread or veggies for dipping.",
          ],
        ),
        // Add more side dish recipes as needed
      ],
    ),
    RecipeType(
      typeName: "Beverages",
      recipeImage:
          "https://images.pexels.com/photos/2531184/pexels-photo-2531184.jpeg?auto=compress&cs=tinysrgb&w=800",
      recipes: [
        Recipe(
          id: "19",
          name: "Mojito",
          image:
              "https://images.pexels.com/photos/4021887/pexels-photo-4021887.jpeg?auto=compress&cs=tinysrgb&w=800",
          ingredients: [
            "10 fresh mint leaves",
            "1/2 lime, cut into wedges",
            "2 tablespoons white sugar",
            "1 cup ice cubes",
            "1 1/2 oz (45ml) white rum",
            "1/2 cup club soda",
            "Lime slices and mint sprigs for garnish",
          ],
          instructions: [
            "Place mint leaves and 1 lime wedge into a glass. Use a muddler to crush the mint and lime to release the mint's flavor.",
            "Add 2 more lime wedges and the sugar, and muddle again to release the lime juice. Do not strain the mixture.",
            "Fill the glass almost to the top with ice. Pour the rum over the ice, and fill the glass with club soda. Stir, taste, and add more sugar if desired.",
            "Garnish with lime slices and mint sprigs. Serve immediately and enjoy your refreshing mojito!",
          ],
        ),
        Recipe(
          id: "20",
          name: "Iced Coffee",
          image:
              "https://images.pexels.com/photos/1162455/pexels-photo-1162455.jpeg?auto=compress&cs=tinysrgb&w=800",
          ingredients: [
            "1 cup strong brewed coffee, cooled",
            "1/2 cup milk of your choice",
            "2 tablespoons sugar (adjust to taste)",
            "Ice cubes",
            "Whipped cream (optional)",
            "Chocolate syrup (optional)",
          ],
          instructions: [
            "In a glass, combine strong brewed coffee, milk, and sugar. Stir well until the sugar is dissolved.",
            "Add ice cubes to the coffee mixture.",
            "Optional: Top with whipped cream and drizzle with chocolate syrup for extra indulgence.",
            "Stir and enjoy your homemade iced coffee!",
          ],
        ),
        // Add more beverage recipes as needed
      ],
    ),
    // Add more RecipeType with recipes as needed
  ];
}

class FavoriteManager {
  static final ValueNotifier<List<String>> favoriteRecipeIds =
      ValueNotifier<List<String>>([]);
}

class FavoriteDocId {
  static final ValueNotifier<List<String>> favoriteDocId =
      ValueNotifier<List<String>>([]);
}

class FavoriteScreenData {
  static final ValueNotifier<List<Favorite>> favorite =
      ValueNotifier<List<Favorite>>([]);
}
