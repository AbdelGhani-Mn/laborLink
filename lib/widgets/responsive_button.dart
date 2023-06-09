// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:laborlink/misc/colors.dart';
import 'package:laborlink/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  String text;
  ResponsiveButton({super.key, this.width,this.isResponsive=false,required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.buttonColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        AppText(text: text, color: Colors.white,),
         const Icon(Icons.keyboard_double_arrow_right_rounded),
        ],
      ),
    );
  }
}