import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'appitizermodel.dart';

class NetworkRequest {
  static const String url =
      'https://mocki.io/v1/70a2d346-1ee6-44b5-b18d-2842bf744902';
  static List<Appitizers> persephotos(String respondsBody) {
    var list = json.decode(respondsBody) as List<dynamic>;
    List<Appitizers> photos =
        list.map((model) => Appitizers.fromJson(model)).toList();
    return photos;
  }

  static Future<List<Appitizers>> fetchPhotos() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return compute(persephotos, response.body);
    } else {
      throw Exception('Can\'t get photos');
    }
  }
}
