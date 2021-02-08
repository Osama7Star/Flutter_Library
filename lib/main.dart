import 'package:flutter/material.dart';
import 'package:flutter_library/pages/Search.dart';
import 'package:flutter_library/pages/author/author.dart';
import 'package:flutter_library/pages/book.dart';
import 'package:flutter_library/pages/categoey/category.dart';
import 'package:flutter_library/pages/home.dart';
import 'package:flutter_library/pages/widgets/AppBar.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Title1',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => book(),
          '/search': (context) => Search(),
        });
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CoustomeAppBar(),
      body: Text('first1'),
    );
  }
}

class CoustomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  String userName;

  CoustomeAppBar({this.userName});

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(userName), actions: [
      IconButton(
    icon: Icon(Icons.search),
    onPressed: (){
      Navigator.of(context).pushNamed('/search');

    }
      ),
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Icon(Icons.add),
      )
    ]);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(40, 40);
}
