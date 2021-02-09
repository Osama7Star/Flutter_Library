import 'package:flutter/material.dart';

import '../../utilites.dart';

class InputFiled extends StatefulWidget {
  const InputFiled({Key key, this.hintText}) : super(key: key);

  @override
  _InputFiledState createState() => _InputFiledState();
  final String hintText ;

}

class _InputFiledState extends State<InputFiled> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
    child:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: myController,
          decoration: new InputDecoration(
            border: new OutlineInputBorder(
                borderSide: new BorderSide(color: mainColor)),
            hintText: widget.hintText,
            suffixIcon: const Icon(
              Icons.search,
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
