import 'package:flutter/material.dart';
import 'package:flutter_web_demo/pages/Unknown.dart';
import 'package:flutter_web_demo/pages/home.dart';
import 'package:flutter_web_demo/pages/post_details.dart';
import 'package:flutter_web_demo/repo/data/post_model.dart';
import 'package:flutter_web_demo/repo/posts_repo.dart';
import 'package:flutter_web_demo/route/app_route_path.dart';

class AppRouterDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
   PostsRepo? _postsRepo;
  bool _isLoaded = false;
  int? _selectedModel;
  bool show404 = false;
   AppRouterDelegate() {
    _postsRepo = PostsRepo();
    _postsRepo?.getPosts().then((value) {
      _isLoaded = true;
       notifyListeners();
    });
  }
  PostModel? getPost(int? id){
    return _postsRepo?.posts?.firstWhere((element) {
      print('getPost ${element.toString()}  $id');
      return element.id == id;
    });
  }
  @override
  Widget build(BuildContext context) {
     print('build hasSelectedModel: ${_selectedModel != null}');
    return Navigator(
      key: navigatorKey,
      pages:  !_isLoaded
          ? [
              MaterialPage(
                key: ValueKey('loading'),
                child: CircularProgressIndicator(),
              )
            ]
          : [

              if (show404)
                MaterialPage(
                    key: ValueKey('UnknownPage'), child: UnKnown())
              else if (_selectedModel != null)
                MaterialPage(
                  key: ValueKey(_selectedModel),
                  child:      PostDetails(postId:_selectedModel!),
                ),
        MaterialPage(
          key: ValueKey('HomePage'),
          child: Home(
              posts: _postsRepo!.posts!,
              onTap:(postId){
                final postAboutToOpen = getPost(postId);
                if (  postAboutToOpen == null) {
                  show404 = true;
                } else {
                  _selectedModel = postAboutToOpen;
                  show404 = false;
                }
                notifyListeners();
              }
          ),
        ),
            ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        // Update the list of pages by setting _selectedBook to null
        print('setNewRoutePath 44');
        _selectedModel = null;
        show404 = false;
        notifyListeners();

        return true;
      },
    );
  }


  @override
  Future<void> setNewRoutePath(AppRoutePath path) async {
    print('setNewRoutePath ${path.toString()}');
    if (path.isUnknown) {
      print('setNewRoutePath 11');
      _selectedModel = null;
      show404 = true;
      return;
    }
    if(path.isHomePage){
      print('setNewRoutePath 33');
      _selectedModel = null;
    show404 = false;
    return;
    }
    if(path.isDetailsPage) {
      final postAboutToOpen = getPost(path.id);
      _selectedModel = postAboutToOpen;
      print('setNewRoutePath 55 ${postAboutToOpen.toString()} || ${_postsRepo!.posts!.length}');
    } else {
      print('setNewRoutePath 22');
      _selectedModel = null;
    }
    show404 = false;

  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();
}

class AppPathInformationParser extends RouteInformationParser<AppRoutePath> {
  @override
  Future<AppRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    print('parseRouteInformation ${routeInformation.location}');

    final uri = Uri.parse(routeInformation.location ?? '');
    final segmants = uri.pathSegments;
    //handle home
    if (segmants.isEmpty) {
      return AppRoutePath.home();
    }
    //handle Posts details page
    if (segmants.length == 2) {
      if (segmants.first == 'posts') {
        final postId = int.tryParse(segmants.elementAt(1));
        if (postId != null) {
          return AppRoutePath.post(postId);
        }
      }
    }
    //handle unknown page
    return AppRoutePath.unKnown();
  }

//used to keep data in browser history
  @override
  RouteInformation restoreRouteInformation(AppRoutePath configuration) {
    print('restoreRouteInformation ${configuration.toString()}');
    if (configuration.isHomePage) {
      return RouteInformation(location: '/');
    }
    if (configuration.id != null) {
      return RouteInformation(location: '/posts/${configuration.id}');
    }

    return  RouteInformation(location: '/404');
  }
}
