import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_library/pages/widgets/UserReviews.dart';
import 'package:http/http.dart' as http;

class ReviewBook {

  String reviewId ;
  String review ;
  String userId ;
  String userImageUrl;
  String text;
  String date;
  String rate;

  ReviewBook({this.reviewId, this.review, this.userId, this.userImageUrl,
      this.text, this.date,this.rate});

  factory ReviewBook.fromJson(Map<String, dynamic> json) {
    return ReviewBook(
      reviewId: json['reviewId'] as String,
      review: json['review'] as String,
      userId: json['userId'] as String,
      userImageUrl: json['bookPages'] as String,
      date: json['date'] as String,
      rate: json['rate'] as String,


    );
  }

}
  Future<List<ReviewBook>> getReview(http.Client client,String url) async {
    final response =
    await client.get(url);

    // Use the compute function to run parsePhotos in a separate isolate.
    return compute(ParseReview, response.body);
  }

// A function that converts a response body into a List<Photo>.
  List<ReviewBook> ParseReview(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<ReviewBook>((json) => ReviewBook.fromJson(json)).toList();
  }

