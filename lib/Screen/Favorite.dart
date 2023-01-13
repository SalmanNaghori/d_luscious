import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:d_luscious/Screen/HomeScreen.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({super.key});

  @override
  Widget build(BuildContext context) {
    List<bool> listIsFavTimeSaving = [false, false];
    return Scaffold(
        appBar: AppBar(title: Text("Favourite")),
        body: GridView.builder(
          padding: EdgeInsets.all(10),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 15.0,
            mainAxisExtent: 275,
          ),
          itemCount: gridMap.length,
          itemBuilder: (_, index) {
            return Container(
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
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.favorite_border),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}

final List<Map<String, dynamic>> gridMap = [
  {
    "title": "Cucumber Raita",
    "images":
        "https://as1.ftcdn.net/v2/jpg/01/95/70/12/1000_F_195701243_4uXJILIWRX6B6GUy4t9HQZt6HomkZbzT.jpg",
  },
  {
    "title": "Paneer Tikka Kabab",
    "images":
        "https://media.istockphoto.com/id/1303442507/photo/spicy-indian-paneer-tikka-masala-on-a-skewer-on-wooden-platter.jpg?s=612x612&w=0&k=20&c=eijXsF8w-86CwaxsNszS58TsmDUX2c-LysPEEuUablo=",
  },
];
