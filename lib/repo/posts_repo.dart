
import 'package:flutter_web_demo/repo/data/post_model.dart';

class PostsRepo {
   List<PostModel> posts;
   PostsRepo():
     posts = [
       PostModel(userId: 1, id: 1, title: 'Tech news post title #1', body: 'Tech news post body'),
       PostModel(userId: 1, id: 2, title: 'new Tech news post title #2', body: 'Tech news post body'),
       PostModel(userId: 1, id: 3, title: 'latest Tech news post title #3', body: 'Tech news post body'),
       PostModel(userId: 1, id: 4, title: 'Computer Tech news post title #4', body: 'Tech news post body'),
       PostModel(userId: 1, id: 5, title: 'OS Tech news post title #5', body: 'Tech news post body'),
       PostModel(userId: 1, id: 6, title: 'UbiSoft news post title #1', body: 'Tech news post body'),
       PostModel(userId: 1, id: 7, title: 'WIX Tech news post title #2', body: 'Tech news post body'),
       PostModel(userId: 1, id: 8, title: 'AMAZON Tech news post title #3', body: 'Tech news post body'),
       PostModel(userId: 1, id: 9, title: 'Microsoft Tech news post title #4', body: 'Tech news post body'),
       PostModel(userId: 1, id: 10, title: 'Apple Tech news post title #5', body: 'Tech news post body'),
     ];
}