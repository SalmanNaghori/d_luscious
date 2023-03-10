import 'package:d_luscious/CategoriesList/AppetizerScreen.dart';
import 'package:d_luscious/CategoriesList/ExoticScreen.dart';
import 'package:d_luscious/CategoriesList/HealthyScreen.dart';
import 'package:d_luscious/CategoriesList/MainCourseScreen.dart';
import 'package:d_luscious/CategoriesList/SnacksScreen.dart';
import 'package:d_luscious/CategoriesList/dessertScreen.dart';
import 'package:d_luscious/Recipes/pakora.dart';
import 'package:d_luscious/model/appitizermodel.dart';
import 'package:d_luscious/search_model/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/date_symbol_data_local.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

final List<Gridmap_c> subdetails = [
  Gridmap_c(
      title: 'Appetizer',
      images:
          'https://as1.ftcdn.net/v2/jpg/02/37/92/98/1000_F_237929818_TzRITyvDWSVU37X4gJDmstQKwInEICmb.jpg',
      page: Appetizer()),
  Gridmap_c(
      title: 'Main course',
      images:
          'https://as2.ftcdn.net/v2/jpg/02/70/49/01/1000_F_270490182_2ZuHrJ3TqFSFVgTswX7QwqGYkyPxlCAd.jpg',
      page: MainCourse()),
  Gridmap_c(
      title: 'Snacks',
      images:
          'https://as1.ftcdn.net/v2/jpg/00/65/36/08/1000_F_65360807_BYyIJX1zREDu19HJkXxsHXnnoOFVshcu.jpg',
      page: SnacksScreen()),
  Gridmap_c(
      title: 'Dessert',
      images:
          'https://as1.ftcdn.net/v2/jpg/02/82/91/94/1000_F_282919459_B2R9gO2EYCMvSLzpq16CXy2Z5UwKp8Gr.jpg',
      page: DessertScreen()),
  Gridmap_c(
      title: 'Healthy',
      images:
          'https://cdn.pixabay.com/photo/2016/09/15/19/24/salad-1672505_1280.jpg',
      page: HealthScreen()),
  Gridmap_c(
      title: 'Exotic',
      images:
          'https://as2.ftcdn.net/v2/jpg/04/80/75/71/1000_F_480757195_E4rVfHPzHorNrZKOzVDJstOewAMc44bW.jpg',
      page: ExoticScreen()),
];

class _CategoryScreenState extends State<CategoryScreen> {
  static List<String> nameofcategory = [
    'Appetizer',
    'Main course',
    'Snacks',
    'Dessert',
    'Healthy',
    'Exotic'
  ];

  static List url = [
    'https://as1.ftcdn.net/v2/jpg/02/37/92/98/1000_F_237929818_TzRITyvDWSVU37X4gJDmstQKwInEICmb.jpg',
    'https://as2.ftcdn.net/v2/jpg/02/70/49/01/1000_F_270490182_2ZuHrJ3TqFSFVgTswX7QwqGYkyPxlCAd.jpg',
    'https://as1.ftcdn.net/v2/jpg/00/65/36/08/1000_F_65360807_BYyIJX1zREDu19HJkXxsHXnnoOFVshcu.jpg',
    'https://as1.ftcdn.net/v2/jpg/02/82/91/94/1000_F_282919459_B2R9gO2EYCMvSLzpq16CXy2Z5UwKp8Gr.jpg',
    'https://cdn.pixabay.com/photo/2016/09/15/19/24/salad-1672505_1280.jpg',
    'https://as2.ftcdn.net/v2/jpg/04/80/75/71/1000_F_480757195_E4rVfHPzHorNrZKOzVDJstOewAMc44bW.jpg'
  ];

  final List<Categorymodel> categorydata = List.generate(nameofcategory.length,
      (index) => Categorymodel('${nameofcategory[index]}', '${url[index]}'));

  // @override
  // void initState() {
  //   finalCategoryList = getitems();
  //   super.initState();
  // }

  // List<Categorymodel> finalCategoryList = [];

  // List<Categorymodel> getitems() {
  //   ItemDetails item = ItemDetails(
  //       "title", "images", "time", "ingredients", "Directions", "url");

  //   SubCategory sub = SubCategory("stitle", "simagelurl", item);
  //   SubCategory sub1 = SubCategory("stitle", "simagelurl", item);
  //   List<SubCategory> subList = [];
  //   subList.add(sub);
  //   subList.add(sub1);

  //   Categorymodel category = Categorymodel("ctitle", "cimaguirl", subList);

  //   List<Categorymodel> categoryList = [];

  //   categoryList.add(category);

  //   return categoryList;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
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
          padding: const EdgeInsets.all(10),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 15.0,
            mainAxisExtent: 220,
          ),
          itemCount: subdetails.length,
          itemBuilder: (_, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => subdetails[index].page));
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
                        subdetails[index].images,
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
                            subdetails[index].title,
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

// final List<Map<String, dynamic>> gridMap = [
//   {
//     "id": 1,
//     "title": "Appetizer",
//     "images":
//         "https://as1.ftcdn.net/v2/jpg/02/37/92/98/1000_F_237929818_TzRITyvDWSVU37X4gJDmstQKwInEICmb.jpg",
//   },
//   {
//     "id": 2,
//     "title": "Main Course",
//     "images":
//         "https://as2.ftcdn.net/v2/jpg/02/70/49/01/1000_F_270490182_2ZuHrJ3TqFSFVgTswX7QwqGYkyPxlCAd.jpg",
//   },
//   {
//     "id": 3,
//     "title": "Snacks",
//     "images":
//         "https://as1.ftcdn.net/v2/jpg/00/65/36/08/1000_F_65360807_BYyIJX1zREDu19HJkXxsHXnnoOFVshcu.jpg",
//   },
//   {
//     "id": 4,
//     "title": "Dessert",
//     "images":
//         "https://as1.ftcdn.net/v2/jpg/02/82/91/94/1000_F_282919459_B2R9gO2EYCMvSLzpq16CXy2Z5UwKp8Gr.jpg",
//   },
//   {
//     "id": 5,
//     "title": "Healthy",
//     "images":
//         "https://cdn.pixabay.com/photo/2016/09/15/19/24/salad-1672505_1280.jpg",
//   },
//   {
//     "id": 6,
//     "title": "Exotic",
//     "images":
//         "https://as2.ftcdn.net/v2/jpg/04/80/75/71/1000_F_480757195_E4rVfHPzHorNrZKOzVDJstOewAMc44bW.jpg",
//   },
// ];
