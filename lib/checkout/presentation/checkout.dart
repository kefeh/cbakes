import 'package:cbakes/checkout/presentation/widgets/helpers.dart';
import 'package:cbakes/core/presentation/widgets/helper.dart';
import 'package:cbakes/checkout/presentation/widgets/items.dart';
import 'package:cbakes/core/presentation/widgets/marquee.dart';
import 'package:cbakes/home/presentation/widgets/buttons.dart';
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
      final double sideBarWidth = widthPropotions * 2.5;
      final double mainPadding = width / 40;
      final bool smallScreen = width < 860;
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
                      width: smallScreen ? widthPropotions : sideBarWidth,
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
                                child: smallScreen
                                    ? Container()
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: ItemHeading(
                                                text: "Order menu",
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: sideBarWidth,
                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  SideItem(
                                                    headingText:
                                                        "Fufu and Njama Njama",
                                                    price: 1500,
                                                    quantity: 1,
                                                    widthFactor: sideBarWidth,
                                                  ),
                                                  SideItem(
                                                    headingText:
                                                        "Rice and Tomatoe sauce",
                                                    price: 2000,
                                                    quantity: 2,
                                                    widthFactor: sideBarWidth,
                                                  ),
                                                  SideItem(
                                                    headingText: "Riz saute",
                                                    price: 100,
                                                    quantity: 1,
                                                    widthFactor: sideBarWidth,
                                                  ),
                                                  SideItem(
                                                    headingText: "Fufu and Eru",
                                                    price: 5000,
                                                    quantity: 3,
                                                    widthFactor: sideBarWidth,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: ItemHeading(
                                              text: "Total: 4000frs",
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
                                right: 40,
                                child: HamBurger.large(40),
                              ),
                            smallScreen
                                ? Container()
                                : Align(
                                    alignment:
                                        AlignmentDirectional.bottomCenter,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 40.0),
                                      child: ButtonMain(
                                        text: "checkout",
                                        backgroundColor:
                                            Theme.of(context).buttonColor,
                                        textColor: const Color.fromRGBO(
                                            246, 67, 67, 1),
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (_) => AlertDialog(
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .accentColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                content: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Container(
                                                          width: 100,
                                                          height: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 100,
                                                          height: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 100,
                                                          height: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    20),
                                                            topRight:
                                                                Radius.circular(
                                                                    20),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                )),
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
              ),
            ],
          ),
        ),
      );
    });
  }
}
