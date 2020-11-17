import 'package:flutter/material.dart';

class RandomImage extends StatelessWidget {
  final String keyword;

  const RandomImage({Key? key, required this.keyword}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network('https://source.unsplash.com/500x500/?$keyword,tech',fit: BoxFit.cover,);
  }
}
