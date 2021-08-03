
import 'package:flutter/material.dart';
import 'package:snapets/ui/pages/home.dart';
import 'package:snapets/ui/pages/splash.dart';
import 'package:snapets/ui/pages/welcome.dart';


import '../helpers/customRoute.dart';


class Routes {
  static dynamic route() {
    return {
      'SplashPage': (BuildContext context) => SplashPage(),
    };
  }

  
  static Route? onGenerateRoute(RouteSettings settings) {
    final List<String> pathElements = settings.name!.split('/');
    if (pathElements[0] != '' || pathElements.length == 1) {
      return null;
    }
    switch (pathElements[1]) {
      
      
     
      case "Home":
        return CustomRoute<bool>(
          builder: (BuildContext context) => HomePage(),
        );
      case "Welcome":
        return CustomRoute<bool>(
          builder: (BuildContext context) => WelcomePage(),
        );
      default:
        return onUnknownRoute(RouteSettings(name: '/Feature'));
    }
  }

  static Route onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(settings.name!.split('/')[1]),
          centerTitle: true,
        ),
        body: Center(
          child: Text('${settings.name!.split('/')[1]} Comming soon..'),
        ),
      ),
    );
  }
}