import 'package:auto_route/auto_route.dart';
import 'package:cbakes/checkout/presentation/checkout.dart';
import 'package:cbakes/home/presentation/home_page.dart';
import 'package:cbakes/splash/presentation/splash_page.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: HomePage, path: '/home'),
    MaterialRoute(page: CheckoutPage, path: '/checkout'),
  ],
  replaceInRouteName: 'Page,Route',
)
class $AutoRouter {}
