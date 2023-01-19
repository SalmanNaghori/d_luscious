import 'package:d_luscious/Recipes/butterchicken.dart';
import 'package:d_luscious/Recipes/cholebhature.dart';
import 'package:d_luscious/Recipes/palakpanner.dart';
import 'package:d_luscious/search_model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainCourse extends StatefulWidget {
  const MainCourse({super.key});

  @override
  State<MainCourse> createState() => _MainCourseState();
}

final List<Gridmap_c> sub_main_c = [
  Gridmap_c(
      title: "Chole Bhature",
      images:
          "https://media.istockphoto.com/id/979922482/photo/chole-bhature-or-chick-pea-curry-and-fried-puri-served-in-terracotta-crockery-over-white.jpg?s=612x612&w=is&k=20&c=1XY3VN_RS2gSS5xXYLgUYwqEz4O0SuNOa6pq-B78aLo=",
      page: Cholebhature()),
  Gridmap_c(
      title: "Palak Paneer",
      images:
          "https://as2.ftcdn.net/v2/jpg/02/70/49/01/1000_F_270490182_2ZuHrJ3TqFSFVgTswX7QwqGYkyPxlCAd.jpg",
      page: palakpanner()),
  Gridmap_c(
      title: "Butter Chicken",
      images:
          "https://media.istockphoto.com/id/892029064/photo/chicken-butter-masala.jpg?s=612x612&w=is&k=20&c=tL9nfedV-UuQBRzq_QEbuYMgBLbZvLb_3IqqJZNLLEs=",
      page: butterchicken()),
];

class _MainCourseState extends State<MainCourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Main Course",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w700,
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
          itemCount: sub_main_c.length,
          itemBuilder: (_, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => sub_main_c[index].page));
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
                        sub_main_c[index].images,
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
                            sub_main_c[index].title,
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
