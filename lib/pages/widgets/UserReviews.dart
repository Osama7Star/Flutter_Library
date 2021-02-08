import 'package:flutter/material.dart';
import 'package:flutter_library/Services/ReviewBook.dart';

import '../../utilites.dart';
class BookReviews extends StatelessWidget {
  final List<ReviewBook> bookReview;

  const BookReviews({Key key, this.bookReview}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// user image and fullname and user name
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Color(0xffFDCF09),
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/person.jpg'),
                ),
              ),
             Padding(
               padding: const EdgeInsets.only(left: 7),
               child: Column(

                 children: [
                   Text('fullName',style: kStyleTitle.copyWith(fontSize: 15),),
                   SizedBox(height: 3),
                   Text('@ ''')
                 ],
               ),
             )
            ],
          ),
        /// review writter bu user
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('review',style: kStyleTitle.copyWith(fontSize: 18),),
          ),
          //date
          Container(
              alignment: Alignment.bottomRight,
              child: Text('12-1-2021'))
        ],
      ),

    );
  }
}
