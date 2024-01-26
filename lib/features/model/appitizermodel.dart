// ignore_for_file: public_member_api_docs, sort_constructors_first
class Appitizers {
  String? title;
  String? images;

  Appitizers({
    this.title,
    this.images,
  });

  Appitizers.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    images = json['images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['images'] = images;
    return data;
  }
}
