import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../Recipes/gulabjamun.dart';
import '../Recipes/kheer.dart';
import '../Recipes/pancakes.dart';
import '../search_model/model.dart';

class DessertScreen extends StatefulWidget {
  const DessertScreen({super.key});

  @override
  State<DessertScreen> createState() => _DessertScreenState();
}

final List<Gridmap_c> sub_dest = [
  Gridmap_c(
      title: "Pancakes",
      images:
          "https://media.istockphoto.com/id/172249723/photo/pancakes.jpg?s=612x612&w=is&k=20&c=djyXHGvaWNIK5GFz7ZsLdGSbFuseK3lfAsa20M6Q-6A=",
      page: pancakes()),
  Gridmap_c(
      title: "Kheer",
      images:
          "https://media.istockphoto.com/id/1340276605/photo/sweet-indian-dish-kheer-is-made-of-milk-sugar-and-vermicelli.jpg?s=612x612&w=is&k=20&c=H5qNjgqUKW188ZvECVcSZEOK8hhC9WRHuiQ7poZnHHI=",
      page: kheer()),
  Gridmap_c(
      title: "Gulab Jamun",
      images:
          "https://media.istockphoto.com/id/668147754/photo/gulab-jamun.jpg?s=612x612&w=is&k=20&c=kZsNz58uMx0fZVfhqbYct9u4JymMJNg3eskRSlLxdFQ=",
      page: gulabjamun()),
];

class _DessertScreenState extends State<DessertScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Dessert",
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
          itemCount: sub_dest.length,
          itemBuilder: (_, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => sub_dest[index].page));
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
                        sub_dest[index].images,
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
                            sub_dest[index].title,
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
