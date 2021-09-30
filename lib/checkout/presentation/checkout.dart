import 'package:cbakes/checkout/presentation/widgets/helpers.dart';
import 'package:cbakes/core/presentation/widgets/helper.dart';
import 'package:cbakes/checkout/presentation/widgets/items.dart';
import 'package:cbakes/core/presentation/widgets/marquee.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraint) {
      final double width = constraint.maxWidth;
      final double widthPropotions = width / 10;
      final double mainPadding = width / 40;
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: AppMarquee(),
              ),
              Expanded(
                flex: 9,
                child: Row(
                  children: [
                    Container(
                      width: widthPropotions * 7.5,
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
                                    color: Theme.of(context).accentColor,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
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
                                    CheckoutItem(),
                                    CheckoutItem(),
                                    CheckoutItem(),
                                    CheckoutItem(),
                                    CheckoutItem(),
                                    CheckoutItem(),
                                    CheckoutItem(),
                                    CheckoutItem(),
                                    CheckoutItem(),
                                    CheckoutItem(),
                                    CheckoutItem(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: widthPropotions * 2.5,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 80.0),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).accentColor,
                                  borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(30),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    SideItem(
                                      headingText: "Fufu and Njama Njama",
                                      price: 1500,
                                      quantity: 1,
                                    ),
                                    SideItem(
                                      headingText: "Rice and Tomatoe sauce",
                                      price: 2000,
                                      quantity: 2,
                                    ),
                                    SideItem(
                                      headingText: "Riz saute",
                                      price: 100,
                                      quantity: 1,
                                    ),
                                    SideItem(
                                      headingText: "Fufu and Eru",
                                      price: 5000,
                                      quantity: 3,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: HamBurger.large(40),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
