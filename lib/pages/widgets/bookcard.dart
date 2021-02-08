import 'package:flutter/material.dart';
import 'package:flutter_library/Services/BookModel.dart';

import '../../utilites.dart';
import '../book.dart';


class BookCard extends StatelessWidget {
  final List<Photo> photos;

  const BookCard({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      child: Container(

          child:SizedBox(
            height: 300,
            width: 500,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,

              itemCount: photos.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    print(photos[index].id);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => book(id:photos[index].id),
                    ));
                  },
                  // onTap: widget.function,
                  child: Card(


                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 200,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,

                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FadeInImage(
//                     height: queryData.size.width*0.7,
//                      width:queryData.size.width*0.7,
                                width: 200,
                                height: 200,
                                image: NetworkImage(

                                    photos[index].imageUrl),
                                placeholder: AssetImage('assets/defaultbook.png')),
                            SizedBox(height: 10,),
                            Text( photos[index].name,style: kStyleTitle,),


                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },

            ),
          )
      ),
    );
  }
}

