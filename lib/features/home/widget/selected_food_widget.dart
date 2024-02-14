import 'dart:async';

import 'package:d_luscious/core/constant/const.dart';
import 'package:d_luscious/core/widgets/network_image.dart';
import 'package:d_luscious/features/Recipes/recipe_detail_screen.dart';
import 'package:d_luscious/features/model/selected_food.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SelectedFoodWidget extends StatefulWidget {
  final ValueNotifier<int> pageNo;
  final ScrollController controller;

  const SelectedFoodWidget({
    Key? key,
    required this.pageNo,
    required this.controller,
  }) : super(key: key);

  @override
  State<SelectedFoodWidget> createState() => _SelectedFoodWidgetState();
}

class _SelectedFoodWidgetState extends State<SelectedFoodWidget> {
  late PageController pageController;
  late Timer? carouselTimer;

  @override
  void initState() {
    pageController = PageController(
        initialPage: widget.pageNo.value, viewportFraction: 0.85);

    carouselTimer = _getTimer();

    widget.controller.addListener(() {
      if (widget.controller.position.userScrollDirection ==
          ScrollDirection.reverse) {
        // _toggleBottomAppBarVisibility(false);
      } else {
        print("_toggleBottomAppBarVisibility");
        // _toggleBottomAppBarVisibility(true);
      }
    });
    super.initState();
  }

  Timer _getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      int nextPage = (pageController.page!.toInt() + 1) % 5;
      pageController.animateToPage(
        nextPage,
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOutCirc,
      );
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: widget.controller,
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (index) {
                widget.pageNo.value = index; // Update widget.pageNo value
              },
              itemBuilder: (_, index) {
                return AnimatedBuilder(
                  animation: pageController,
                  builder: (ctx, child) {
                    return GestureDetector(
                      onTap: () {
                        _gotoSelectedFoodDetailsScreen(
                            context, Const.selectedFood[index]);
                      },
                      onPanDown: (_) {
                        carouselTimer?.cancel();
                        carouselTimer = null;
                      },
                      onPanCancel: () {
                        carouselTimer = _getTimer();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: CachedImage(
                          image: Const.selectedFood[index].imageUrl,
                          height: 200,
                          width: 200,
                          redius: 10,
                        ),
                      ),
                    );
                  },
                );
              },
              itemCount: 5,
            ),
          ),
          const SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => ValueListenableBuilder(
                valueListenable: widget.pageNo,
                builder: (context, currentPageCircle, _) {
                  return GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.all(2.0),
                      child: Icon(
                        Icons.circle,
                        size: 12.0,
                        color: currentPageCircle == index
                            ? Colors.indigoAccent
                            : Colors.grey.shade300,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _gotoSelectedFoodDetailsScreen(
      BuildContext context, SelectedFood model) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecipeDetailScreen(
          title: model.title,
          id: model.id,
          imageUrl: model.imageUrl,
          ingredients: model.ingredients,
          instruction: model.instruction,
        ),
      ),
    );
  }
}
