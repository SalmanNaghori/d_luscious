import 'dart:io';

import 'package:clippy_flutter/arc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/link.dart';

class springrolls extends StatelessWidget {
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
                    "https://as2.ftcdn.net/v2/jpg/02/14/90/07/1000_F_214900725_8X4DfrIsIdScBl4hDZ3Uqv5WywlOPhCN.jpg")),
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
                                  "40 Minutes",
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
                              "Spring Rolls",
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
                            "For sheet/Wrapper:\n • 2 cup plain flour/Maida\n • 2 tablespoons corn flour\n • 2½ Cup water\n • ½ teaspoon salt\n For Stuffing:\n • 2 tablespoons oil\n • 3 cloves garlic\n • 2 chillies\n • 2 tablespoons spring onion\n • ½ onion\n"),
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
                          "how to prepare spring roll wrapper:\n • firstly, in a large bowl take 2 cup maida, 2 tbsp corn flour and ½ tsp salt.\n • add 2½ cup water and mix well using a whisk.\n • whisk until a smooth lump-free batter is formed adding water as required.\n • now grease the pan and pour a ladleful of batter on a hot pan.\n • swirl once making sure the batter is uniformly spread.\n • cook for a minute or until the sheet is cooked without browning.\n • now flip over gently and continue to cook.\n • finally, spring roll wrapper is ready. you can cover and use to prepare spring rolls.\n how to prepare veg stuffing:\n • firstly, in a large wok, heat 2 tbsp oil. saute 3 clove garlic, 2 chilli and 2 tbsp spring onion.\n • add ½ onion and stir fry on high flame.\n • now add 1 carrot, 2 cup cabbage, 5 beans, ½ capsicum.\n • stir fry without losing the crunchiness of vegetables.\n • further, add 2 tbsp vinegar, 2 tbsp soy sauce, 2 tsp chilli sauce, ¼ tsp pepper powder and ½ tsp salt.\n • mix well making sure everything is well combined. stuffing is ready.\n how to fold and fry spring roll:\n • firstly, take a prepared wrapper and place a tbsp of prepared veg stuffing.\n • rub a tsp of maida paste around the edge. maida helps to seal the roll.\n • now roll and fold the sides making sure the roll is sealed tight.\n • deep fry in hot oil, keeping the flame on low.\n • stir occasionally, until the roll turns golden brown and crisp.\n • drain off removing excess oil.\n • finally, enjoy veg spring roll with sweet chilli sauce.\n",
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
                                'https://www.youtube.com/watch?v=JTtp-nHHvuc'),
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
