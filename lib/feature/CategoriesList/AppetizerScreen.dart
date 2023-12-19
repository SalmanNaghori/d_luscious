
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../Recipes/Pannertikkakabab.dart';
import '../Recipes/cucumberraita.dart';
import '../Recipes/kheer.dart';
import '../Recipes/pakora.dart';
import '../Recipes/springrolls.dart';
import '../Recipes/vegcheesesandwich.dart';
import '../search_model/model.dart';

class Appetizer extends StatefulWidget {
  const Appetizer({
    super.key,
  });

  @override
  State<Appetizer> createState() => _AppetizerState();
}

final List<Gridmap_c> sub_ap = [
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
      title: "Paneer Tikka Kabab",
      images:
          "https://media.istockphoto.com/id/1303442507/photo/spicy-indian-paneer-tikka-masala-on-a-skewer-on-wooden-platter.jpg?s=612x612&w=0&k=20&c=eijXsF8w-86CwaxsNszS58TsmDUX2c-LysPEEuUablo=",
      page: pannertikkakabab()),
  Gridmap_c(
      title: "Spring Rolls",
      images:
          "https://as2.ftcdn.net/v2/jpg/02/14/90/07/1000_F_214900725_8X4DfrIsIdScBl4hDZ3Uqv5WywlOPhCN.jpg",
      page: springrolls()),
];

class _AppetizerState extends State<Appetizer> {
  List<Map<String, dynamic>> gridMap = [];
  //final List<Categorymodel> categorymodellist
  List<Widget> selectpage = [new cucumberpage(), kheer()];
  String title = "";

  @override
  void initState() {
    // print(widget.id);
    // gridMap = mainData[widget.id];
    // switch (widget.id) {
    //   case 0:
    //     title = "Appetizer";
    //     break;
    //   case 1:
    //     title = "Main Course";
    //     break;
    //   case 2:
    //     title = "SnackS";
    //     break;
    //   case 3:
    //     title = "Dessert";
    //     break;
    //   case 4:
    //     title = "Healthy";
    //     break;
    //   case 5:
    //     title = "Exotic";
    //     break;
    //   default:
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Appetizers",
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
          itemCount: sub_ap.length,
          itemBuilder: (_, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => sub_ap[index].page));
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
                        sub_ap[index].images,
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
                            sub_ap[index].title,
                            style: Theme.of(context).textTheme.subtitle1!.merge(
                                  const TextStyle(
                                      // fontWeight: FontWeight.w700,
                                      ),
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
