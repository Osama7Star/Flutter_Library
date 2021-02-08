
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_library/pages/widgets/UserReviews.dart';
import 'package:http/http.dart' as http;

class CategoryModel{
  String name ;
  String id ;

  CategoryModel({this.name, this.id});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['categoryId'] as String,
      name: json['categoryName'] as String,



    );
  }
}
Future<List<CategoryModel>> GetCategories(http.Client client,String url) async {
  final response =
  await client.get(url);

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(ParseReview, response.body);
}

// A function that converts a response body into a List<Photo>.
List<CategoryModel> ParseReview(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<CategoryModel>((json) => CategoryModel.fromJson(json)).toList();
}

