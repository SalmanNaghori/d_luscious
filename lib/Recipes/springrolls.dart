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
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Spring Rolls",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            //make underline
            decorationStyle: TextDecorationStyle.double, //double underline
            //text decoration 'underline' color
            decorationThickness: 1.5,
          ),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
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
                                fontSize: 24,
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
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Text(
                              "For sheet/Wrapper:\n ??? 2 cup plain flour/Maida\n ??? 2 tablespoons corn flour\n ??? 2?? Cup water\n ??? ?? teaspoon salt\n\n For Stuffing:\n ??? 2 tablespoons oil\n ??? 3 cloves garlic\n ??? 2 chillies\n ??? 2 tablespoons spring onion\n ??? ?? onion\n"),
                        ),
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
                          "How to prepare spring roll wrapper:\n\n 1 firstly, in a large bowl take 2 cup maida, 2 tbsp corn flour and ?? tsp salt.\n\n 2 add 2?? cup water and mix well using a whisk.\n\n 3 whisk until a smooth lump-free batter is formed adding water as required.\n\n 4 now grease the pan and pour a ladleful of batter on a hot pan.\n\n 5 swirl once making sure the batter is uniformly spread.\n\n 6 cook for a minute or until the sheet is cooked without browning.\n\n 7 now flip over gently and continue to cook.\n\n 8 finally, spring roll wrapper is ready. you can cover and use to prepare spring rolls.\n\n How to prepare veg stuffing:\n\n 1 firstly, in a large wok, heat 2 tbsp oil. saute 3 clove garlic, 2 chilli and 2 tbsp spring onion.\n\n 2 add ?? onion and stir fry on high flame.\n\n 3 now add 1 carrot, 2 cup cabbage, 5 beans, ?? capsicum.\n\n 4 stir fry without losing the crunchiness of vegetables.\n\n 5 further, add 2 tbsp vinegar, 2 tbsp soy sauce, 2 tsp chilli sauce, ?? tsp pepper powder and ?? tsp salt.\n\n 6 mix well making sure everything is well combined. stuffing is ready.\n\n How to fold and fry spring roll:\n\n 1 firstly, take a prepared wrapper and place a tbsp of prepared veg stuffing.\n\n 2 rub a tsp of maida paste around the edge. maida helps to seal the roll.\n\n 3 now roll and fold the sides making sure the roll is sealed tight.\n\n 4 deep fry in hot oil, keeping the flame on low.\n\n 5 stir occasionally, until the roll turns golden brown and crisp.\n\n 6 drain off removing excess oil.\n\n 7 finally, enjoy veg spring roll with sweet chilli sauce.\n",
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
                                    'Open Link',
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
