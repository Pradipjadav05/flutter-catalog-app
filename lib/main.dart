import "package:flutter/material.dart";
import 'package:flutter_application_2/core/store.dart';
import 'package:flutter_application_2/screen/cart_page.dart';
import 'package:flutter_application_2/screen/home_detail_page.dart';
import 'package:flutter_application_2/utils/routes.dart';
import 'package:flutter_application_2/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'screen/home_page.dart';
import 'screen/login_page.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(VxState(
    store: MyStore(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var vxNavigator = VxNavigator(routes: {
      "/": (_, __) => const MaterialPage(child: HomePage()),
      MyRoutes.homeRoute: (_, __) => const MaterialPage(child: HomePage()),
      MyRoutes.homeDetailsRoute: (uri, _) {
        final catalog = (VxState.store as MyStore)
            .catalog
            .getById(int.parse(uri.queryParameters["id"]!));
        return MaterialPage(
            child: HomeDetailPage(
          catalog: catalog,
        ));
      },
      MyRoutes.loginRoute: (_, __) => const MaterialPage(child: LoginPage()),
      //MyRoutes.signupRoute: (_, __) => MaterialPage(child: SignUpPage()),
      MyRoutes.cartRoute: (_, __) => const MaterialPage(child: CartPage()),
    });
    (VxState.store as MyStore).navigator = vxNavigator;

    return MaterialApp.router(
        themeMode: ThemeMode.system,
        theme: MyTheme.lightTheme(context),
        darkTheme: MyTheme.darkTheme(context),
        debugShowCheckedModeBanner: false,
        routeInformationParser: VxInformationParser(),
        routerDelegate: vxNavigator);
    // initialRoute: MyRoutes.homeRoute,
    // routes: {
    //   '/': (context) => const LoginPage(),
    //   MyRoutes.homeRoute: (context) => const HomePage(),
    //   MyRoutes.loginRoute: (context) => const LoginPage(),
    //   MyRoutes.cartRoute: (context) => const CartPage(),
    // },
  }
}
