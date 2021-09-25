import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:cbakes/core/presentation/routes/app_router.gr.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/services.dart';

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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    final appRouter = AutoRouter();
    final textTheme = Theme.of(context).textTheme;
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
          textTheme: GoogleFonts.rubikTextTheme(textTheme)
              .apply(
                displayColor: const Color.fromRGBO(33, 45, 59, 1),
              )
              .copyWith(
                headline1: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontSize: 72,
                    fontWeight: FontWeight.w900,
                    color: Color.fromRGBO(33, 45, 59, 1),
                  ),
                ),
                button: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
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
