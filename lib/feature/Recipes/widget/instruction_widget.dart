import 'package:flutter/material.dart';
import '../../../core/constant/colors_const.dart';

class InstructionWidget extends StatelessWidget {
  const InstructionWidget({
    Key? key,
    required this.ingredients,
  }) : super(key: key);

  final List<String> ingredients;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1),
          color: Colors.white,
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
                    backgroundColor: Colors.orange[200],
                    child: Text(
                      "${index + 1}",
                      style: TextStyle(color: ConstColor.blackColor),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
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
