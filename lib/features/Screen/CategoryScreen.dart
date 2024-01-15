import 'package:d_luscious/core/widgets/appbard.dart';
import 'package:flutter/material.dart';

import '../../core/constant/app_string.dart';
import '../CategoriesList/AppetizerScreen.dart';
import '../CategoriesList/DessertScreen.dart';
import '../CategoriesList/ExoticScreen.dart';
import '../search_model/model.dart';

class CategoryScreenTab extends StatefulWidget {
  const CategoryScreenTab({super.key});

  @override
  State<CategoryScreenTab> createState() => _CategoryScreenTabState();
}

final List<Gridmap_c> subdetails = [
  Gridmap_c(
      title: 'Appetizer',
      images:
          'https://as1.ftcdn.net/v2/jpg/02/37/92/98/1000_F_237929818_TzRITyvDWSVU37X4gJDmstQKwInEICmb.jpg',
      page: Appetizer()),
  Gridmap_c(
      title: 'Dessert',
      images:
          'https://as1.ftcdn.net/v2/jpg/02/82/91/94/1000_F_282919459_B2R9gO2EYCMvSLzpq16CXy2Z5UwKp8Gr.jpg',
      page: DessertScreen()),
  Gridmap_c(
      title: 'Exotic',
      images:
          'https://as2.ftcdn.net/v2/jpg/04/80/75/71/1000_F_480757195_E4rVfHPzHorNrZKOzVDJstOewAMc44bW.jpg',
      page: ExoticScreen()),
];

class _CategoryScreenTabState extends State<CategoryScreenTab> {
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
        appBar: CustomAppBar.blankAppBar(title: AppString.category),
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
                            style:
                                Theme.of(context).textTheme.titleMedium!.merge(
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
