import 'package:cbakes/checkout/application/notifiers/checkout_state_notifiers.dart';
import 'package:cbakes/checkout/application/providers.dart';
import 'package:cbakes/checkout/presentation/checkout_dialogue.dart';
import 'package:cbakes/checkout/presentation/widgets/helpers.dart';
import 'package:cbakes/core/application/providers.dart';
import 'package:cbakes/core/dormain/food_item.dart';
import 'package:cbakes/core/presentation/widgets/helper.dart';
import 'package:cbakes/checkout/presentation/widgets/items.dart';
import 'package:cbakes/core/presentation/widgets/marquee.dart';
import 'package:cbakes/home/presentation/widgets/buttons.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class CheckoutPage extends StatelessWidget {
//   const CheckoutPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (BuildContext context, BoxConstraints constraint) {
//         final double width = constraint.maxWidth;
//         final double height = constraint.maxHeight;
//         final double widthPropotions = width / 10;
//         final double heightPropotions = height / 10;
//         final double sideBarWidth = widthPropotions * 2.5;
//         final double mainPadding = width / 40;
//         final bool smallScreen = width < 860;
//         return Scaffold(
//           body: SafeArea(
//             child: Column(
//               children: [
//                 const Expanded(
//                   flex: 1,
//                   child: AppMarquee(),
//                 ),
//                 CheckoutLarge(
//                     mainPadding: mainPadding,
//                     smallScreen: smallScreen,
//                     widthPropotions: widthPropotions,
//                     sideBarWidth: sideBarWidth,
//                     heightPropotions: heightPropotions),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

class CheckoutLarge extends ConsumerWidget {
  const CheckoutLarge({
    Key? key,
    required this.mainPadding,
    required this.smallScreen,
    required this.widthPropotions,
    required this.sideBarWidth,
    required this.heightPropotions,
  }) : super(key: key);

  final double mainPadding;
  final bool smallScreen;
  final double widthPropotions;
  final double sideBarWidth;
  final double heightPropotions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodItems = FoodItem.items;
    final sideFoodItem = ref.watch(sideFoodItemProvider);
    return Expanded(
      flex: 9,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: mainPadding,
                      left: mainPadding,
                      right: mainPadding,
                    ),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).colorScheme.secondary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child: Image.asset(
                          "assets/images/bread.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: mainPadding,
                    ),
                    child: SingleChildScrollView(
                      child: Wrap(
                        spacing: mainPadding,
                        runSpacing: mainPadding,
                        children: [
                          for (FoodItem item in foodItems)
                            CheckoutItem(item: item),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: smallScreen ? (widthPropotions * 10) / 7 : sideBarWidth,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 80.0),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(30),
                        ),
                      ),
                      child: smallScreen
                          ? Container()
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.all(20.0),
                                    child: ItemHeading(
                                      text: "Order menu",
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: sideBarWidth,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        for (SideFoodItem item
                                            in sideFoodItem.items)
                                          SideItem(
                                            item: item,
                                            widthFactor: sideBarWidth,
                                            index: sideFoodItem.items
                                                .indexOf(item),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: ItemHeading(
                                    text:
                                        "Total: ${sideFoodItem.totalPrice}frs",
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                  if (smallScreen)
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: HamBurger.small(0),
                      ),
                    )
                  else
                    Positioned(
                      top: 20,
                      left: widthPropotions / 4,
                      right: widthPropotions / 4,
                      child: SizedBox(
                        width: sideBarWidth - (widthPropotions / 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            GestureDetector(
                              onTap: () => ref
                                  .read(servedPageProvider.notifier)
                                  .setHome(),
                              child: const Icon(
                                Icons.home,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                            HamBurger.large(40),
                          ],
                        ),
                      ),
                    ),
                  smallScreen
                      ? const Align(
                          alignment: Alignment.bottomCenter,
                          child: CartButton(),
                        )
                      : Align(
                          alignment: AlignmentDirectional.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 40.0),
                            child: ButtonMain(
                              text: "checkout",
                              backgroundColor:
                                  const Color.fromRGBO(254, 236, 236, 1),
                              textColor: const Color.fromRGBO(246, 67, 67, 1),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => CheckoutDialogue(
                                    heightPropotions: heightPropotions,
                                    widthPropotions: widthPropotions,
                                    totalPrice: sideFoodItem.totalPrice ?? 0,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
