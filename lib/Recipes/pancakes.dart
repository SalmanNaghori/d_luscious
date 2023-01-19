import 'dart:io';

import 'package:clippy_flutter/arc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/link.dart';

class pancakes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Pancakes",
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
                    "https://media.istockphoto.com/id/172249723/photo/pancakes.jpg?s=612x612&w=is&k=20&c=djyXHGvaWNIK5GFz7ZsLdGSbFuseK3lfAsa20M6Q-6A=")),
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
                                  "20 Minutes",
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
                              "Pancakes",
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
                              "• 1 cup all-purpose flour\n • 2 tablespoons sugar\n • 2 teaspoons baking powder\n • 1/2 teaspoon salt\n • 1 large egg, slightly beaten\n •	2 tablespoons vegetable oil\n • 3/4 cup milk\n"),
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
                          "1.	Gather the ingredients.\n\n 2. Combine the flour, sugar, baking powder, and salt. Whisk or stir to blend thoroughly.\n\n 3. Stir in egg, oil, and the milk. Mix lightly, just enough to blend.\n\n 4.	When ready to cook, grease a griddle with butter.\n\n 5. Using a 1/4 cup measuring scoop, measure out pancakes onto the griddle to cook.\n\n 6. Cook the pancakes, flipping them when you see bubbles breaking all over the tops.\n\n 7. Continue till the underside is brown.\n",
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
                                'https://www.youtube.com/watch?v=Pn15LITONhU'),
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
