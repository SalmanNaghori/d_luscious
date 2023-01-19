class appitizers {
  String? title;
  String? images;

  appitizers({this.title, this.images});

  appitizers.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    images = json['images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['images'] = this.images;
    return data;
  }
}
