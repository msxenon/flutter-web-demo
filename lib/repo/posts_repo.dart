import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_web_demo/repo/data/post_model.dart';

class PostsRepo {
   List<PostModel>? posts;
  Future<List<PostModel>>  getPosts ()async{
      if(posts == null) {
         await _loadData();
      }
        return posts!;
  }
  Future _loadData() async {
    String jsonString = await _loadFromAsset();
    final List<dynamic>jsonResponse = jsonDecode(jsonString);
    posts = List.generate(jsonResponse.length, (index) {
      return PostModel.fromJson(jsonResponse[index]);
    });
    return true;
  }
  Future<String>_loadFromAsset() async {
    return await rootBundle.loadString('/posts.json');
  }
}