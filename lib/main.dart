import 'package:flutter/material.dart';
import 'package:flutter_web_demo/pages/home.dart';
import 'package:flutter_web_demo/pages/post_details.dart';
import 'package:flutter_web_demo/pages/unknown.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Web Demo',
      initialRoute: Home.route,
      onGenerateRoute: RouteConfiguration.onGenerateRoute,
    ),
  );
}

class Path {
  const Path(this.pattern, this.builder);

  /// A RegEx string for route matching.
  final String pattern;

  /// The builder for the associated pattern route. The first argument is the
  /// [BuildContext] and the second argument is a RegEx match if it is
  /// included inside of the pattern.
  final Widget Function(BuildContext, String) builder;
}

class RouteConfiguration {
  /// List of [Path] to for route matching. When a named route is pushed with
  /// [Navigator.pushNamed], the route name is matched with the [Path.pattern]
  /// in the list below. As soon as there is a match, the associated builder
  /// will be returned. This means that the paths higher up in the list will
  /// take priority.
  static List<Path>  paths = [
    Path(
      r'^' + PostDetails.baseRoute + r'/([\w-]+)$',
          (context, match) => PostDetails(postId: int.parse(match)),
    ),
    Path(
     '^/\$',
          (context, match) => Home(),
    ),

  ];

  /// The route generator callback used when the app is navigated to a named
  /// route. Set it on the [MaterialApp.onGenerateRoute] or
  /// [WidgetsApp.onGenerateRoute] to make use of the [paths] for route
  /// matching.
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    for (Path path in paths) {
      final regExpPattern = RegExp(path.pattern);
      final match = regExpPattern.hasMatch(settings.name ?? '404');
      print('onGenerateRoute pattern:${path.pattern}, ${settings.toString()}, match: $match' );
      if (regExpPattern.hasMatch(settings.name ?? '404')) {
        final firstMatch = regExpPattern.firstMatch(settings.name!);
        final match = (firstMatch!.groupCount == 1) ? firstMatch.group(1) : null;
        String  routeName = match ?? UnKnown.route;
        print('route name $routeName');
        return MaterialPageRoute<void>(
          builder: (context) => path.builder(context, routeName),
          settings: settings,
        );
      }
    }

    // If no match was found, we let [WidgetsApp.onUnknownRoute] handle it.
    return MaterialPageRoute<void>(
      builder: (context) => UnKnown(),
      settings: settings,
    );
  }
}




