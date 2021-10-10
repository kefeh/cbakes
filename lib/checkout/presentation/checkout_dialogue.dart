import 'package:cbakes/checkout/application/providers.dart';
import 'package:cbakes/checkout/dormain/delivery_options.dart';
import 'package:cbakes/checkout/dormain/pay_method_card.dart';
import 'package:cbakes/checkout/presentation/widgets/helpers.dart';
import 'package:cbakes/home/presentation/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CheckoutDialogue extends ConsumerWidget {
  const CheckoutDialogue({
    Key? key,
    required this.heightPropotions,
    required this.widthPropotions,
    required this.totalPrice,
  }) : super(key: key);

  final double heightPropotions;
  final double widthPropotions;
  final double totalPrice;

  void initialiseActive(WidgetRef ref, GlobalKey key) {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<DeliveryOption> deliveryOptions = DeliveryOption.options;
    final List<PayMethodCardItem> payMethodItems =
        PayMethodCardItem.payCardItems;

    final width = MediaQuery.of(context).size.width;
    final bool smallScreen = width <= 920;

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: heightPropotions * 7,
        width: widthPropotions * 7,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            SizedBox(
              height: heightPropotions * 2.5,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (PayMethodCardItem item in payMethodItems)
                      PayMethodCard(
                        widthPropotions: widthPropotions,
                        imageUrl: item.imageUrl,
                        caption: item.name,
                      )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular((20)),
                ),
                width: widthPropotions * 7,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: widthPropotions),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CheckoutCaptionText(
                            caption: "Choose Method",
                            color: Colors.black,
                          ),
                          Consumer(builder: (_, ref, __) {
                            final deliverActiveId =
                                ref.watch(activeDeliveryBtnProvider);
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  for (DeliveryOption option in deliveryOptions)
                                    deliverActiveId == option.name
                                        ? smallScreen
                                            ? ButtonMainSmall.active(
                                                text: option.name,
                                                onPressed: () {
                                                  ref
                                                      .read(
                                                          activeDeliveryBtnProvider
                                                              .notifier)
                                                      .setActive(option.name);
                                                },
                                                textSize: 12,
                                              )
                                            : ButtonMain.active(
                                                text: option.name,
                                                onPressed: () {
                                                  ref
                                                      .read(
                                                          activeDeliveryBtnProvider
                                                              .notifier)
                                                      .setActive(option.name);
                                                },
                                              )
                                        : smallScreen
                                            ? ButtonMainSmall.inActive(
                                                text: option.name,
                                                onPressed: () {
                                                  ref
                                                      .read(
                                                          activeDeliveryBtnProvider
                                                              .notifier)
                                                      .setActive(option.name);
                                                },
                                                textSize: 12,
                                              )
                                            : ButtonMain.inActive(
                                                text: option.name,
                                                onPressed: () {
                                                  ref
                                                      .read(
                                                          activeDeliveryBtnProvider
                                                              .notifier)
                                                      .setActive(option.name);
                                                },
                                              ),
                                ],
                              ),
                            );
                          })
                        ],
                      ),
                      CheckoutCaptionText(
                        caption: "${totalPrice}frs",
                        color: Colors.black,
                        fontSize: 28,
                      ),
                      Consumer(builder: (_, ref, __) {
                        final active = ref.watch(activeProvider);
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (active != (payMethodItems[0].name))
                              const CheckoutCaptionText(
                                caption: "Enter Your Phone Number",
                                color: Colors.black,
                              ),
                            smallScreen
                                ? Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      if (active != (payMethodItems[0].name))
                                        SizedBox(
                                          width: double.infinity,
                                          height: 50,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.all(8.0),
                                              border: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color.fromRGBO(
                                                      246, 67, 67, 1),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      ButtonMain.active(
                                        text: "PROCEED",
                                        textSize: 18,
                                      ),
                                    ],
                                  )
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      if (active != (payMethodItems[0].name))
                                        SizedBox(
                                          width: widthPropotions * 2,
                                          height: 50,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.all(8.0),
                                              border: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color.fromRGBO(
                                                      246, 67, 67, 1),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ButtonMain.active(
                                        text: "PROCEED",
                                        textSize: 18,
                                      ),
                                    ],
                                  ),
                          ],
                        );
                      })
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
