import 'package:d_luscious/Recipes/pakora.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Categories",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30,
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
          padding: EdgeInsets.all(10),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 15.0,
            mainAxisExtent: 220,
          ),
          itemCount: gridMap.length,
          itemBuilder: (_, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => butterChicken(
                          gridMap[index],
                        )));
              },
              child: Container(
                // favoriteList:true,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    16.0,
                  ),
                  color: Colors.amberAccent.shade100,
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
                        "${gridMap.elementAt(index)['images']}",
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
                            "${gridMap.elementAt(index)['title']}",
                            style: Theme.of(context).textTheme.subtitle1!.merge(
                                  const TextStyle(
                                    fontWeight: FontWeight.w700,
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

final List<Map<String, dynamic>> gridMap = [
  {
    "title": "Appetizer",
    "images":
        "https://as1.ftcdn.net/v2/jpg/02/37/92/98/1000_F_237929818_TzRITyvDWSVU37X4gJDmstQKwInEICmb.jpg",
  },
  {
    "title": "Main Course",
    "images":
        "https://as2.ftcdn.net/v2/jpg/02/70/49/01/1000_F_270490182_2ZuHrJ3TqFSFVgTswX7QwqGYkyPxlCAd.jpg",
  },
  {
    "title": "Snacks",
    "images":
        "https://as1.ftcdn.net/v2/jpg/00/65/36/08/1000_F_65360807_BYyIJX1zREDu19HJkXxsHXnnoOFVshcu.jpg",
  },
  {
    "title": "Dessert",
    "images":
        "https://as1.ftcdn.net/v2/jpg/02/82/91/94/1000_F_282919459_B2R9gO2EYCMvSLzpq16CXy2Z5UwKp8Gr.jpg",
  },
  {
    "title": "Healthy",
    "images":
        "https://cdn.pixabay.com/photo/2016/09/15/19/24/salad-1672505_1280.jpg",
  },
  {
    "title": "Exotic",
    "images":
        "https://as2.ftcdn.net/v2/jpg/04/80/75/71/1000_F_480757195_E4rVfHPzHorNrZKOzVDJstOewAMc44bW.jpg",
  },
];
