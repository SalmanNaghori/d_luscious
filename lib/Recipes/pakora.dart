import 'dart:io';

import 'package:clippy_flutter/arc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/link.dart';


class PakoraScreen extends StatelessWidget {
  PakoraScreen();



  butterChicken(Map<String, dynamic> gridMap);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Pakora",
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
                    "https://media.istockphoto.com/id/177314242/photo/vegetable-pakora.jpg?s=612x612&w=is&k=20&c=zEyqDHzekDiFzPGRunZ4cttgsdjZu55d43cFnIju4L4=")),
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
                                  "15-20 Minutes",
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
                              "Pakora",
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
                              " • 2 tsp olive oil\n • 2 clove garlic\n • 1 tsp mixed herbs\n • 1 tsp chilli flakes\n • ½ onion\n • 1½ rajma / kidney beans\n • ½ capsicum\n • ½ carrot\n • 3 tbsp sweet corn\n • ½ tsp salt\n • 1 onion\n • 1 tomato\n • 4 jalapeno\n • 1 tsp chilli sauce\n • 1 tsp lemon juice\n • ¼ tsp salt\n • For Guacamole (Optional)\n • 1 avocado\n • 2 tbsp onion\n • ¼ tsp mixed herbs\n • ¼ tsp salt\n • 1 tsp lemon juice\n • 5 to 6 tortillas\n • Tomato sauce\n • Cheese\n • Oil\n"),
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
                          " how to prepare veggies stuffing:\n\n 1 firstly, in a pan heat 2 tsp olive oil.\n\n 2 add 2 clove garlic, 1 tsp mixed herbs and 1 tsp chilli flakes. saute until the spices turn aromatic.\n\n 3 add ½ onion and saute until it shrinks slightly.\n\n 4 further, add 1½ rajma and saute for 2 minutes. make sure you have soaked rajma overnight and boiled well. you can alternatively use canned rajma here.\n\n 5 now add ½ green capsicum, ½ yellow capsicum, ½ carrot, chopped, 3 tbsp sweet corn and ½ tsp salt.\n\n 6 saute for a minute making sure the vegetables are crunchy.\n\n 7 veggies are ready. keep aside.\n\n how to make salsa or desi style onion tomato salad:\n\n 8 firstly, in a bowl take 1 onion, 1 tomato and 4 jalapeno.\n\n 9 also add 1 tsp chilli sauce, 1 tsp lemon juice and ¼ tsp salt.\n\n 10 mix well and salsa is ready. keep aside.\n\n how to make guacamole or avocado dip:\n\n 1 firstly, mash 1 avocado using a fork.\n\n 2 add 2 tbsp onion, ¼ tsp mixed herbs, ¼ tsp salt and 1 tsp lemon juice.\n\n 1 mix well making sure everything is well combined. you can also add ¼ tsp pepper.\n\n 3 finally, guacamole is ready. keep aside.\n\n how to prepare desi style tacos:\n\n 1 firstly, take leftover roti and spread 1 tsp tomato sauce.\n\n 2 now on one side place 2 tbsp cheese.\n\n 3 top with 2 tbsp prepared veggies and 1 tbsp salsa.\n\n 4 further top with chopped lettuce and 2 tbsp cheese.\n\n 5 fold half and is ready to toast on the pan.\n\n 6 brush with oil and toast on low to medium flame until the tacos turn crispy.\n\n 7 finally, enjoy roti tacos with guacamole and tomato sauce.\n",
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
                                'https://www.youtube.com/watch?v=ibzQobIsG4k'),
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
