import 'package:flutter/material.dart';
import 'package:flutter_library/pages/widgets/bookcard.dart';
import 'package:flutter_library/utilites.dart';

import '../../main.dart';
class Author extends StatefulWidget {
  @override
  _AuthorState createState() => _AuthorState();
}

class _AuthorState extends State<Author> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CoustomeAppBar(userName: "Osama Alnajm",),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              /// Author Information
              SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 20,

                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: FadeInImage(

                          width: 250,
                            height: 200,
                            image: NetworkImage(
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Elizabeth_Gilbert_at_TED.jpg/1200px-Elizabeth_Gilbert_at_TED.jpg'),
                            placeholder: AssetImage('assets/defaultbook.png')),
                      ),
                      Text('Elizabith Gilbert',style:kStyleTitle ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20,left: 10,right: 10),
                        child: Text('Here is the bio of the this author , this author has write alot of book in many fields ',style: TextStyle(fontSize: 17),),
                      )
                    ],
                  ),
                ),
              ),
             Card(
               child: Column(
                 children: [
//                   bookCard(name: 'Sapiens',imageUrl: 'test'),
//                   bookCard(name: 'Sapiens',imageUrl: 'test'),
//                   bookCard(name: 'Sapiens',imageUrl: 'test'),
//                   bookCard(name: 'Sapiens',imageUrl: 'test'),
//                   bookCard(name: 'Sapiens',imageUrl: 'test'),

                 ],
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}
