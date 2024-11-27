import 'package:flutter/material.dart';

import 'colors.dart';
class TextUtil extends StatelessWidget {
  String text;
  Color? color;
  double? size;
  bool? weight;
  TextAlign align;
  TextUtil({super.key,required this.text,this.size,this.color,this.weight, this.align=TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return  Text(text,
      textAlign: align,
      style: TextStyle(color:color??TColor.primaryText,fontSize:size?? 16,
          fontWeight:weight==null?FontWeight.w600: FontWeight.w700,

      ),);
  }
}