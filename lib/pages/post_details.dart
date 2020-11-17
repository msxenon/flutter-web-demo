import 'package:flutter/material.dart';
import 'package:flutter_web_demo/repo/data/post_model.dart';
import 'package:flutter_web_demo/widgets/random_image.dart';

class PostDetails extends StatelessWidget {
  final int postId;
  PostDetails({Key? key,required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context,constraints) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Demo Web App'),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                  // RandomImage(keyword: postModel.title,),
                  // Text(postModel.title,style: TextStyle(fontSize: 20),),
                  // Text(postModel.body,style: TextStyle(fontSize: 15),)
                ],
              ),
            ),
          );
        }
    );
  }
}
