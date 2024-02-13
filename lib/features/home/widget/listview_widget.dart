// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:d_luscious/features/d_luscious.dart';
import 'package:d_luscious/features/home/widget/single_circle_shimmer_widget.dart';
import 'package:d_luscious/features/home/widget/single_circle_widget.dart';
import 'package:d_luscious/features/model/recipe_model.dart';

class ListViewWidget extends StatelessWidget {
  final List<String> id;
  final String selectedId;
  final Function? selectedFood;

  ListViewWidget({
    Key? key,
    required this.id,
    required this.selectedId,
    this.selectedFood,
  }) : super(key: key);
  Future<List<RecipeType>> fetchRecipeTypes() async {
    recipeName.clear(); // Clear the list before populating it with new names

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("recipeTypes")
        .where(FieldPath.documentId, whereIn: id)
        .get();

    List<RecipeType> recipeTypes = querySnapshot.docs.map((doc) {
      RecipeType recipeType = RecipeType.fromFirestore(doc.data());

      if (recipeName.contains(recipeType.typeName)) {
        print(recipeType.typeName);
      } else {
        recipeName.add(recipeType.typeName ?? "");
      }

      return recipeType;
    }).toList();

    // Sort the recipeTypes list based on a property, for example, typeName
    // recipeTypes.sort((a, b) => a.typeName!.compareTo(b.typeName ?? ""));

    return recipeTypes;
  }

  final List<String> recipeName = [];
  final String selectedRecipeName = "";
  ValueNotifier<String> selectedFoodIndex = ValueNotifier<String>("");

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 120,
      child: FutureBuilder<List<RecipeType>>(
        future: fetchRecipeTypes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemCount: 5, // Adjust the number of shimmer items
                itemBuilder: (context, index) {
                  return SingleCircleWidgetShimmer(
                    typeName: "",
                    radius: 35,
                    fontSize: 18,
                  ); // Create a shimmer widget
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Error loading data: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Text('No data available.');
          } else {
            List<RecipeType> recipeTypes = snapshot.data!;
            return ListView.builder(
              // physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: recipeTypes.length,
              itemBuilder: (context, index) {
                RecipeType recipeType = recipeTypes[index];

                return ValueListenableBuilder(
                    valueListenable: selectedFoodIndex,
                    builder: (context, index, _) {
                      return SingleCircleWidget(
                        index: index,
                        listOfFood: recipeName,
                        fontSize: 18,
                        radius: 35,
                        recipeType: recipeType,
                        selectedFood: (value) {
                          selectedFoodIndex.value = value;
                          MyApp.logger.e(value);
                          MyApp.logger.e(recipeName);
                          check(value);
                        },
                      );
                    });
              },
            );
          }
        },
      ),
    );
  }

  check(String selectedRecipeName) {
    for (int i = 0; i < recipeName.length; i++) {
      if (recipeName[i] == selectedRecipeName) {
        // MyApp.logger.f("is selected$i");
        // MyApp.logger.f("is selected${recipeName[i]}");
        selectedFood!(i);
      } else {
        MyApp.logger.f(recipeName[i]);
      }
    }
  }
}
