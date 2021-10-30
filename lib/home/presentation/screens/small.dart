import 'package:cbakes/checkout/presentation/checkout.dart';
import 'package:cbakes/core/application/providers.dart';
import 'package:cbakes/core/dormain/food_item.dart';
import 'package:cbakes/core/presentation/widgets/helper.dart';
import 'package:cbakes/core/presentation/widgets/marquee.dart';
import 'package:cbakes/home/presentation/widgets/buttons.dart';
import 'package:cbakes/home/presentation/widgets/items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SmallHomePage extends ConsumerWidget {
  const SmallHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final widthFactor = size / 7;
    final headerSize = size * 0.07;

    final double widthPropotions = size / 10;
    final double heightPropotions = height / 10;
    final double sideBarWidth = widthPropotions * 2.5;
    final double mainPadding = size / 40;
    final bool smallScreen = size < 920;

    final List<FoodItem> foodItems = FoodItem.items;
    final servedNotifier = ref.watch(servedPageProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              flex: 1,
              child: AppMarquee(),
            ),
            servedNotifier.when(
              home: () => HomeSmall(
                  widthFactor: widthFactor,
                  size: size,
                  headerSize: headerSize,
                  foodItems: foodItems),
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
            )
          ],
        ),
      ),
    );
  }
}

class HomeSmall extends ConsumerWidget {
  const HomeSmall({
    Key? key,
    required this.widthFactor,
    required this.size,
    required this.headerSize,
    required this.foodItems,
  }) : super(key: key);

  final double widthFactor;
  final double size;
  final double headerSize;
  final List<FoodItem> foodItems;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      flex: 7,
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Row(
              children: [
                SizedBox(
                  width: widthFactor * 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                DroppingButtonSmall(
                                  text: "PASTRY",
                                  onPressed: () => ref
                                      .read(servedPageProvider.notifier)
                                      .setCheckoutBread(),
                                ),
                                SizedBox(
                                  width: widthFactor / 2,
                                ),
                                DroppingButtonSmall(
                                  text: "RESTAURANT",
                                  onPressed: () => ref
                                      .read(servedPageProvider.notifier)
                                      .setCheckoutBread(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child:
                              TitleAndCTA(size: size, headerSize: headerSize)),
                    ],
                  ),
                ),
                SizedBox(
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
                        child: HamBurger.small(20),
                      ),
                      const Align(
                        alignment: Alignment.bottomCenter,
                        child: CartButton(),
                      ),
                    ],
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
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SponsorCatalogue(width: widthFactor),
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                  height: 120,
                                  width: 120,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:
                                        Image.asset("assets/images/logo.png"),
                                  )),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SocialMedia(
                                      icon: MdiIcons.whatsapp,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SocialMedia(
                                      icon: MdiIcons.facebook,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SocialMedia(
                                      icon: MdiIcons.instagram,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
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

class DroppingButtonSmall extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const DroppingButtonSmall({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(246, 67, 67, 0.2),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(12),
              ),
            ),
          ),
        ),
        Align(
          alignment: const Alignment(0, 5),
          child: ButtonSmall(
            text: text,
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}

class ButtonSmall extends StatelessWidget {
  const ButtonSmall({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 1.0,
          )),
          backgroundColor: MaterialStateProperty.all(Colors.red),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          )),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
