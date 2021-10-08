import 'package:cbakes/home/presentation/screens/large.dart';
import 'package:cbakes/home/presentation/screens/small.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final bool smallLayout = constraints.maxWidth <= 640;
        final bool mediumLayout =
            constraints.maxWidth > 640 && constraints.maxWidth <= 1007;
        final bool largeLayout = constraints.maxWidth >= 1008;
        if (largeLayout) {
          return const LargeHomePage();
        }
        if (mediumLayout) {
          return const LargeHomePage();
        }
        if (smallLayout) {
          return const SmallHomePage();
        }
        return const LargeHomePage();
      },
    );
  }
}
