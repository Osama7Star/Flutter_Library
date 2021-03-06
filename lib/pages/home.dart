import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_library/Services/BookModel.dart';
import 'package:flutter_library/Services/CategoryModel.dart';
import 'package:flutter_library/pages/widgets/bookcard.dart';
import 'package:http/http.dart' as http;

import '../main.dart';
import '../utilites.dart';
import 'book.dart';
import 'categoey/category.dart';

final imgList = [
  "https://images.unsplash.com/photo-1501183007986-d0d080b147f9?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8ZnJlZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"
];

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    int _current = 0;

    return Scaffold(
      appBar: CoustomeAppBar(userName: "Sam Najm"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                items: imageSliders,
                options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.map((url) {
                  int index = imgList.indexOf(url);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index
                          ? Color.fromRGBO(0, 0, 0, 0.9)
                          : Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                  );
                }).toList(),
              ),

              /// GET CATEGORIES
              Card(
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(

                      children: [
                        Text(
                          "?????????????????? ",
                          style: kStyleTitle,
                        ),
                        SizedBox(
                          width: 1000,
                          height: 500,
                          child:  FutureBuilder<List<CategoryModel>>(
                            future: GetCategories(http.Client(),'https://api.afropolicy.com/api/web/v1/recipes/getcategories?access-token=test'),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) print(snapshot.error);

                              return snapshot.hasData
                                  ?               Category(categories:snapshot.data)

                                  : Center(child: CircularProgressIndicator());
                            },
                          ),

                        )
                      ],
                    ),
                  )),
              /// Similar books 1
              Card(
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(

                      children: [
                        Text(
                          "Similar Book ",
                          style: kStyleTitle,
                        ),
                        SizedBox(
                          height: 350,
                          child:  FutureBuilder<List<Photo>>(
                            future: FetchBook(http.Client(),'https://api.afropolicy.com/api/web/v1/recipes/getcategorybook?access-token=test&categoryid=22'),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) print(snapshot.error);

                              return snapshot.hasData
                                  ?               BookCard(photos:snapshot.data)

                                  : Center(child: CircularProgressIndicator());
                            },
                          ),

                        )
                      ],
                    ),
                  )),
              /// Similar books 2
              Card(
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(

                      children: [
                        Text(
                          "Similar Book ",
                          style: kStyleTitle,
                        ),
                        SizedBox(
                          height: 350,
                          child:  FutureBuilder<List<Photo>>(
                            future: FetchBook(http.Client(),'https://api.afropolicy.com/api/web/v1/recipes/getcategorybook?access-token=test&categoryid=22'),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) print(snapshot.error);

                              return snapshot.hasData
                                  ?               BookCard(photos:snapshot.data)

                                  : Center(child: CircularProgressIndicator());
                            },
                          ),

                        )
                      ],
                    ),
                  )),
              /// Similar books 3
              Card(
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(

                      children: [
                        Text(
                          "Similar Book ",
                          style: kStyleTitle,
                        ),
                        SizedBox(
                          height: 350,
                          child:  FutureBuilder<List<Photo>>(
                            future: FetchBook(http.Client(),'https://api.afropolicy.com/api/web/v1/recipes/getcategorybook?access-token=test&categoryid=22'),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) print(snapshot.error);

                              return snapshot.hasData
                                  ?               BookCard(photos:snapshot.data)

                                  : Center(child: CircularProgressIndicator());
                            },
                          ),

                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item,
                        fit: BoxFit.cover, width: double.infinity),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();
