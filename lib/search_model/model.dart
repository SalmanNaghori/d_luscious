// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/animation.dart';
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
  String title, images, time, Ingradiants, Direction, url;

  ItemDetails(
    this.title,
    this.images,
    this.time,
    this.Ingradiants,
    this.Direction,
    this.url,
  );
}

class Gridmap_c {
  final String title, images;
  final Widget page;
  Gridmap_c({
    required this.title,
    required this.images,
    required this.page,
  });
}
