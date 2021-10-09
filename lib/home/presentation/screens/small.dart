import 'package:cbakes/checkout/presentation/checkout.dart';
import 'package:cbakes/core/application/providers.dart';
import 'package:cbakes/core/dormain/food_item.dart';
import 'package:cbakes/core/presentation/widgets/helper.dart';
import 'package:cbakes/core/presentation/widgets/marquee.dart';
import 'package:cbakes/home/presentation/widgets/buttons.dart';
import 'package:cbakes/home/presentation/widgets/items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SmallHomePage extends ConsumerWidget {
  const SmallHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final widthFactor = size / 7;
    final headerSize = size * 0.1;

    final double widthPropotions = size / 10;
    final double heightPropotions = height / 10;
    final double sideBarWidth = widthPropotions * 2.5;
    final double mainPadding = size / 40;
    final bool smallScreen = size < 860;

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
                                  text: "BAKERY",
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
                        child: Padding(
                          padding: EdgeInsets.only(left: size / 14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "The best ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(fontSize: headerSize),
                                  ),
                                  Text(
                                    "food service",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(fontSize: headerSize),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "for ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1!
                                          .copyWith(fontSize: headerSize),
                                      children: [
                                        TextSpan(
                                          text: "Everybody",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                color: const Color.fromRGBO(
                                                    246, 67, 67, 1),
                                                fontStyle: FontStyle.italic,
                                                fontSize: headerSize,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              ButtonMain.activeLight(
                                text: "explore bakery",
                                textSize: 13,
                                onPressed: () => ref
                                    .read(servedPageProvider.notifier)
                                    .setCheckoutBread(),
                              ),
                            ],
                          ),
                        ),
                      ),
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
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                          onPressed: null,
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          child: const Icon(
                            MdiIcons.cart,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              width: widthFactor * 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      bottom: 16.0,
                      left: 8.0,
                    ),
                    child: Text(
                      "Stock Overview",
                      style: TextStyle(
                        color: Color.fromRGBO(51, 70, 91, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: foodItems.length > 7 ? 7 : foodItems.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                        width: (widthFactor / 3),
                      ),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return SmallItemSmall(
                          foodItem: foodItems[index],
                        );
                      },
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
