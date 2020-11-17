import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final Function onTap;
  final String title;
  MenuItem({Key? key, required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: EdgeInsets.all(10),
          child: InkWell(onTap:()=> onTap, child: Text(title))),
    );
  }
}
