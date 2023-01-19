import 'package:d_luscious/Recipes/Pannertikkakabab.dart';
import 'package:d_luscious/Recipes/butterchicken.dart';
import 'package:d_luscious/Recipes/cholebhature.dart';
import 'package:d_luscious/Recipes/cucumberraita.dart';
import 'package:d_luscious/Recipes/pakora.dart';
import 'package:d_luscious/Recipes/palakpanner.dart';
import 'package:d_luscious/Recipes/vegcheesesandwich.dart';
import 'package:d_luscious/Recipes/whitesaucepasta.dart';
import 'package:d_luscious/search_model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SnacksScreen extends StatefulWidget {
  const SnacksScreen({super.key});

  @override
  State<SnacksScreen> createState() => _SnacksScreenState();
}

final List<Gridmap_c> sub_snacks = [
  Gridmap_c(
      title: "Cucumber Raita",
      images:
          "https://thumbs.dreamstime.com/b/indian-spicy-sauce-raita-herbs-cucumber-close-up-b-bowl-table-horizontal-top-view-above-111769331.jpg",
      page: cucumberpage()),
  Gridmap_c(
      title: "Cheese Sandwich",
      images:
          "https://media.istockphoto.com/id/155388694/photo/panini-sandwiches.jpg?s=612x612&w=is&k=20&c=c4C9u4yFVIhZyoqJ-DsrdRWUOVd0iIs2CCJVlo79tpY=",
      page: vegcheesesandwich()),
  Gridmap_c(
      title: "Pakora",
      images:
          "https://media.istockphoto.com/id/177314242/photo/vegetable-pakora.jpg?s=612x612&w=is&k=20&c=zEyqDHzekDiFzPGRunZ4cttgsdjZu55d43cFnIju4L4=",
      page: PakoraScreen()),
  Gridmap_c(
      title: "Paneer Tikka kabab",
      images:
          "https://media.istockphoto.com/id/1303442507/photo/spicy-indian-paneer-tikka-masala-on-a-skewer-on-wooden-platter.jpg?s=612x612&w=0&k=20&c=eijXsF8w-86CwaxsNszS58TsmDUX2c-LysPEEuUablo=",
      page: pannertikkakabab()),
  Gridmap_c(
      title: "White Sauce Pasta",
      images:
          "https://t4.ftcdn.net/jpg/00/65/59/93/240_F_65599346_xxwNpdbxHN2WKXSpWpUYMiBAghUdPoGD.jpg",
      page: whitesaucepasta()),
];

class _SnacksScreenState extends State<SnacksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Snacks",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
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
        body: GridView.builder(
          padding: const EdgeInsets.all(10),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 15.0,
            mainAxisExtent: 220,
          ),
          itemCount: sub_snacks.length,
          itemBuilder: (_, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => sub_snacks[index].page));
              },
              child: Container(
                // favoriteList:true,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    16.0,
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                      child: Image.network(
                        sub_snacks[index].images,
                        height: 170,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            sub_snacks[index].title,
                            style: Theme.of(context).textTheme.subtitle1!.merge(
                                  const TextStyle(),
                                ),
                          ),
                          // Text(
                          //   "${gridMap.elementAt(index)['price']}",
                          //   style: Theme.of(context).textTheme.subtitle2!.merge(
                          //         TextStyle(
                          //           fontWeight: FontWeight.w700,
                          //           color: Colors.grey.shade500,
                          //         ),
                          //       ),
                          // ),
                          // Row(
                          //   children: [
                          //     IconButton(
                          //       onPressed: () {},
                          //       icon: Icon(Icons.favorite_border),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
