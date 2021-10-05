import 'package:cbakes/checkout/application/providers.dart';
import 'package:cbakes/checkout/presentation/widgets/helpers.dart';
import 'package:cbakes/home/presentation/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CheckoutDialogue extends ConsumerWidget {
  const CheckoutDialogue({
    Key? key,
    required this.heightPropotions,
    required this.widthPropotions,
  }) : super(key: key);

  final double heightPropotions;
  final double widthPropotions;

  void initialiseActive(WidgetRef ref, GlobalKey key) {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey paymentMethodKey1 = GlobalKey();
    final GlobalKey paymentMethodKey2 = GlobalKey();
    final GlobalKey paymentMethodKey3 = GlobalKey();

    ref.watch(activeProvider.notifier).setActive(paymentMethodKey1);
    ref.watch(activeDeliveryBtnProvider.notifier).setActive("Collect");

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: heightPropotions * 7,
        width: widthPropotions * 7,
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Container(
              height: heightPropotions * 2.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PayMethodCard(
                    key: paymentMethodKey1,
                    widthPropotions: widthPropotions,
                    imageUrl: "assets/images/hand.png",
                    caption: "PAY PHYSICALLY",
                  ),
                  PayMethodCard(
                    key: paymentMethodKey2,
                    widthPropotions: widthPropotions,
                    imageUrl: "assets/images/momo.png",
                    caption: "MTN MOMO",
                  ),
                  PayMethodCard(
                    key: paymentMethodKey3,
                    widthPropotions: widthPropotions,
                    imageUrl: "assets/images/orange.png",
                    caption: "ORANGE MOMO",
                  ),
                ],
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
                          CheckoutCaptionText(
                            caption: "Choose Method",
                            color: Colors.black,
                          ),
                          Consumer(builder: (_, ref, __) {
                            final deliverActiveId =
                                ref.watch(activeDeliveryBtnProvider);
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                deliverActiveId == "Collect"
                                    ? ButtonMain.active(
                                        text: "Collect",
                                      )
                                    : ButtonMain.inActive(
                                        text: "Collect",
                                      ),
                                deliverActiveId == "Delivery"
                                    ? ButtonMain.active(
                                        text: "Delivery",
                                      )
                                    : ButtonMain.inActive(
                                        text: "Delivery",
                                      ),
                                deliverActiveId == "Eat there"
                                    ? ButtonMain.active(
                                        text: "Eat there",
                                      )
                                    : ButtonMain.inActive(
                                        text: "Eat there",
                                      ),
                              ],
                            );
                          })
                        ],
                      ),
                      CheckoutCaptionText(
                        caption: "4000frs",
                        color: Colors.black,
                        fontSize: 28,
                      ),
                      Consumer(builder: (_, ref, __) {
                        final active = ref.watch(activeProvider);
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (active != (paymentMethodKey1))
                              CheckoutCaptionText(
                                caption: "Enter Your Phone Number",
                                color: Colors.black,
                              ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                if (active != (paymentMethodKey1))
                                  Container(
                                    width: widthPropotions * 2,
                                    height: 50,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.all(8.0),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: const Color.fromRGBO(
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
