import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget AddtocartButton({required double h,required double w,required IconData iconData}) {
  return Container(
    height: h,
    width: w,
    decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.all(Radius.circular(10))),
    child: Center(
      child: Icon(
        iconData,
        color: Colors.black,
      ),
    ),
  );
}
