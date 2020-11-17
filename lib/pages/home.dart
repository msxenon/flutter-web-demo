import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_web_demo/repo/data/post_model.dart';
import 'package:flutter_web_demo/widgets/post.dart';

class Home extends StatelessWidget {
  final List<PostModel> posts;
  final Function(int?) onTap;
  Home({Key? key,required this.posts,required this.onTap}) : super(key: key);


  @override
  Widget build(BuildContext context) {
     return LayoutBuilder(
       builder: (context,constraints){
         final int _crossAxisCount = constraints.maxWidth ~/ 300;
        return GridView.builder(
          itemCount: posts.length,
          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: max(_crossAxisCount, 1),
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
          ),
          itemBuilder: (context, index){
            return PostRow(key: PageStorageKey<int>(index),postModel : posts[index],onTap: onTap,);
          },
        );
       },
     );
  }
}
