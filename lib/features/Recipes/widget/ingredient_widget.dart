import 'package:flutter/material.dart';
import '../../../core/constant/colors_const.dart';

class IngredientWidget extends StatelessWidget {
  const IngredientWidget({
    Key? key,
    required this.ingredients,
  }) : super(key: key);

  final List<String> ingredients;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ConstColor.amberColor,
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(horizontal: 50),
      height: 300,
      padding: const EdgeInsets.all(5),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: ingredients.length,
          itemBuilder: (ctx, index) {
            return Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: Text("${index + 1}"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: ConstColor.orangeLight,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(ingredients[index]),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
