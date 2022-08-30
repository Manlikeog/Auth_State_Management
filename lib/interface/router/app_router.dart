import 'package:flutter/material.dart';
import 'package:food_app/interface/pages/auth/auth.dart';
import 'package:food_app/interface/pages/dashboard/home/home.dart';
import 'package:food_app/interface/pages/onboard/onboard_page.dart';
import 'package:food_app/interface/pages/onboard/splash_page.dart';
import 'package:food_app/interface/router/route_name.dart';

class AppRouter {
  Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splashRoute:
        return MaterialPageRoute(
          builder: (_) => const Splash(),
        );
      case onBoardRoute:
        return MaterialPageRoute(
          builder: (_) => const Onboard(),
        );
      case authRoute:
        return MaterialPageRoute(
          builder: (_) => const Auth(),
        );
      case homeRoute:
        return MaterialPageRoute(
          builder: (_) => const Home(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            
            body: Center(
              child: Text(
                'No route defined for ${routeSettings.name}',
       
              ),
            ),
          ),
        );
    }
  }
}
