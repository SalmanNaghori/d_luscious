import 'dart:io';

import 'package:clippy_flutter/arc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/link.dart';

class veghakkanoodles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(top: 5),
        child: ListView(
          children: [
            Padding(
                padding: EdgeInsets.all(10),
                child: Image.network(
                    "https://previews.123rf.com/images/espies/espies2111/espies211102772/178163328-schezwan-noodles-or-szechwan-vegetable-hakka-noodles-or-chow-mein-is-a-popular-indo-chinese-recipes-.jpg")),
            Arc(
              edge: Edge.TOP,
              arcType: ArcType.CONVEY,
              height: 30,
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 30, bottom: 10),
                        child: Row(
                          children: [
                            RatingBar.builder(
                              initialRating: 4,
                              minRating: 1,
                              direction: Axis.horizontal,
                              itemCount: 5,
                              itemSize: 18,
                              itemPadding: EdgeInsets.symmetric(horizontal: 4),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.red,
                              ),
                              onRatingUpdate: (index) {},
                            ),
                            Text(
                              "rating",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Duration:",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                              textAlign: TextAlign.justify,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Icon(
                                    CupertinoIcons.clock,
                                  ),
                                ),
                                Text(
                                  "30-40 Minutes",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic),
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 10,
                          bottom: 20,
                        ),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Veg Hakka Noodles",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      new Container(
                        alignment: Alignment.centerLeft,
                        child: new Text(
                          "Ingrediants",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Text(
                            "• 8 cup water\n •	2 tbsp oil\n • 1 tsp salt\n •	2 pack noodles\n •	cold water\n •	2 tbsp oil\n •	2 clove garlic\n •	1 chilli\n •	2-inch ginger\n •	2 tbsp spring onion\n •	½ onion\n •	½ capsicum\n •	½ cabbage\n •	1 carrot\n •	2 tbsp chilli sauce\n •	2 tbsp soy sauce\n •	2 tbsp tomato sauce\n •	½ tsp salt\n •	½ tsp pepper powder\n •	2 tbsp vinegar\n"),
                      ),
                      new Container(
                        alignment: Alignment.bottomLeft,
                        child: new Text(
                          "Directions",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Text(
                          "• firstly, in a large vessel take 8 cup water, 2 tbsp oil, 1 tsp salt.\n • once the water comes to a boil, add 2 pack noodles.\n •	stir and boil for 3 minutes or until the noodles turn al dente. refer package instructions to know the cooking time.\n •	drain off the noodles and rinse with cold water to stop the cooking process. keep aside.\n •	in a large wok heat 2 tbsp oil and add 2 clove garlic, 1 chilli, 2 inch ginger and 2 tbsp spring onion.\n •	stir fry on high flame.\n •	now add ½ onion, ½ capsicum, ½ cabbage, 1 carrot, 2 beans. stir fry until the vegetables shrink slightly.\n •	further add 2 tbsp chilli sauce, 2 tbsp soy sauce, 2 tbsp tomato sauce, ½ tsp salt and ½ tsp pepper powder.\n •	stir fry until the sauces well combine.\n •	now add boiled noodles, 2 tbsp vinegar and stir fry.\n • also add few bean sprouts and 2 tbsp spring onions. stir fry.\n • finally, enjoy veg hakka noodles garnished with more spring onions.\n",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 30),
                        child: Link(
                            target: LinkTarget.blank,
                            uri: Uri.parse(
                                'https://www.youtube.com/watch?v=7kwmmK4FhCI'),
                            builder: (context, followlink) => GestureDetector(
                                  onTap: followlink,
                                  child: Text(
                                    'open link',
                                    style: TextStyle(
                                      fontSize: 32,
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
