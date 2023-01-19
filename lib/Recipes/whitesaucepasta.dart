import 'dart:io';

import 'package:clippy_flutter/arc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/link.dart';

class whitesaucepasta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "WhiteSauce Pasta",
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
                    "https://t4.ftcdn.net/jpg/00/65/59/93/240_F_65599346_xxwNpdbxHN2WKXSpWpUYMiBAghUdPoGD.jpg")),
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
                              "WhiteSauce Pasta",
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
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Text(
                              "• Butter 2 tablespoons\n • Whole wheat Flour 1 tablespoons\n • All-purpose Flour 2 tablespoons\n • Milk 1 cup (chilled)\n • Black pepper powder ¼ teaspoon\n • Nutmeg powder\n • Cheddar Cheese 2 Tablespoons\n • Water 4 cups\n • Salt ½ teaspoon\n • Penne Pasta 1 big cup\n • Oregano ¼ teaspoon \n • Basil \n • Thyme\n • Chili Flakes\n "),
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
                          "1. Heat a saucepan. Keep the flame to a low and add 2 tablespoons butter. You can use salted or unsalted butter.\n\n 2. When the butter melts and starts to bubble,then add 1 tablespoon whole wheat flour or 2 tablespoons all-purpose flour..\n\n 3.Using a wired whisk, stir the flour quickly as soon as you add it.Keep on stirring so that no lumps are formed.The frequent stirring helps the flour to cook evenly You will see the flour frothing and bubbling up while stirring. Sauté it until you get a nice cooked aroma and the flour is a pale golden colour. Do not brown the flour..\n\n 4.Keep the flame on low and then pour 1 cup chilled milk in a gentle stream with one hand and stir the sauce mixture with the other. The milk must be chilled, so that lumps do not   form.\n\n  5.Stir frequently while the milk heats up.\n\n 6.On a low flame, simmer the sauce until it thickens.When the sauce has thickened well and coats the back of a spoon, switch off the flame.\n\n 7.Remove the saucepan from the heat and add the seasonings – ¼ teaspoon black pepper powder, a generous pinch of nutmeg powder or grated nutmeg and salt as required.For a cheese sauce, you can add 2 tablespoons of grated cheddar cheese.\n\n 8.Mix very well and set aside. Keep in mind that the sauce will thicken as it cools,so keep the consistency accordingly.Cooking pasta.\n\n 9.Boil 4 cups water with ½ teaspoon salt in a pan.\n\n 10.When the water comes to a boil, add 1 cup penne pasta.\n\n 11. Cook the pasta on a medium to high flame.\n\n 12.When the pasta gets done to an al dente texture, switch off the flame. For a softer texture, cook the pasta a little longer, Strain the pasta with a strainer spoon.Making white sauce pasta.\n\n 13.Then add pasta to the white sauce.\n\n 14.Add ¼ teaspoon each of dried oregano, dried basil and dried thyme.Or add your choice of herbs. At this step you can add some steamed, cooked, sautéed or roasted veggies if you’d like.\n\n  15. Mix very well.\n\n  16. Serve white sauce pasta garnished with  some fresh herbs like parsley, chives or dill.You can also garnish with some grated cheddar cheese.\n",
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
                            uri: Uri.parse('https://youtu.be/XsipAaImDVc'),
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
