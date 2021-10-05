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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey paymentMethodKey1 = GlobalKey();
    final GlobalKey paymentMethodKey2 = GlobalKey();
    final GlobalKey paymentMethodKey3 = GlobalKey();

    ref.watch(activeProvider.notifier).setActive(paymentMethodKey1);
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ButtonMain(
                                text: "Collect",
                                backgroundColor: Colors.white,
                                textColor: Colors.black,
                              ),
                              ButtonMain(
                                text: "Delivery",
                                backgroundColor: Colors.white,
                                textColor: Colors.black,
                              ),
                              ButtonMain(
                                text: "Eat there",
                                backgroundColor: Theme.of(context).buttonColor,
                                textColor: const Color.fromRGBO(246, 67, 67, 1),
                              ),
                            ],
                          )
                        ],
                      ),
                      CheckoutCaptionText(
                        caption: "4000frs",
                        color: Colors.black,
                        fontSize: 28,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CheckoutCaptionText(
                            caption: "Enter Your Phone Number",
                            color: Colors.black,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: widthPropotions * 2,
                                height: 50,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(8.0),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: const Color.fromRGBO(
                                            246, 67, 67, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                              ButtonMain(
                                text: "PROCEED",
                                backgroundColor: Theme.of(context).accentColor,
                                textColor: Colors.white,
                                textSize: 18,
                              ),
                            ],
                          ),
                        ],
                      )
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
