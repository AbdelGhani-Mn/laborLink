// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laborlink/widgets/app_text.dart';
import 'app_large_text.dart';

class NumbersWidget extends StatelessWidget {
  const NumbersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildButton(context, '4.8', 'Ranking'),
          buildDevider(),
          buildButton(context, '4', 'Posts'),
          buildDevider(),
          buildButton(context, '50', 'Followers'),
        ],
      ),
    );
  }
  Widget buildDevider(){
    return Container(
      height: 24,
      child: VerticalDivider());
  }
  buildButton(BuildContext context, String value, String text) {
    return MaterialButton(
    padding: EdgeInsets.symmetric(vertical: 4),
    onPressed: (){},
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AppLargeText(text: value,size: 22),
        SizedBox(height: 2,),
        AppText(text: text,color: Colors.black, size: 15,),
      ],
    ),
    );
  }
}