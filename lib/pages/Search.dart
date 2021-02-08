import 'package:flutter/material.dart';

import '../main.dart';
import '../utilites.dart';

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
              return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // Retrieve the text the that user has entered by using the
                    // TextEditingController.
                    content: Text(myController.text),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
