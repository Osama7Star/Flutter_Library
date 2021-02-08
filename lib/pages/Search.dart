import 'package:flutter/material.dart';
import 'package:flutter_library/Services/BookModel.dart';
import 'package:flutter_library/pages/widgets/bookcard.dart';

import '../main.dart';
import '../utilites.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CoustomeAppBar(
        userName: 'osama alanajm',
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: myController,
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: mainColor)),
                hintText: 'Tell us about yourself',
                suffixIcon: const Icon(
                  Icons.search,
                  color: Colors.green,
                ),
              ),
            ),
          ),
          RaisedButton(
            child: Text('Click'),
            onPressed: () {
              print('TestSearch');

              FutureBuilder<List<Photo>>(
                future: FetchBook(http.Client(),
                    'https://api.afropolicy.com/api/web/v1/recipes/getcategorybook?access-token=test&categoryid=22'),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);

                  return snapshot.hasData
                      ? Text('test')
                      : Center(child: CircularProgressIndicator());
                },
              );

            },
          )
        ],
      ),
    );
  }
}
