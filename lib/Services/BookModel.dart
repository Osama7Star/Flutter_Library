import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';



class Photo {

  String id;
  String ISBN;
  String name;
  String page;
  String categoryId;
  String authorId;
  String tag1,tag2,tag3;
  String summary;
  String imageUrl;
  String bookStatus;
  String userId;
  String rate;
  String note;


  Photo({
      this.id,
      this.ISBN,
      this.name,
      this.page,
      this.categoryId,
      this.authorId,
      this.tag1,
      this.tag2,
      this.tag3,
      this.summary,
      this.imageUrl,
      this.bookStatus,
      this.userId,
      this.rate,
      this.note});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['bookId'] as String,
      ISBN: json['ISBN'] as String,
      name: json['bookName'] as String,
      page: json['bookPages'] as String,
      categoryId: json['categoryId'] as String,
      authorId: json['authorId'] as String,
      tag1: json['tag1'] as String,
      tag2: json['tag2'] as String,
      tag3: json['tag3'] as String,
      summary: json['summary'] as String,
      imageUrl: json['imageUrl'] as String,
      bookStatus: json['bookstatus'] as String,
      userId: json['userId'] as String,
      rate: json['rate'] as String,
      note: json['note'] as String,
    );
  }
}

/// get the data from the internet


Future<List<Photo>> FetchBook(http.Client client,String url) async {
  final response =
  await client.get(url);

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsePhotos, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Photo> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}
