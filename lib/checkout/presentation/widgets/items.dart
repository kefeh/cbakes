import 'package:cbakes/checkout/application/notifiers/checkout_state_notifiers.dart';
import 'package:cbakes/checkout/application/providers.dart';
import 'package:cbakes/checkout/presentation/widgets/helpers.dart';
import 'package:cbakes/core/dormain/food_item.dart';
import 'package:cbakes/home/presentation/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CheckoutItem extends ConsumerWidget {
  const CheckoutItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final FoodItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 230,
      height: 300,
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: [
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Container(
                height: 215,
                width: 250,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 75,
                        child: Ratings(
                          size: 15,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      SizedBox(
                        height: 90,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ItemHeading(
                              text: item.name,
                              color: Colors.black,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                item.decription,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.rubik(
                                  color: Colors.black45,
                                  fontSize: 12,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        child: ItemPriceText(
                          color: Colors.black45,
                          text: "${item.price}frs",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: CircularImage(
              size: 150,
              imageUrl: item.imageUrl,
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: ButtonMain(
              text: "add to cart",
              backgroundColor: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                ref.read(sideFoodItemProvider.notifier).addSideItem(item);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SideItem extends ConsumerWidget {
  const SideItem({
    Key? key,
    required this.item,
    required this.widthFactor,
    required this.index,
  }) : super(key: key);

  final SideFoodItem item;
  final double widthFactor;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final widthSize = MediaQuery.of(context).size.width;
    final mediumSize = widthSize < 1200;

    final double width100 = (widthFactor / 4) < 100 ? 100 : widthFactor / 4;
    final sideNotifier = ref.read(sideFoodItemProvider.notifier);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
        vertical: 10,
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            height: width100 - 10,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white24,
                style: BorderStyle.solid,
                width: 2,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(100),
                bottomLeft: Radius.circular(100),
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: width100,
              ),
              child: Stack(
                alignment: AlignmentDirectional.centerStart,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ItemHeading(
                          text: item.name,
                          color: Colors.white,
                          fontSize: mediumSize ? 12 : 14,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ItemPriceText(
                                text: "${item.price}frs",
                                color: Colors.white60,
                                fontSize: mediumSize ? 11 : 14,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(right: mediumSize ? 8 : 50.0),
                              child: Text(
                                "${item.quantity}x",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: mediumSize ? 14 : 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  mediumSize
                      ? Align(
                          alignment: Alignment(-2, width100 == 100 ? 1.2 : 2.5),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CbIcons(
                                    icon: Icons.add,
                                    size: mediumSize ? 20 : 30,
                                    onTap: () {
                                      sideNotifier.addSideItem(item, index);
                                    }),
                                const SizedBox(
                                  width: 5,
                                ),
                                CbIcons(
                                    icon: MdiIcons.minus,
                                    size: mediumSize ? 20 : 30,
                                    onTap: () {
                                      sideNotifier.removeSideItem(index);
                                    }),
                              ],
                            ),
                          ),
                        )
                      : Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CbIcons(
                                    icon: Icons.add,
                                    size: mediumSize ? 25 : 30,
                                    onTap: () {
                                      sideNotifier.addSideItem(item, index);
                                    }),
                                CbIcons(
                                    icon: MdiIcons.minus,
                                    size: mediumSize ? 25 : 30,
                                    onTap: () {
                                      sideNotifier.removeSideItem(index);
                                    }),
                              ],
                            ),
                          ),
                        )
                ],
              ),
            ),
          ),
          CircularImage(
            size: width100,
            imageUrl: item.imageUrl,
          ),
        ],
      ),
    );
  }
}
