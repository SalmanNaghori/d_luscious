import 'package:d_luscious/core/constant/app_image.dart';
import 'package:d_luscious/core/constant/const.dart';
import 'package:flutter/material.dart';

class FavoriteItemWidget extends StatelessWidget {
  const FavoriteItemWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return FavoriteScreenData.favorite.value.isEmpty
        ? Center(
            child: Image.asset(ImageAsset.imEmptyFavorites),
          )
        : GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 12.0,
                mainAxisExtent: 200),
            itemCount: FavoriteScreenData.favorite.value.length,
            itemBuilder: (_, index) {
              final recipeName = FavoriteScreenData.favorite.value[index].name;
              final recipeImage =
                  FavoriteScreenData.favorite.value[index].image;

              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                  border: Border.all(width: 0.5),
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => click_c[index].page));
                      },
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                        child: Image.network(
                          recipeImage,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          height: 150,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Flexible(
                            child: InkWell(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             click_c[index].page));
                              },
                              child: Text(
                                recipeName,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .merge(
                                      const TextStyle(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
  }
}
