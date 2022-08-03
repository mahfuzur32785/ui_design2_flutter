import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  //CustomText({Key? key,this.data}) : super(key: key);

  String? data;
  CustomText({this.data});

  @override
  Widget build(BuildContext context) {
    return Text(data!,
    style: TextStyle(
    fontSize: 18,
    color: Color(0xFF323232),
    fontWeight: FontWeight.w500,
    ),
    );
  }
}
