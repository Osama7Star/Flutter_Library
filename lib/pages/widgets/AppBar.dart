import 'package:flutter/material.dart';
class AppBar1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.settings,
            color: Colors.white,
          ),
          onPressed: () {
            // do something
          },
        )
      ],

    );
  }
}
