import 'dart:io';

import 'package:clippy_flutter/arc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/link.dart';

class Cholebhature extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Chole Bhature",
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
                    "https://media.istockphoto.com/id/979922482/photo/chole-bhature-or-chick-pea-curry-and-fried-puri-served-in-terracotta-crockery-over-white.jpg?s=612x612&w=is&k=20&c=1XY3VN_RS2gSS5xXYLgUYwqEz4O0SuNOa6pq-B78aLo=")),
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
                                  "50-60 Minutes",
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
                              "Chole Bhature",
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
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Text(
                            " • 2 cup Chickpeas\n • 2 tsp Oil\n • 1 Bay leaf\n • 1 Cinnamon stick\n • 3-4 Cloves\n • 1 tsp Whole pepper corns\n • 3 Green cardamom\n • 2 Black cardamom\n • 1 tsp Turmeric powder\n • 1 tsp Chilli powder\n • 1 tsp Coriander powder\n • 1 tsp Cumin powder\n • 1 tsp Cumin seeds\n • 1/2 tsp Asafoetida\n • taste Salt\n • 1 cup Onions, chopped\n • 1 cup Tomatoes, chopped\n • 1 tsp Ginger, chopped\n • 1 tsp Garlic, chopped\n • 1 tsp Ajwain\n • 1 tsp Lime juice\n • 1 Green chili, chopped\n • 1 Tea bag\n • 1 tbsp Butter\n • 2 cups Refined flour\n • 1/2 tsp Yeast (dissolved for 10 minutes in luke warm water)\n • 1/2 cup Whole wheat flour\n • A pinch of Salt\n• Water (to knead)\n • Oil (for frying)\n"),
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
                          "In a pan add oil, bay leaf, cinnamon, cumin seeds, cloves, whole pepper corns, green and black cardamom: \n\n 1.After it browns, add chopped onions and saute. Add chopped ginger and garlic.\n\n 2.Now, add turmeric, chili powder, coriander powder, cumin powder, asafoetida and salt. Fry the ingredients together.\n\n 3.For de-glazing the pan, add a little water.\n\n 4.Now, add the chole (soaked overnight and pressure cooked) to the masala.\n\n 5.After stirring well, add tomatoes, a little sugar and salt to the chole.\n\n 6.Now, add ajwain, chopped green chilies and water for the base.\n\n 7.To get the color in the chole, add a tea bag to the masala.\n\n 8.Simmer the chole gently for an hour and cover it.\n\n 9.Add lime juice and a dollop of butter to it.\n\n 10.Garnish the chole with coriander and butter and serve them hot with bhaturas.\n\n To prepare the bhaturas:\n \n1.Knead the whole wheat flour, maida and salt together with adequate amount of water.\n\n 2.Sprinkle the yeast on top. Leave it for 2-3 hours for the yeast to work.\n\n 3.Divide it into equal portions. Roll out in an oval or round shape.\n\n 4.Deep fry till golden brown, like a puri. Serve and enjoy!\n",
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
                                'https://www.youtube.com/watch?v=aFzBnNWEu5Y'),
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
