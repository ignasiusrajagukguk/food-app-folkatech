import 'package:flutter/material.dart';
import 'package:food_app_folkatech/common/router/routes.dart';
import 'package:food_app_folkatech/view/screen/detail_pruduct/detail_product.dart';
import 'package:food_app_folkatech/view/screen/home/home.dart';
import 'package:food_app_folkatech/view/screen/splash/splash_screen.dart';

class AppRouter {
  static Route generateRoute(
      RouteSettings routeSettings, ScrollBehavior scrollBehavior) {
    return MaterialPageRoute<void>(
      settings: routeSettings,
      builder: (BuildContext context) {
        return ScrollConfiguration(
          behavior: scrollBehavior,
          child: _getScreen(
            settings: routeSettings,
          ),
        );
      },
    );
  }

  static Widget _getScreen({required RouteSettings settings}) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.splash:
        return const Splash();
      case Routes.home:
        return const Home();
      case Routes.detailProduct:
        ProductDetailArgument? argument;
        if (args is ProductDetailArgument) argument = args;
        return ProductDetail(argument: argument!);
      default:
        return Container();
    }
  }
}
