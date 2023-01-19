import 'package:d_luscious/Recipes/Broccoli-Cheddar%20soup.dart';
import 'package:d_luscious/Recipes/MediterraneanChickpeasalad.dart';
import 'package:d_luscious/Recipes/Pannertikkakabab.dart';
import 'package:d_luscious/Recipes/butterchicken.dart';
import 'package:d_luscious/Recipes/cholebhature.dart';
import 'package:d_luscious/Recipes/cucumberraita.dart';
import 'package:d_luscious/Recipes/gulabjamun.dart';
import 'package:d_luscious/Recipes/kheer.dart';
import 'package:d_luscious/Recipes/pakora.dart';
import 'package:d_luscious/Recipes/palakpanner.dart';
import 'package:d_luscious/Recipes/pancakes.dart';
import 'package:d_luscious/Recipes/vegcheesesandwich.dart';
import 'package:d_luscious/search_model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HealthScreen extends StatefulWidget {
  const HealthScreen({super.key});

  @override
  State<HealthScreen> createState() => _HealthScreenState();
}

final List<Gridmap_c> sub_health = [
  Gridmap_c(
      title: "Cucumber Raita",
      images:
          "https://thumbs.dreamstime.com/b/indian-spicy-sauce-raita-herbs-cucumber-close-up-b-bowl-table-horizontal-top-view-above-111769331.jpg",
      page: cucumberpage()),
  Gridmap_c(
      title: "Mediterranean Salad",
      images:
          "https://media.istockphoto.com/id/157995701/photo/tuna-and-chickpea-salad.jpg?s=612x612&w=is&k=20&c=5I_V1wgHP9KtNn3PrhJcTlaBCQOg9AgMsEon_LuQk_Y=",
      page: MediterraneanChickpeasalad()),
  Gridmap_c(
      title: "Broccoli Soup",
      images:
          "https://media.istockphoto.com/id/1265831709/photo/broccoli-and-cheddar-cheese-soup.jpg?s=612x612&w=is&k=20&c=94_0Urj09HWTSPupihYwjhARJbNTzETFGbtha0Kvysc=",
      page: broccolisoup()),
];

class _HealthScreenState extends State<HealthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Healthy",
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
          itemCount: sub_health.length,
          itemBuilder: (_, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => sub_health[index].page));
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
                        sub_health[index].images,
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
                            sub_health[index].title,
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
