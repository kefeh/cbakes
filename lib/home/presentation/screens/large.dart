import 'dart:async';

import 'package:cbakes/checkout/presentation/checkout.dart';
import 'package:cbakes/core/application/providers.dart';
import 'package:cbakes/core/presentation/routes/app_router.gr.dart';
import 'package:cbakes/core/dormain/food_item.dart';
import 'package:cbakes/core/presentation/widgets/helper.dart';
import 'package:cbakes/core/presentation/widgets/marquee.dart';
import 'package:cbakes/home/presentation/widgets/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LargeHomePage extends ConsumerWidget {
  const LargeHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size.width;
    final widthFactor = size / 7;
    final height = MediaQuery.of(context).size.height;
    final heightFactor = (height / 8) - 20;
    final headerSize = size * 0.03;

    final double widthPropotions = size / 10;
    final double heightPropotions = height / 10;
    final double sideBarWidth = widthPropotions * 2.5;
    final double mainPadding = size / 40;
    final bool smallScreen = size < 920;

    final List<FoodItem> foodItems = FoodItem.items;

    final servedNotifier = ref.watch(servedPageProvider);

    final appRouter = AutoRouter();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              flex: 1,
              child: AppMarquee(),
            ),
            servedNotifier.when(
                checkoutBread: () => CheckoutLarge(
                    mainPadding: mainPadding,
                    smallScreen: smallScreen,
                    widthPropotions: widthPropotions,
                    sideBarWidth: sideBarWidth,
                    heightPropotions: heightPropotions),
                checkoutRestaurant: () => CheckoutLarge(
                    mainPadding: mainPadding,
                    smallScreen: smallScreen,
                    widthPropotions: widthPropotions,
                    sideBarWidth: sideBarWidth,
                    heightPropotions: heightPropotions),
                home: () => HomeLarge(
                    widthFactor: widthFactor,
                    heightFactor: heightFactor,
                    appRouter: appRouter,
                    headerSize: headerSize,
                    size: size,
                    height: height,
                    foodItems: foodItems))
          ],
        ),
      ),
    );
  }
}

class HomeLarge extends ConsumerWidget {
  const HomeLarge({
    Key? key,
    required this.widthFactor,
    required this.heightFactor,
    required this.appRouter,
    required this.headerSize,
    required this.size,
    required this.height,
    required this.foodItems,
  }) : super(key: key);

  final double widthFactor;
  final double heightFactor;
  final AutoRouter appRouter;
  final double headerSize;
  final double size;
  final double height;
  final List<FoodItem> foodItems;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      flex: 7,
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: SizedBox(
                    width: widthFactor,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(30),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.center,
                          child: HamBurger.large(heightFactor),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0.01, 0),
                  child: SizedBox(
                    width: widthFactor * 6,
                    child: Align(
                      alignment: const Alignment(1, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 16.0, bottom: 16.0),
                                child: Image.asset("assets/images/logo.png",
                                    height: heightFactor),
                              ),
                              Row(
                                children: [
                                  DroppingButton(
                                    height: heightFactor,
                                    text: "PASTRY",
                                    onPressed: () => ref
                                        .read(servedPageProvider.notifier)
                                        .setCheckoutBread(),
                                  ),
                                  SizedBox(
                                    width: widthFactor / 2,
                                  ),
                                  DroppingButton(
                                    height: heightFactor,
                                    text: "RESTAURANT",
                                    onPressed: () => ref
                                        .read(servedPageProvider.notifier)
                                        .setCheckoutBread(),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: headerSize / 2,
                              )
                            ],
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: size / 14),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Your health",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(fontSize: headerSize),
                                          ),
                                          Text(
                                            "largely depends on",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(fontSize: headerSize),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              text: "",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                      fontSize: headerSize),
                                              children: [
                                                TextSpan(
                                                  text: "what you eat",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline1!
                                                      .copyWith(
                                                        color: const Color
                                                                .fromRGBO(
                                                            246, 67, 67, 1),
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        fontSize: headerSize,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            "C&C, your trusted and reliable food service",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline2!
                                                .copyWith(
                                                    fontSize: headerSize / 2.2),
                                          ),
                                        ],
                                      ),
                                      ButtonMain.activeLight(
                                        text: "explore pastry",
                                        onPressed: () => ref
                                            .read(servedPageProvider.notifier)
                                            .setCheckoutBread(),
                                      ),
                                    ],
                                  ),
                                ),
                                AspectRatio(
                                  aspectRatio: size / height,
                                  child: Image.asset(
                                    "assets/images/bread.png",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(left: widthFactor / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      bottom: 8.0,
                      left: 8.0,
                    ),
                    child: Text(
                      "Contact Us",
                      style: TextStyle(
                        color: Color.fromRGBO(51, 70, 91, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SocialMedia(
                              caption: "+237 675 619 592",
                              icon: MdiIcons.whatsapp,
                            ),
                            SocialMedia(
                              caption: "c&c_pasteries_facebook",
                              icon: MdiIcons.facebook,
                            ),
                            SocialMedia(
                              caption: "c&c_pasteries_instagram",
                              icon: MdiIcons.instagram,
                            ),
                          ],
                        ),
                        SponsorCatalogue(width: widthFactor),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
