import 'package:flutter/material.dart';

import '../../utilites.dart';
class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  category(name:'Scince'),
                  category(name:'Scince'),
                  category(name:'Scince'),
                  category(name:'Scince'),
                  category(name:'Scince'),


                ]
              ),
            ),
          ),
      ),
    );
  }
}

class category extends StatelessWidget {

  String name ;
  category({this.name});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(

        color: mainColor,
        elevation: 20,
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(name,          textAlign: TextAlign.center,
                  style: kStyleTitle.copyWith(color: Colors.white70,letterSpacing: 2),),)),
    );
  }
}
