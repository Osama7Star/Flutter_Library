import 'package:flutter/material.dart';
import 'package:flutter_library/pages/widgets/InputField.dart';

class SuggestBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Column(
          children: [
            InputFiled(hintText:'إسم الكتاب'),
            InputFiled(hintText:'إسم الكاتب'),
            InputFiled(hintText:'ملاحظة'),

          ],
        ),
      ),
    );
  }
}



