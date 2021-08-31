import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:cbakes/core/presentation/routes/app_router.gr.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final initializationProvider = FutureProvider<Unit>((ref) async {
  Future.delayed(
    const Duration(seconds: 5),
  );
  return unit;
});

class MainWidget extends StatelessWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRouter = AutoRouter();
    return ProviderListener(
      provider: initializationProvider,
      onChange: (BuildContext context, value) {
        appRouter.pushAndPopUntil(
          const HomeRoute(),
          predicate: (predicate) => true,
        );
      },
      child: MaterialApp.router(
        routeInformationParser: appRouter.defaultRouteParser(),
        routerDelegate: appRouter.delegate(),
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.rubikTextTheme(
            Theme.of(context).textTheme,
          ).apply(
            bodyColor: const Color.fromRGBO(51, 70, 91, 1),
          ),
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          }),
          primaryColor: const Color.fromRGBO(51, 70, 91, 1),
        ),
      ),
    );
  }
}
