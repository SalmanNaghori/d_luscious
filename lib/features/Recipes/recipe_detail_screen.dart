import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

import 'package:d_luscious/core/constant/app_string.dart';
import 'package:d_luscious/core/constant/colors_const.dart';
import 'package:d_luscious/features/Recipes/widget/detail_image_widget.dart';
import 'package:d_luscious/features/Recipes/widget/instruction_widget.dart';

import 'widget/ingredient_widget.dart';

class RecipeDetailScreen extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String id;
  final List<String> ingredients;
  final List<String> instruction;
  const RecipeDetailScreen({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.id,
    required this.ingredients,
    required this.instruction,
  }) : super(key: key);
  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            decorationStyle: TextDecorationStyle.double,
            decorationThickness: 1.5,
          ),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
        // backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: widget.title,
              child: DetailScreenImageWidget(
                image: widget.imageUrl,
                width: double.infinity,
                height: 300,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              AppString.ingredients,
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: "chewy",
                  color: ConstColor.primaryColor),
            ),
            const SizedBox(height: 10),
            IngredientWidget(ingredients: widget.ingredients),
            const SizedBox(height: 20),
            const Text(
              AppString.instruction,
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: "chewy",
                  color: ConstColor.primaryColor),
            ),
            const SizedBox(height: 10),
            InstructionWidget(ingredients: widget.instruction),
            Link(
                target: LinkTarget.blank,
                uri: Uri.parse('https://www.youtube.com/watch?v=02PBp_tu14s'),
                builder: (context, followlink) => GestureDetector(
                      onTap: followlink,
                      child: const Text(
                        'Open Link',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )),
          ],
        ),
      ),
    );
  }
}
