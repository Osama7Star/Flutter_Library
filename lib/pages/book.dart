import 'package:flutter/material.dart';
import 'package:flutter_library/Services/BookModel.dart';
import 'package:flutter_library/pages/widgets/AppBar.dart';
import 'package:flutter_library/pages/widgets/UserReviews.dart';
import 'package:flutter_library/pages/widgets/bookcard.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../main.dart';
import 'package:http/http.dart' as http;

import '../utilites.dart';

class book extends StatefulWidget {
  @override
  _bookState createState() => _bookState();
  String id ;
  book({this.id});
}

class _bookState extends State<book> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CoustomeAppBar(userName: 'Osama Alnajm'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(

            children: [
              FutureBuilder<List<Photo>>(

                future: FetchBook(http.Client(),'https://api.afropolicy.com/api/web/v1/recipes/getbookbyid?access-token=test&bookId=${widget.id}'),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  print ('test https://api.afropolicy.com/api/web/v1/recipes/getbookbyid?access-token=test&bookId=${widget.id}');

                  return snapshot.hasData
                      ?               BookInfo(photos:snapshot.data)

                      : Center(child: CircularProgressIndicator());
                },
              ),

              /// GET SIMILAR BOOKS

              FutureBuilder<List<Photo>>(
                future: FetchBook(http.Client(),'https://api.afropolicy.com/api/web/v1/recipes/getcategorybook?access-token=test&categoryid=22'),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);

                  return snapshot.hasData
                      ?               BookCard(photos:snapshot.data)

                      : Center(child: CircularProgressIndicator());
                },
              ),
            ],


               ),
        ),
      ),
    );
  }
}

class BookInfo extends StatelessWidget {
  final List<Photo> photos;

  const BookInfo({Key key, this.photos}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: (Card(
            elevation: 20,
            child: FadeInImage(
                image: NetworkImage(
                    photos[0].imageUrl),
                placeholder: AssetImage('assets/defaultbook.png')),
          )),
        ),

        Card(
          elevation: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                photos[0].name,
                style: kStyleTitle.copyWith(fontSize: 30),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Pages',
                            style: kStyleTitle.copyWith(
                                color: Colors.green)),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                            photos[0].page, style: kStyleTitle),
                      ],
                    ),
                    Row(
                      children: [
                        Text('category',
                            style: kStyleTitle.copyWith(
                                color: Colors.green)),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Roman', style: kStyleTitle),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Author ',
                            style: kStyleTitle.copyWith(
                                color: Colors.green)),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Eli', style: kStyleTitle),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          tagButton(tag:photos[0].tag1),
                          tagButton(tag: photos[0].tag2),
                          tagButton(tag: photos[0].tag3)
                        ],
                      ),
                    ),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    Card(
                      color: Colors.grey[200],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          photos[0].summary,
                          style: kStyleTitle.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),


      ],
    ));
  }
}

class tagButton extends StatelessWidget {
  tagButton({this.tag});

  String tag;

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      padding: const EdgeInsets.all(8.0),
      textColor: Colors.white,
      color: mainColor,
      onPressed: () {},
      child: new Text(tag),
    );
  }
}
