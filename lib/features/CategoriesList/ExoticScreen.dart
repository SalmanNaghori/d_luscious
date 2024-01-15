import 'package:d_luscious/features/search_model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../Recipes/Tacos.dart';
import '../Recipes/pancakes.dart';
import '../Recipes/springrolls.dart';
import '../Recipes/veghakkanoodles.dart';

class ExoticScreen extends StatefulWidget {
  const ExoticScreen({super.key});

  @override
  State<ExoticScreen> createState() => _ExoticScreenState();
}

final List<Gridmap_c> sub_exo = [
  Gridmap_c(
      title: "Tacos",
      images:
          "https://as2.ftcdn.net/v2/jpg/01/13/63/63/1000_F_113636348_FPQO3sUu2ZA3HR9zOzM4lnSiWEdsoqwu.jpg",
      page: Tacos()),
  Gridmap_c(
      title: "Pancakes",
      images:
          "https://media.istockphoto.com/id/172249723/photo/pancakes.jpg?s=612x612&w=is&k=20&c=djyXHGvaWNIK5GFz7ZsLdGSbFuseK3lfAsa20M6Q-6A=",
      page: pancakes()),
  Gridmap_c(
      title: "Spring Rolls",
      images:
          "https://as2.ftcdn.net/v2/jpg/02/14/90/07/1000_F_214900725_8X4DfrIsIdScBl4hDZ3Uqv5WywlOPhCN.jpg",
      page: springrolls()),
  Gridmap_c(
      title: "Hakka Noodles",
      images:
          "https://img.freepik.com/free-photo/top-view-delicious-noodles-concept_23-2148773775.jpg?w=1060&t=st=1674122376~exp=1674122976~hmac=835cb696cd339628f4d240f8cc7f13530f117b06d4e1add5d31e0289c39d5a97",
      page: veghakkanoodles()),
];

class _ExoticScreenState extends State<ExoticScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Exotic",
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
          itemCount: sub_exo.length,
          itemBuilder: (_, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => sub_exo[index].page));
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
                        sub_exo[index].images,
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
                            sub_exo[index].title,
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
