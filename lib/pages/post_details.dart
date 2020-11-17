import 'package:flutter/material.dart';
import 'package:flutter_web_demo/repo/data/post_model.dart';
import 'package:flutter_web_demo/repo/posts_repo.dart';
import 'package:flutter_web_demo/widgets/random_image.dart';

class PostDetails extends StatefulWidget {
  static const String baseRoute = '/posts';

  final int postId;
  PostDetails({Key? key,required this.postId}) : super(key: key);

  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  bool _isLoaded = false;
   PostModel? currentPost;
  @override
  void initState() {
     super.initState();
        final posts = PostsRepo().posts;

         currentPost = posts.firstWhere((element) => element.id == widget.postId
             ,orElse:() => PostModel(userId: -1, id: -1, title: '', body: '')
         );
         print('currentPost: ${currentPost?.toString()}');
         if(currentPost == null || currentPost?.id == -1) {
           Navigator.pushReplacementNamed(
             context,
             '/',
           );
         } else {
           _isLoaded = true;
           if(mounted) {
             setState(() {
             });
           }
         }



  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context,constraints) {
          bool isWideScreen = constraints.maxWidth > constraints.maxHeight;
          return Scaffold(
            appBar: AppBar(
              title: Text('Demo Web App'),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: !_isLoaded ? [
                  CircularProgressIndicator()
                ]:
                isWideScreen ? [
                  Row(
                    children: [
                      SizedBox(width: (constraints.maxWidth/2),child: RandomImage(keyword: currentPost!.title,)),
                      Column(
                        children: [
                          Padding(child: Text(currentPost!.fullTitle,style: TextStyle(fontSize: 20),),padding:EdgeInsets.all(10)),
                          Padding(child: Text(currentPost!.body,style: TextStyle(fontSize: 15)),padding:EdgeInsets.all(10)),
                        ],
                      ),
                    ],
                  )
                ] :
                [
                  RandomImage(keyword: currentPost!.title,),
                  Padding(child: Text(currentPost!.fullTitle,style: TextStyle(fontSize: 20),),padding:EdgeInsets.all(10)),
                  Padding(child: Text(currentPost!.body,style: TextStyle(fontSize: 15)),padding:EdgeInsets.all(10)),
                ],
              ),
            ),
          );
        }
    );
  }
}
