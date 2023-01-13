import 'dart:io';

import 'package:clippy_flutter/arc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/link.dart';

class butterchicken extends StatelessWidget {
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
                    "https://media.istockphoto.com/id/892029064/photo/chicken-butter-masala.jpg?s=612x612&w=is&k=20&c=tL9nfedV-UuQBRzq_QEbuYMgBLbZvLb_3IqqJZNLLEs=")),
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
                              "Butter Chicken",
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
                            "For the marinade:\n • Raw Chicken\n • 2 tsp Red Chilli Powder\n • 2 tsp Ginger-Garlic Paste\n • 2 tsp Salt\n • 2 tsp Lemon Juice\n • 1/2 cup Curd\n • 1/2 tsp Garam Masala\n • 1 tsp Kasuri Methi\n • 2 tsp Mustard Oil\n For gravy:\n • 2 tsp Oil\n • 2 to taste Butter Cubes\n • 3 gram Cloves\n • 1 Cinnamon Stick, sliced\n • 1 tsp Mace\n • 7 Cardamom\n • 4 Tomatoes, chopped\n •1 tsp Garlic\n • 1 tsp Ginger\n • 1 tsp Ginger-Garlic Paste\n • 1 1/2 tsp Red Chilli Powder\n • 1 tsp Kasuri Methi\n • 2 tsp Honey\n • 1 Green Chilli\n • 2 tsp Cardamom Powder\n • 1 tbsp Cream\n"),
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
                          "For marination:\n 1.In a mixing bowl, put raw chicken pieces and add salt, red chilli powder, ginger garlic paste and lemon juice. Mix well.\n 2.Refrigerate for about 15-20 minutes.\n 3.Now add curd to the refrigerated mix. Followed by salt, ginger garlic paste, red chilli powder, garam masala, kasturi methi and mustard oil. Mix well and refrigerate again for an hour.\n 4.Roast the marinated chicken in an oven for about 30 minutes until it is three-fourth done.\n Prepare the chicken gravy:\n 1.Heat 2 tsp of oil in a pan with butter.\n 2.Add cloves, cinnamon stick, mace and cardamom. Saute and then add chopped tomatoes, garlic and ginger. Mix well and then grind well.\n 3.In another pan, heat another two cubes of butter, along with ginger garlic paste.\n 4.Add the tomato puree made from the mixture. Now add red chilli powder, kasuri methi, honey and finally the roasted chicken pieces. Let it simmer.\n 5.Add green chilli, cardamom powder and cream. Mix well.\n 6.Serve with a teaspoon of cream over.\n",
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
                                'https://www.youtube.com/watch?v=a03U45jFxOI'),
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
