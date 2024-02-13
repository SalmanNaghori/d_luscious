class Favorite {
  String id;
  String name;
  bool? isLiked;
  String image;

  Favorite({
    required this.id,
    required this.name,
    this.isLiked,
    required this.image,
  });
}
