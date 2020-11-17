// import 'package:flutter/material.dart';
// import 'package:flutter_web_demo/MenuItem.dart';
// import 'package:flutter_web_demo/pages/contact_us.dart';
// import 'package:flutter_web_demo/pages/home.dart';
//
// class MainPage extends StatefulWidget {
//   MainPage({Key key}) : super(key: key);
//
//   @override
//   _MainPageState createState() => _MainPageState();
// }
//
// class _MainPageState extends State<MainPage> {
//   Widget body = Home();
//   @override
//   Widget build(BuildContext context) {
//      return LayoutBuilder(
//          builder: (context,constraints) {
//            bool fullMenu = constraints.maxWidth > 700;
//            return Scaffold(
//              appBar: AppBar(
//                title: Text('Demo Web App'),
//                actions: [
//                  if(fullMenu)
//                     MenuItem(
//                       title: 'Home',
//                       onTap: (){
//                         setState(() {
//                           body = Home();
//                         });
//                       },
//                     ),
//                  if(fullMenu)
//                    MenuItem(
//                      title: 'News',
//                      onTap: (){
//                        setState(() {
//                          body = Home();
//                        });
//                      },
//                    ),
//                  if(fullMenu)
//                    MenuItem(
//                      title: 'Contact us',
//                      onTap: (){
//                        setState(() {
//                          body = ContactUs();
//                        });
//                      },
//                    ),
//                  if(!fullMenu)
//                      IconButton(
//                        icon: Icon(Icons.menu),
//                        onPressed: (){
//
//                        },
//                      )
//                ],
//              ),
//              body: body,
//            );
//          }
//      );
//   }
// }
