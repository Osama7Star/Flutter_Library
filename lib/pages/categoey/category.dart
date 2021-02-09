import 'package:flutter/material.dart';
import 'package:flutter_library/Services/CategoryModel.dart';

import '../../utilites.dart';
class Category extends StatelessWidget {
  final List<CategoryModel> categories;

  const Category({Key key, this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      child: Container(

          child:SizedBox(

            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: categories.length,

              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    print(categories[index].id);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                         // builder: (context) => book(id:photos[index].id),
                        ));
                  },
                  // onTap: widget.function,
                  child: Card(


                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: category(name:categories[index].name),
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

class category extends StatelessWidget {

  String name ;
  category({this.name});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
