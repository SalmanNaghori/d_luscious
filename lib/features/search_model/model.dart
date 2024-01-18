import 'package:flutter/cupertino.dart';

class Categorymodel {
  final String title, imageurl;
  // List<SubCategory> subcategories;

  Categorymodel(
    this.title,
    this.imageurl,
  );
}

class SubCategory {
  ItemDetails item;
  String title;
  String imageurl;
  SubCategory(this.title, this.imageurl, this.item);
}

class ItemDetails {
  String title, images, time, ingradients, direction, url;

  ItemDetails(
    this.title,
    this.images,
    this.time,
    this.ingradients,
    this.direction,
    this.url,
  );
}

class GridmapC {
  final String title, images;
  final Widget page;
  GridmapC({
    required this.title,
    required this.images,
    required this.page,
  });
}
