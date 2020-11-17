import 'package:flutter/material.dart';

class UnKnown extends StatelessWidget {
  UnKnown({Key? key}) : super(key: key);
  static const String route = '/404';

   @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context,constraints) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Demo Web App'),
            ),
            body: Center(
              child: Text('Unknown page 404!',style: TextStyle(fontSize: 20),),
            ),
          );
        }
    );
  }
}
