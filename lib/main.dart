import 'package:flutter/material.dart';
import 'package:food_app_folkatech/common/router/routes.dart';
import 'package:food_app_folkatech/common/router/router.dart';
import 'package:food_app_folkatech/provider/product_list_provider.dart';
import 'package:food_app_folkatech/view/effect/scrolls.dart';
import 'package:food_app_folkatech/common/theme/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductListProvider(),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        onGenerateTitle: (BuildContext context) => 'Food App',
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: Themes.mainTheme,
        initialRoute: Routes.splash,
        onGenerateRoute: (settings) => AppRouter.generateRoute(
          settings,
          const BouncingScrollBehavior(),
        ),
      ),
    );
  }
}
