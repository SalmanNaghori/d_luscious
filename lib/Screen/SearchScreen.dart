// import 'package:d_luscious/search_model/model.dart';
// import 'package:flutter/material.dart';

// class SearchPage extends StatefulWidget {
//   const SearchPage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   static List<RecipeModel> main_recipe_list = [
//     RecipeModel("Cucumber Raita", 4.3,
//         "https://thumbs.dreamstime.com/b/indian-spicy-sauce-raita-herbs-cucumber-close-up-b-bowl-table-horizontal-top-view-above-111769331.jpg"),
//     RecipeModel("Butter Chicken", 3.5,
//         "https://media.istockphoto.com/id/892029064/photo/chicken-butter-masala.jpg?s=612x612&w=is&k=20&c=tL9nfedV-UuQBRzq_QEbuYMgBLbZvLb_3IqqJZNLLEs="),
//     RecipeModel("Chole Bhature", 4.5,
//         "https://media.istockphoto.com/id/979922482/photo/chole-bhature-or-chick-pea-curry-and-fried-puri-served-in-terracotta-crockery-over-white.jpg?s=612x612&w=is&k=20&c=1XY3VN_RS2gSS5xXYLgUYwqEz4O0SuNOa6pq-B78aLo="),
//     RecipeModel("Gulab Jamun", 3.5,
//         "https://media.istockphoto.com/id/668147754/photo/gulab-jamun.jpg?s=612x612&w=is&k=20&c=kZsNz58uMx0fZVfhqbYct9u4JymMJNg3eskRSlLxdFQ="),
//     RecipeModel("Kheer", 3.3,
//         "https://media.istockphoto.com/id/1340276605/photo/sweet-indian-dish-kheer-is-made-of-milk-sugar-and-vermicelli.jpg?s=612x612&w=is&k=20&c=H5qNjgqUKW188ZvECVcSZEOK8hhC9WRHuiQ7poZnHHI="),
//     RecipeModel("Pakora", 4.5,
//         "https://media.istockphoto.com/id/177314242/photo/vegetable-pakora.jpg?s=612x612&w=is&k=20&c=zEyqDHzekDiFzPGRunZ4cttgsdjZu55d43cFnIju4L4="),
//     RecipeModel("Palak Paneer", 4.9,
//         "https://media.istockphoto.com/id/922785036/photo/palak-panner-indian-recipe-food-on-wood.jpg?s=612x612&w=is&k=20&c=p1o-jw0x8-ce0vCOBMosRaRkSNdZiUY0bSlAOPPliwM="),
//     RecipeModel("PanCakes", 3.5,
//         "https://media.istockphoto.com/id/172249723/photo/pancakes.jpg?s=612x612&w=is&k=20&c=djyXHGvaWNIK5GFz7ZsLdGSbFuseK3lfAsa20M6Q-6A="),
//     RecipeModel("Paneer Tikka", 2.5,
//         "https://media.istockphoto.com/id/1303442507/photo/spicy-indian-paneer-tikka-masala-on-a-skewer-on-wooden-platter.jpg?s=612x612&w=0&k=20&c=eijXsF8w-86CwaxsNszS58TsmDUX2c-LysPEEuUablo="),
//     RecipeModel("SpringRolls", 3.5,
//         "https://as2.ftcdn.net/v2/jpg/02/14/90/07/1000_F_214900725_8X4DfrIsIdScBl4hDZ3Uqv5WywlOPhCN.jpg"),
//     RecipeModel("White Sauce Pasta", 3.5,
//         "https://t4.ftcdn.net/jpg/00/65/59/93/240_F_65599346_xxwNpdbxHN2WKXSpWpUYMiBAghUdPoGD.jpg"),
//     RecipeModel("Tacos", 3.5,
//         "https://as2.ftcdn.net/v2/jpg/01/13/63/63/1000_F_113636348_FPQO3sUu2ZA3HR9zOzM4lnSiWEdsoqwu.jpg"),
//     RecipeModel("Veg Cheese Sandwich", 3.5,
//         "https://media.istockphoto.com/id/155388694/photo/panini-sandwiches.jpg?s=612x612&w=is&k=20&c=c4C9u4yFVIhZyoqJ-DsrdRWUOVd0iIs2CCJVlo79tpY="),
//     RecipeModel("Veg Hakka Noodles", 3.5,
//         "https://previews.123rf.com/images/espies/espies2111/espies211102772/178163328-schezwan-noodles-or-szechwan-vegetable-hakka-noodles-or-chow-mein-is-a-popular-indo-chinese-recipes-.jpg"),
//     RecipeModel("Broccoli-Cheddar Soup", 3.5,
//         "https://media.istockphoto.com/id/1265831709/photo/broccoli-and-cheddar-cheese-soup.jpg?s=612x612&w=is&k=20&c=94_0Urj09HWTSPupihYwjhARJbNTzETFGbtha0Kvysc="),
//     RecipeModel("MediterraneanChickpeasalad", 3.5,
//         "https://media.istockphoto.com/id/157995701/photo/tuna-and-chickpea-salad.jpg?s=612x612&w=is&k=20&c=5I_V1wgHP9KtNn3PrhJcTlaBCQOg9AgMsEon_LuQk_Y="),
//   ];

//   List<RecipeModel> display_list = List.from(main_recipe_list);

//   void updateList(String value) {
//     //this is function that will filter our list
//     setState(() {
//       display_list = main_recipe_list
//           .where((element) =>
//               element.recipe_title!.toLowerCase().contains(value.toLowerCase()))
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           "Search",
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontSize: 30,
//             //make underline
//             decorationStyle: TextDecorationStyle.double, //double underline
//             //text decoration 'underline' color
//             decorationThickness: 1.5,
//           ),
//         ),
//         leading: const BackButton(
//           color: Colors.black,
//         ),
//         backgroundColor: Colors.white,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Search for recipe",
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 22.0,
//                   fontWeight: FontWeight.bold),
//             ),
//             SizedBox(
//               height: 20.0,
//             ),
//             TextField(
//               onChanged: (value) => updateList(value),
//               style: TextStyle(color: Colors.black),
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Colors.white60,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                   borderSide: BorderSide.none,
//                 ),
//                 hintText: "eg: Cucumber Raita",
//                 prefixIcon: Icon(
//                   Icons.search,
//                   color: Color(0xffF5A342),
//                 ),
//                 prefixIconColor: Colors.white60,
//               ),
//             ),
//             SizedBox(
//               height: 20.0,
//             ),
//             Expanded(
//               child: display_list.length == 0
//                   ? Center(
//                       child: Text(
//                         "No Result Found",
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 22.0,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     )
//                   : ListView.builder(
//                       itemCount: display_list.length,
//                       itemBuilder: ((context, index) => Card(
//                             elevation: 6,
//                             margin: const EdgeInsets.all(5),
//                             child: ListTile(
//                               title: Text(
//                                 display_list[index].recipe_title!,
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               subtitle: Text('${display_list[index].rating!}',
//                                   style: TextStyle(
//                                     color: Colors.black26,
//                                   )),
//                               leading: Image.network(
//                                   display_list[index].recipe_url!),
//                             ),
//                           )),
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
