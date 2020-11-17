import 'package:flutter/material.dart';
import 'package:flutter_web_demo/repo/data/post_model.dart';
import 'package:flutter_web_demo/widgets/random_image.dart';

class PostRow extends StatelessWidget {
  final PostModel postModel;
  final Function(int?) onTap;
 const PostRow({Key? key,required this.postModel,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            InkWell(onTap: (){
              onTap(postModel.id);
            },child: RandomImage(keyword: postModel.title,)),
            Container(
              padding: EdgeInsets.all(10),
              child: SelectableText(postModel.title,style: TextStyle(color: Colors.white),),color: Colors.black54,width: double.infinity,)
          ],
        ),
      ),
    );
  }
}
