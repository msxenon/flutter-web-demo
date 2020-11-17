import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_web_demo/repo/posts_repo.dart';
import 'package:flutter_web_demo/widgets/post.dart';

class Home extends StatefulWidget {
  static final route = '/';
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PostsRepo _postsRepo = PostsRepo();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final int _crossAxisCount = constraints.maxWidth ~/ 300;
        return GridView.builder(
          itemCount: _postsRepo.posts.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: max(_crossAxisCount, 1),
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
          ),
          itemBuilder: (context, index) {
            return PostRow(
              key: PageStorageKey<int>(index),
              postModel: _postsRepo.posts[index],
              onTap: (postId) => Navigator.pushNamed(context, '/posts/$postId')
              ,
            );
          },
        );
      },
    );
  }
}
